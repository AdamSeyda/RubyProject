def callLoadGame()
    $loadingGame = 1
    slowPrint("Enter number 1-10 to pick savefile to load.\n")
    slowPrint("You can enter anything else to cancel saving the game.\n")
    choice = getPlayerChoice()
    case choice
    when 1 .. 10
        $fightState = 1
        fileName = "./savefile" + choice.to_s + ".txt"
        file_data = File.read(fileName).split
        $score = file_data[0].to_i
        $turnsThisBattle = file_data[1].to_i
        $allTurns = file_data[2].to_i
        $enemyRoll.setValue(file_data[3].to_i)
        $enemyRoll.setType(file_data[4])
        $hero = Person.new(10, 3, [], [])
        $hero.setMaxHP(file_data[5].to_i)
        $hero.setCurrentHP(file_data[6].to_i)
        $hero.setHandSize(file_data[7].to_i)
        file_data = file_data.drop(8)
        temp = 0
        while file_data[temp] != "aaaaa"
            $hero.addStatus(file_data[temp])
            temp += 1
        end
        temp += 1
        file_data = file_data.drop(temp)
        temp = 0
        while file_data[temp] != "aaaaa"
            $hero.addPerk(file_data[temp])
            temp += 1
        end
        temp += 1
        file_data = file_data.drop(temp)
        temp = 0
        loadingDice = 0
        
        while loadingDice == 0
            tempSides = 0
            tempPipsBase = []
            tempPipsCurrent = []
            tempPipValue = 0
            tempPipType = ""
            tempWeight = 0
            tempSides = file_data[temp].to_i
            temp += 1
            while file_data[temp] != "aaaaa"
                if temp.even?
                    tempPipType = file_data[temp].to_s
                    tempPipsBase << Pip.new(tempPipValue, tempPipType)
                    temp+=1
                else
                    tempPipValue = file_data[temp].to_i
                    temp+=1
                end
            end
            temp+=1
            file_data = file_data.drop(temp)
            temp = 0
            while file_data[temp] != "aaaaa"
                if temp.even?
                    tempPipValue = file_data[temp].to_i
                    temp+=1
                else
                    tempPipType = file_data[temp]
                    tempPipsCurrent << Pip.new(tempPipValue, tempPipType)
                    temp+=1
                end
            end
            temp+=1
            file_data = file_data.drop(temp)
            temp = 0
            tempWeight = file_data[temp].to_i
            file_data = file_data.drop(1)
            tempDie = Die.new(tempSides, tempPipsBase, tempWeight)
            tempDie.setCurrentPips(tempPipsCurrent)
            $hero.addDie(tempDie)
            if file_data[temp] == "aaaaa"
                loadingDice = 1
            end
        end

        file_data = file_data.drop(1)

        $enemy = Person.new(10, 3, [], [])
        $enemy.setMaxHP(file_data[0].to_i)
        $enemy.setCurrentHP(file_data[1].to_i)
        $enemy.setHandSize(file_data[2].to_i)
        file_data = file_data.drop(3)
        temp = 0
        while file_data[temp] != "aaaaa"
            $enemy.addStatus(file_data[temp])
            temp += 1
        end
        temp += 1
        file_data = file_data.drop(temp)
        temp = 0
        while file_data[temp] != "aaaaa"
            $enemy.addPerk(file_data[temp])
            temp += 1
        end
        temp += 1
        file_data = file_data.drop(temp)
        temp = 0
        loadingDice = 0
        while loadingDice == 0
            tempSides = 0
            tempPipsBase = []
            tempPipsCurrent = []
            tempPipValue = 0
            tempPipType = ""
            tempWeight = 0
            tempSides = file_data[temp].to_i
            temp += 1
            while file_data[temp] != "aaaaa" && !file_data.empty?
                if temp.even?
                    tempPipType = file_data[temp]
                    tempPipsBase << Pip.new(tempPipValue, tempPipType)
                    temp+=1
                else
                    tempPipValue = file_data[temp].to_i
                    temp+=1
                end
            end
            temp+=1
            file_data = file_data.drop(temp)
            temp = 0
            while file_data[temp] != "aaaaa"
                if temp.even?
                    tempPipValue = file_data[temp].to_i
                    temp+=1
                else
                    tempPipType = file_data[temp]
                    tempPipsCurrent << Pip.new(tempPipValue, tempPipType)
                    temp+=1
                end
            end
            temp+=1
            file_data = file_data.drop(temp)
            temp = 0
            tempWeight = file_data[temp].to_i
            file_data = file_data.drop(1)
            tempDie = Die.new(tempSides, tempPipsBase, tempWeight)
            tempDie.setCurrentPips(tempPipsCurrent)
            $enemy.addDie(tempDie)
            if file_data[temp] == "aaaaa" || file_data.empty?
                loadingDice = 1
            end
        end
        $gameloop = 4
    else
        $gameloop = 1
    end
end