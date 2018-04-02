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
    
    func playAI(playerSign: Sign) {
        let opponentSign = randomSign()
        let matchResult: GameState = game.playMatch(playerSign: playerSign, opponentSign: opponentSign)
        let match = Match(player: playerSign, opponent: opponentSign, result: matchResult)
        matches.append(match)
    }
}
