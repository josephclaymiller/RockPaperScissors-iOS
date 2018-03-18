//
//  GameState.swift
//  RockPaperScissors-iOS
//
//  Created by Joseph Miller on 3/18/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
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

