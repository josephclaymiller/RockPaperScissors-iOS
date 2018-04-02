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
}

class RPSGame {
    private(set) var playerSign: Sign?
    private(set) var opponentSign: Sign?
    private(set) var gameState: GameState!
    private(set) var resultsMessage: String?
    
    init() {
        gameState = .start
    }
    
    func playMatch(playerSign: Sign, opponentSign: Sign) -> GameState {
        self.playerSign = playerSign
        self.opponentSign = opponentSign
        self.gameState = takeTurn()
        return gameState
    }
    
    private func takeTurn() -> GameState {
        if playerSign == nil || opponentSign == nil {
            print("Must have a player sign and an opponent signx to take a turn.")
            return .start
        }
        switch playerSign! {
        case .rock:
            switch opponentSign! {
            case .rock: return .draw
            case .paper: return .lose
            case .scissors: return .win
            }
        case .paper:
            switch opponentSign! {
            case .rock: return .win
            case .paper: return .draw
            case .scissors: return .lose
            }
        case .scissors:
            switch opponentSign! {
            case .rock: return .lose
            case .paper: return .win
            case .scissors: return .draw
            }
        }
    }
}
