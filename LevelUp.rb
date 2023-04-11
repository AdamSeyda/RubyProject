def callLevelUp()
    picking = 0
    while picking == 0
        slowPrint("Pick one\n")
        slowPrint("1 - chosen pip +1\n")
        slowPrint("2 - change chosen pip type\n")
        slowPrint("3 - raise max hp by " + $score.to_s + "\n")
        choice = getPlayerChoice()
        if choice == 1 || choice == 2 || choice == 3
            picking = 1
        end
    end
    while choice == 1
        slowPrint($hero.getStringDice)
        slowPrint("Pick die to upgrade one of its pips\n")
        choice = getPlayerChoice()
        if choice >= 0 && choice < $hero.getDice.length()
            picking = 0
            while picking == 0
                slowPrint($hero.getDice[choice].getText)
                slowPrint("Pick pip\n")
                pickedPip = getPlayerChoice()
                if pickedPip >= 0 && pickedPip < $hero.getDice[choice].getSides
                    picking = 1
                    upgradedPip = $hero.getDice[choice].getBasePip(pickedPip)
                    upgradedValue = upgradedPip.getValue + 1
                    upgradedPip.setValue(upgradedValue)
                    $hero.getDice[choice].setBasePip(pickedPip, upgradedPip)
                end
            end
            choice = 0
        else
            choice = 1
        end
    end
    while choice == 2
        slowPrint($hero.getStringDice)
        slowPrint("Pick die to change type of one of its pips\n")
        choice = getPlayerChoice()
        if choice >= 0 && choice < $hero.getDice.length()
            picking = 0
            while picking == 0
                slowPrint($hero.getDice[choice].getText)
                slowPrint("Pick pip\n")
                pickedPip = getPlayerChoice()
                if pickedPip >= 0 && pickedPip < $hero.getDice[choice].getSides
                    while picking == 0
                        slowPrint("Pick type\n")
                        slowPrint("1 - attack\n")
                        slowPrint("2 - defense\n")
                        slowPrint("3 - heal\n")
                        pickedType = getPlayerChoice()
                        if pickedType == 1 || pickedType == 2 || pickedType == 3
                            changedPip = $hero.getDice[choice].getBasePip(pickedPip)
                            if pickedType == 1
                                changedPip.setType("attack")
                            elsif pickedType == 2
                                changedPip.setType("defense")
                            elsif pickedType == 3
                                changedPip.setType("heal")
                            end
                            $hero.getDice[choice].setBasePip(pickedPip, changedPip)
                            picking = 1
                        end
                    end
                end
            end
            choice = 0
        else
            choice = 2
        end
    end
    if choice == 3
        $hero.setMaxHP($hero.getMaxHP+$score)
    end
    $gameloop = 4
end