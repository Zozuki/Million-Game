//
//  GameSession.swift
//  Who wanna be a millionere game
//
//  Created by user on 11.08.2021.
//

import Foundation

class GameSession {
    var questionsCount = Int()
    var correctAnswers = Int()
    var playerCluesLeft = Int()
    var playerMoney = Int()
    
}

extension GameSession: GameViewControllerDelegate {
    func didTapAnswerButton(questionsCount: Int, correctAnswers: Int, playerCluesLeft: Int, playerMoney: Int) {
        self.questionsCount = questionsCount
        self.correctAnswers = correctAnswers
        self.playerCluesLeft = playerCluesLeft
        self.playerMoney = playerMoney
        
    }
    
    
}
