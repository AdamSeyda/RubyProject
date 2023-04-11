class Pip
    @value
    @type

    def initialize(value, type)
        @value=value
        @type=type
    end

    def printMe
        print @type.to_s + " " + @value.to_s
    end
    def getText
        return @type.to_s + " " + @value.to_s
    end

    def getValue
        return @value
    end
    def setValue(value)
        @value = value
    end
    def getType
        return @type
    end
    def setType(type)
        @type = type
    end

    def getRollEffects
        print "Roll effects are not implemented yet /n"
    end
end