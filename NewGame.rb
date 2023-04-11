def callNewGame()
    attackDie = Die.new(6,[Pip.new(0,"null"),Pip.new(1,"attack"),Pip.new(1,"attack"),
        Pip.new(2,"attack"),Pip.new(2,"attack"),Pip.new(3,"attack")],2)
    defenseDie = Die.new(6,[Pip.new(0,"null"),Pip.new(1,"defense"),Pip.new(1,"defense"),
            Pip.new(2,"defense"),Pip.new(2,"defense"),Pip.new(3,"defense")],2)
    supportDie = Die.new(4,[Pip.new(0,"null"),Pip.new(1,"heal"),Pip.new(1,"defense"),
        Pip.new(1,"attack")],1)
    $hero = Person.new(10, 3, [], [attackDie, defenseDie, supportDie])
    slowPrint("Hero stats:\n")
    slowPrint($hero.getStringStatsNoStatus)
    slowPrint("Hero dice:\n")
    slowPrint($hero.getStringDice)
    print "\n"
    choice = 0
    while choice == 0
        slowPrint("Are you ready to start a new adventure?\n")
        slowPrint("1 - Yes\n")
        slowPrint("2 - No\n")
        choice = getPlayerChoice()
        if choice == 1
            $gameloop = 4
        elsif choice == 2
            $gameloop = 1
        else
            choice = 0
            print "\n"
        end
    end
end