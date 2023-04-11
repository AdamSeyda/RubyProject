def callMainMenu()
    slowPrint("Welcome to DiceWarriors version " + $gameVersion + "!\n")
    print "\n"
    slowPrint("1 - Start new game\n")
    slowPrint("2 - Load game\n")
    slowPrint("0 - Exit game\n")
    choice = getPlayerChoice()
    # gameloop state description:
    # 0 - exiting the game
    # 1 - main menu
    # 2 - starting new game
    # 3 - loading game
    if choice == 0
        $gameloop = 0
        return
    elsif choice == 1
        $gameloop = 2
        return
    elsif choice == 2
        $gameloop = 3
        return
    else
        $gameloop = 1
        return
    end
end