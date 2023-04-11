class Die
    @sides
    @pipsBase
    @pipsCurrent
    @weight

    def initialize(sides, pips, weight)
        @sides = sides
        @pipsBase = pips
        @pipsCurrent = pips
        @weight = weight
    end

    def reset
        @pipsCurrent = @pipsBase
        @sides = @pipsBase.length()
    end

    def printMe
        print "Weight: " + @weight.to_s + "\n"
        temp = @sides - 1
        while temp >= 0
            print temp.to_s + " - " + @pipsCurrent[temp].getText + "\n"
            temp -= 1
        end
    end
    def getText
        text = "Weight: " + @weight.to_s + "\n"
        temp = @sides - 1
        while temp >= 0
            temp2 = temp.to_s + " - " + @pipsCurrent[temp].getText + "\n"
            text += temp2
            temp -= 1
        end
        return text
    end

    def getSides
        return @sides
    end
    def setSides(sides)
        @sides = sides
    end
    def getCurrentPip(side)
        if side > @sides || side < 1
            print "Side does not exist"
        else
            return @pipsCurrent[side]
        end
    end
    def setCurrentPip(side, pip)
        if side > @sides || side < 1
            print "Side does not exist"
        else
            @pipsCurrent[side] = pip
        end
    end
    def getBasePip(side)
        if side > @sides || side < 0
            print "Side does not exist"
        else
            return @pipsBase[side]
        end
    end
    def setBasePip(side, pip)
        if side > @sides || side < 1
            print "Side does not exist"
        else
            @pipsBase[side] = pip
        end
    end
    def getBasePips
        return @pipsBase
    end
    def setBasePips(pips)
        @pipsBase = pips
    end
    def getCurrentPips
        return @pipsBase
    end
    def setCurrentPips(pips)
        @pipsCurrent = pips
    end
    def getWeight
        return @weight
    end
    def setWeight(weight)
        @weight = weight
    end

    def roll
        roll = rand(@sides)
        return @pipsCurrent[roll]
    end
end