//
//  RPSGameManager.swift
//  RockPaperScissors-iOS
//
//  Created by Joseph Miller on 4/1/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//

import Foundation

var gameManager = GameManager()

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
    
    func gameMessage() -> String {
        return game.gameState.message
    }
}
