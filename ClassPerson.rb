class Person
    @maxHP
    @currentHP
    @statuses
    @handSize
    @perks
    @dice

    def initialize(maxHP, handSize, perks, dice)
        @maxHP = maxHP
        @currentHP = @maxHP
        @statuses = []
        @handSize = handSize
        @perks =  perks
        @dice = dice
    end

    def reset
        @currentHP = @maxHP
        @statuses = []
        @dice.each do |n|
            n.reset
        end
    end

    def heal(hp)
        @currentHP += hp
    end

    def hurt(hp)
        @currentHP -= hp
    end

    def printDice
        temp = @dice.length() - 1
        while temp >= 0
            print "die " + temp.to_s + ":\n"
            @dice[temp].printMe
            print "\n"
            temp -= 1
        end
    end
    def printStatsNoStatus
        print "HP: " + @currentHP.to_s + "/" + @maxHP.to_s + "\n"
        print "Hand size: " + @handSize.to_s + "\n"
        print "Dice: " + @dice.length().to_s + "\n"
    end
    def printStatsNoHandSizeNoDice
        print "HP: " + @currentHP.to_s + "/" + @maxHP.to_s + "\n"
        print "Statuses: \n"
    end
    def printStats
        print "HP: " + @currentHP.to_s + "/" + @maxHP.to_s + "\n"
        print "Hand size: " + @handSize.to_s + "\n"
        print "Dice: " + @dice.length().to_s + "\n"
        print "Statuses: \n"
    end
    def getStringDice
        temp = @dice.length() - 1
        text = ""
        while temp >= 0
            text += "die " 
            text += temp.to_s 
            text += ":\n"
            text += @dice[temp].getText
            text += "\n"
            temp -= 1
        end
        return text
    end
    def getStringStatsNoStatus
        text = "HP: " + @currentHP.to_s + "/" + @maxHP.to_s + "\n"
        text += "Hand size: " + @handSize.to_s + "\n"
        text += "Dice: " + @dice.length().to_s + "\n"
        return text
    end
    def getStringStatsNoHandSizeNoDice
        text = "HP: " + @currentHP.to_s + "/" + @maxHP.to_s + "\n"
        text += "Statuses: \n"
        return text
    end
    def getStringStats
        text = "HP: " + @currentHP.to_s + "/" + @maxHP.to_s + "\n"
        text += "Hand size: " + @handSize.to_s + "\n"
        text += "Dice: " + @dice.length().to_s + "\n"
        text += "Statuses: \n"
        return text
    end

    def addStatus(status)
        @statuses << status
    end
    def addPerk(perk)
        @perks << perk
    end
    def removeStatus(status)
        @statuses.delete(status)
    end
    def removePerk(perk)
        @perks.delete(perk)
    end

    def getMaxHP
        return @maxHP
    end
    def setMaxHP(maxHP)
        @maxHP = maxHP
    end
    def getCurrentHP
        return @currentHP
    end
    def setCurrentHP(currentHP)
        @currentHP = currentHP
    end
    def getStatuses
        return @statuses
    end
    def setStatuses(statuses)
        @statuses = statuses
    end
    def getHandSize
        return @handSize
    end
    def setHandSize(handSize)
        @handSize = handSize
    end
    def getPerks
        return @perks
    end
    def setPerks(perks)
        @perks = perks
    end
    def getDice
        return @dice
    end
    def setDice(dice)
        @dice = dice
    end
    def addDie(die)
        @dice << die
    end
end
    