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
    private var game: RPSGame!
    private(set) var matches = [Match]()
    private(set) var currentMatch: Match?
    var gameState: GameState {
        return self.game.gameState!
    }
    private(set) var wins = 0
    private(set) var losses = 0
    private(set) var ties = 0
    
    init() {
        newGame()
    }
    
    func newGame() {
        game = RPSGame()
    }
    
    func playAI(playerSign: Sign) {
        let opponentSign = randomSign()
        let matchResult: GameState = game.playMatch(playerSign: playerSign, opponentSign: opponentSign)
        switch matchResult {
        case .win:
            wins += 1
        case .lose:
            losses += 1
        case .draw:
            ties += 1
        default:
            print("Invalid game result")
        }
        let match = Match(player: playerSign, opponent: opponentSign, result: matchResult)
        self.currentMatch = match
        matches.append(match)
    }
}
