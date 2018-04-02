//
//  RPSGame.swift
//  RockPaperScissors-iOS
//
//  Created by Joseph Miller on 4/1/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    var description: String {
        return "\(self)"
    }
    var message: String {
        switch self {
        case .win:
            return "You win!"
        case .lose:
            return "You lose."
        case .draw:
            return "It's a draw."
        default:
            return "Rock, Paper, Scissors"
        }
    }
}

struct Match {
    var player: Sign
    var opponent: Sign
    var result: GameState
}

class RPSGame {
    var playerSign: Sign?
    var opponentSign: Sign?
    var gameState: GameState!
    var resultsMessage: String?
    
    init() {
        gameState = .start
    }
    
    func play(sign: Sign) {
        playerSign = sign
        opponentSign = randomSign()
        gameState = takeTurn()
    }
    
    func takeTurn() -> GameState {
        switch playerSign! {
        case .rock:
            switch opponentSign! {
            case .rock: return GameState.draw
            case .paper: return GameState.lose
            case .scissors: return GameState.win
            }
        case .paper:
            switch opponentSign! {
            case .rock: return GameState.win
            case .paper: return GameState.draw
            case .scissors: return GameState.lose
            }
        case .scissors:
            switch opponentSign! {
            case .rock: return GameState.lose
            case .paper: return GameState.win
            case .scissors: return GameState.draw
            }
        }
    }
}
