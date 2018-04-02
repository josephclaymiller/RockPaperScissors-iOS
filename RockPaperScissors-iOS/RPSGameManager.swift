//
//  RPSGameManager.swift
//  RockPaperScissors-iOS
//
//  Created by Joseph Miller on 4/1/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//

import Foundation

var gameManager = GameManager()

struct Match {
    var player: Sign
    var opponent: Sign
    var result: GameState
}

class GameManager {
    var game: RPSGame!
    var matches = [Match]()
    
    init() {
        newGame()
    }
    
    func newGame() {
        game = RPSGame()
    }
    
    func play(playerSign: Sign) {
        game.play(sign: playerSign)
        let match = Match(player: game.playerSign!, opponent: game.opponentSign!, result: game.gameState)
        matches.append(match)
    }
}
