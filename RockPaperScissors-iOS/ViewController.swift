//
//  ViewController.swift
//  RockPaperScissors-iOS
//
//  Created by Joseph Miller on 3/18/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var opponentSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var gameState: GameState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameState = .start
        updateUI(gameState: gameState)
    }
    
    @IBAction func rockButtonTapped(_ sender: UIButton) {
        play(sign: .rock)
        rockButton.isEnabled = false
        paperButton.isHidden = true
        scissorsButton.isHidden = true
    }
    
    @IBAction func paperButtonTapped(_ sender: UIButton) {
        play(sign: .paper)
        paperButton.isEnabled = false
        rockButton.isHidden = true
        scissorsButton.isHidden = true
    }
    
    @IBAction func scissorsButtonTapped(_ sender: UIButton) {
        play(sign: .scissors)
        scissorsButton.isEnabled = false
        rockButton.isHidden = true
        paperButton.isHidden = true
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        gameState = .start
        updateUI(gameState: gameState)
    }
    
    func play(sign: Sign) {
        let opponentSign = randomSign()
        opponentSignLabel.text = opponentSign.emoji
        gameState = sign.takeTurn(opponentSign)
        updateUI(gameState: gameState)
        playAgainButton.isHidden = false
    }
    
    func updateUI(gameState: GameState) {
        // Set the status label’s text property to an appropriate message.
        gameStatusLabel.text = gameState.message
        switch gameState {
        case .start:
            opponentSignLabel.text = ""
            playAgainButton.isHidden = true
            rockButton.isEnabled = true
            rockButton.isHidden = false
            paperButton.isEnabled = true
            paperButton.isHidden = false
            scissorsButton.isEnabled = true
            scissorsButton.isHidden = false
            self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        case .draw:
            self.view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        case .win:
            self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        case .lose:
            self.view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
    }
}

