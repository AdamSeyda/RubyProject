def callSaveGame()
    slowPrint("Enter number 1-10 to pick savefile to write into.\n")
    slowPrint("Remember that all data on the file will be rewritten.\n")
    slowPrint("You can enter anything else to cancel saving the game.\n")
    choice = getPlayerChoice()
    case choice
    when 1 .. 10
        fileName = "./savefile" + choice.to_s + ".txt"
        File.write(fileName, $score.to_s+"\n")
        File.write(fileName, $turnsThisBattle.to_s+"\n", mode: "a")
        File.write(fileName, $allTurns.to_s+"\n", mode: "a")
        File.write(fileName, $enemyRoll.getValue.to_s+"\n", mode: "a")
        File.write(fileName, $enemyRoll.getType.to_s+"\n", mode: "a")
        File.write(fileName, $hero.getMaxHP.to_s+"\n", mode: "a")
        File.write(fileName, $hero.getCurrentHP.to_s+"\n", mode: "a")
        File.write(fileName, $hero.getHandSize.to_s+"\n", mode: "a")
        File.write(fileName, $hero.getStatuses.join("\n").to_s+"\n", mode: "a")
        File.write(fileName, "aaaaa\n", mode: "a")
        File.write(fileName, $hero.getPerks.join("\n").to_s+"\n", mode: "a")
        File.write(fileName, "aaaaa\n", mode: "a")
        dice = $hero.getDice
        for die in dice do
            File.write(fileName, die.getSides.to_s+"\n", mode: "a")
            pips = die.getBasePips
            for pip in pips do
                File.write(fileName, pip.getValue.to_s+"\n", mode: "a")
                File.write(fileName, pip.getType.to_s+"\n", mode: "a")
            end
            File.write(fileName, "aaaaa\n", mode: "a")
            pips = die.getCurrentPips
            for pip in pips do
                File.write(fileName, pip.getValue.to_s+"\n", mode: "a")
                File.write(fileName, pip.getType.to_s+"\n", mode: "a")
            end
            File.write(fileName, "aaaaa\n", mode: "a")
            File.write(fileName, die.getWeight.to_s+"\n", mode: "a")
        end
        File.write(fileName, "aaaaa\n", mode: "a")
        File.write(fileName, $enemy.getMaxHP.to_s+"\n", mode: "a")
        File.write(fileName, $enemy.getCurrentHP.to_s+"\n", mode: "a")
        File.write(fileName, $enemy.getHandSize.to_s+"\n", mode: "a")
        File.write(fileName, $enemy.getStatuses.join("\n").to_s+"\n", mode: "a")
        File.write(fileName, "aaaaa\n", mode: "a")
        File.write(fileName, $enemy.getPerks.to_s+"\n", mode: "a")
        File.write(fileName, "aaaaa\n", mode: "a")
        dice = $enemy.getDice
        for die in dice do
            File.write(fileName, die.getSides.to_s+"\n", mode: "a")
            pips = die.getBasePips
            for pip in pips do
                File.write(fileName, pip.getValue.to_s+"\n", mode: "a")
                File.write(fileName, pip.getType.to_s+"\n", mode: "a")
            end
            File.write(fileName, "aaaaa\n", mode: "a")
            pips = die.getCurrentPips
            for pip in pips do
                File.write(fileName, pip.getValue.to_s+"\n", mode: "a")
                File.write(fileName, pip.getType.to_s+"\n", mode: "a")
            end
            File.write(fileName, "aaaaa\n", mode: "a")
            File.write(fileName, die.getWeight.to_s+"\n", mode: "a")
        end
        File.write(fileName, "aaaaa\n", mode: "a")
        slowPrint("Game saved!\n")
    end
end