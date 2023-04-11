def callFight()
    chosenDice = []
    if $loadingGame == 0
        $fightState = 0
        $enemyRoll = 0
    end
    if $fightState == 0
        $hero.reset
        $enemy = generateEnemy()
        slowPrint("Enemy: \n")
        slowPrint($enemy.getStringStatsNoHandSizeNoDice)
        print "\n"
        slowPrint("Enemy die: \n")
        slowPrint($enemy.getStringDice)
        print "\n"
        slowPrint("Hero: \n")
        slowPrint($hero.getStringStats)
        print "\n"
        slowPrint("Your dice:\n")
        slowPrint($hero.getStringDice)
        print "\n"
        slowPrint("The battle begins!\n\n")
        $fightState = 1
    end
    if $loadingGame == 0
        $allTurns += 1
    end
    while $hero.getCurrentHP > 0 && $enemy.getCurrentHP > 0
        print($fightState)
        if $loadingGame == 0
            $enemyRoll = $enemy.getDice[0].roll
        end
        $loadingGame = 0
        while $fightState == 1
            slowPrint("Enemy roll result: " + $enemyRoll.getType + " " + $enemyRoll.getValue.to_s + "\n")
            slowPrint("1 - pick dice\n")
            slowPrint("2 - show my stats\n")
            slowPrint("3 - show enemy stats\n")
            slowPrint("4 - save game\n")
            slowPrint("0 - exit\n")
            choice = getPlayerChoice()
            if choice == 0
                $gameloop = 0
                return
            elsif choice == 2
                slowPrint("Hero:\n")
                slowPrint($hero.getStringStats)
                slowPrint("\nDice:\n")
                slowPrint($hero.getStringDice)
            elsif choice == 3
                slowPrint("Enemy:\n")
                slowPrint($enemy.getStringStats)
                slowPrint("\nDice:\n")
                slowPrint($enemy.getStringDice)
            elsif choice == 4
                callSaveGame()
            elsif choice == 1
                chosenDice = pickDice()
                $fightState = 2
            end
        end
        rerolls = 3
        results = []
        while $fightState == 2
            slowPrint("Enemy roll result: " + $enemyRoll.getType + " " + $enemyRoll.getValue.to_s + "\n")
            printChosenDice(chosenDice)
            results = []
            chosenDice.each do |n|
                results << $hero.getDice[n].roll
            end
            slowPrint("Results of your rolls:\n")
            results.each do |n|
                slowPrint(n.getText+"\n")
            end
            if rerolls > 0
                slowPrint("Rerolls left: " + rerolls.to_s + "\n")
                choice = 0
                while choice == 0
                    slowPrint("Accept results?\n")
                    slowPrint("1 - yes\n")
                    slowPrint("2 - no\n")
                    choice = getPlayerChoice()
                    if choice == 1
                        $fightState = 3
                    elsif choice == 2
                        rerolls -= 1
                    else
                        choice = 0
                    end
                end
            else
                $fightState = 3
            end
        end
        while $fightState == 3
            playerAttack = 0
            playerDefense = 0
            playerHeal = 0
            enemyAttack = 0
            enemyDefense = 0
            enemyHeal = 0
            if $enemyRoll.getType == "attack"
                enemyAttack = $enemyRoll.getValue
            elsif $enemyRoll.getType == "defense"
                enemyDefense = $enemyRoll.getValue
            elsif $enemyRoll.getType == "heal"
                enemyHeal = $enemyRoll.getValue
            end
            results.each do |n|
                if n.getType == "attack"
                    playerAttack += n.getValue
                elsif n.getType == "defense"
                    playerDefense += n.getValue
                elsif n.getType == "heal"
                    playerHeal += n.getValue
                end
            end
            enemyHurt = playerAttack - enemyDefense
            heroHurt = enemyAttack - playerDefense
            if enemyHurt < 0
                enemyHurt = 0
            end
            if heroHurt < 0
                heroHurt = 0
            end

            $enemy.heal(enemyHeal)
            $hero.heal(playerHeal)
            $enemy.hurt(enemyHurt)
            $hero.hurt(heroHurt)
            $fightState = 1

        end
    end
    if $enemy.getCurrentHP <= 0
        $score+=1
        slowPrint("You've defeated the enemy!\n")
        textBreak()
        $gameloop = 5
    end
    if $hero.getCurrentHP <= 0
        slowPrint("Unfortunately you've been killed.\n")
        slowPrint("Your final score is: " + $score.to_s + "\n")
        textBreak()
        $gameloop = 1
    end
end