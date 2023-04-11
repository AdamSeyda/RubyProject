require "./ClassPerson.rb"
require "./ClassPip.rb"
require "./ClassDie.rb"
require "./SaveGame.rb"
require "./LoadGame.rb"
require "./MainMenu.rb"
require "./NewGame.rb"
require "./Fight.rb"
require "./LevelUp.rb"
require "./HelpFunctions.rb"
require 'io/console'

$gameVersion = "1.1.0"
$gameloop = 1
# gameloop state description:
# 0 - exiting the game
# 1 - main menu
# 2 - starting new game
# 3 - loading game
# 4 - fight
# 5 - levelup
$score = 0
$turnsThisBattle = 0
$allTurns = 0
$loadingGame = 0
$hero
$fightState
$enemyRoll = Pip.new(0, "null")
$enemy

while $gameloop != 0
    if $gameloop == 1
        cleanScreen()
        callMainMenu()
    elsif $gameloop == 2
        cleanScreen()
        callNewGame()
    elsif $gameloop == 3
        callLoadGame()
    elsif $gameloop == 4
        cleanScreen()
        callFight()
    elsif $gameloop == 5
        cleanScreen()
        callLevelUp()
    end
end