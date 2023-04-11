def slowPrint(text)
    letters = text.split('')
    letters.each do |c|
        print c
        sleep(0.001)
    end
end

def textBreak()
    slowPrint("Press any button to continue\n")
    STDIN.getch                                                                                                              
    print "            \r"
end

def cleanScreen()
    system "clear"
    system "cls"
end

def printEmptyLines(amount)
    while amount > 0
        print "\n"
        amount -= 1
    end
end

def getPlayerChoice()
    choice = gets.chomp
    choice = choice.to_i
    return choice
end

def generateEnemy()
    enemyDie = Die.new(8,[Pip.new(0,"null"),Pip.new(1,"attack"),Pip.new(1,"attack"),Pip.new(1,"attack"),
        Pip.new(1,"attack"),Pip.new(2,"attack"),Pip.new(2,"attack"),Pip.new(3,"attack")],1)
    enemy = Person.new(10, 1, [], [enemyDie])
    return enemy
end

def pickDice()
    chosen = []
    chosenWeight = 0
    picking = 0
    choice = 0
    while picking == 0
        choice = 0
        leftWeight = $hero.getHandSize - chosenWeight
        slowPrint("Dice:\n")
        slowPrint($hero.getStringDice)
        slowPrint("Chosen dice = " + chosen.to_s + "\n")
        slowPrint("Left space in hand = " + leftWeight.to_s + "\n")
        while choice == 0
            slowPrint("1 - add die\n")
            slowPrint("2 - remove die\n")
            slowPrint("3 - finish picking dice\n")
            choice = getPlayerChoice()
            if choice == 1
                slowPrint("Enter nr of the die: ")
                choice = getPlayerChoice()
                print "\n"
                if chosen.include?(choice)
                    slowPrint("This die has already been chosen.\n")
                elsif choice >= $hero.getDice.length() || choice < 0
                    slowPrint("This die doesn't exist.\n")
                else
                    temp = chosenWeight + $hero.getDice[choice].getWeight
                    if temp > $hero.getHandSize
                        slowPrint("This die is too heavy\n")
                    else
                        chosenWeight = temp
                        chosen << choice
                    end
                end
                choice = 0
            elsif choice == 2
                slowPrint("Enter nr of the die: ")
                choice = getPlayerChoice()
                print "\n"
                if chosen.include?(choice)
                    chosenWeight -= $hero.getDice[choice].getWeight
                    chosen.delete(choice)
                else
                    slowPrint("This die hasn't been chosen.\n")
                end
                choice = 0
            elsif choice == 3
                return chosen
            else
                choice = 0
            end
        end
    end
end

def printChosenDice(chosenDice)
    slowPrint("Chosen dice:\n")
    chosenDice.each do |n|
        slowPrint($hero.getDice[n].getText)
    end
end