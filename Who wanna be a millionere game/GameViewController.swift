//
//  GameViewController.swift
//  Who wanna be a millionere game
//
//  Created by user on 11.08.2021.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didTapAnswerButton(questionsCount: Int, correctAnswers: Int, playerCluesLeft: Int, playerMoney: Int)
}

class GameViewController: UIViewController {

    weak var delegate: GameViewControllerDelegate?
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var answer1Button: UIButton!
    
    @IBOutlet weak var answer2Button: UIButton!
    
    @IBOutlet weak var answer3Button: UIButton!
    
    @IBOutlet weak var answer4Button: UIButton!
    
    var gameSession: Game?
    
    var questionsAndAnswers = [Question]()
    var questionsCount = Int()
    
    var questionNumber = 0
    var correctAnwers = 0
    var cluesLeft = 3
    var playerMoney = 0
    
    var endGame = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsCount = questionsAndAnswers.count
        showQuestion()
        // Do any additional setup after loading the view.
    }
    
    func showQuestion() {
        questionLabel.text = questionsAndAnswers[questionNumber].question
        
        var buttons = [answer1Button, answer2Button, answer3Button, answer4Button]
        buttons.shuffle()
   
        buttons[0]?.setTitle(questionsAndAnswers[questionNumber].answer1, for: .normal)
        buttons[1]?.setTitle(questionsAndAnswers[questionNumber].answer2, for: .normal)
        buttons[2]?.setTitle(questionsAndAnswers[questionNumber].answer3, for: .normal)
        buttons[3]?.setTitle(questionsAndAnswers[questionNumber].correctAnswer, for: .normal)
    }
    
    
    
    
    func endGameDecision() {
        if questionNumber >= questionsCount || endGame  {
            if correctAnwers >= 0 {
                
                let percent = Double(correctAnwers) / Double(questionsCount) * Double(100)
                showEndGameAC(percent: percent)
                Game.shared.addRecord(record: Record(value: percent, date: Date()))
                Game.shared.endGameSession()
            } else {
                showEndGameAC(percent: 0)
                Game.shared.addRecord(record: Record(value: 0, date: Date()))
                Game.shared.endGameSession()
            }
        } else {
            self.showQuestion()
        }
    }
    
    func showEndGameAC(percent: Double) {
        let ac = UIAlertController(title: "Игра окончена!", message: "Вы ответили на \(percent)% вопросов", preferredStyle: .alert)
        let action = UIAlertAction(title: "Спасибо за игру!", style: .cancel, handler: { [unowned self] action in
            self.goToMenu()
        })
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    func goToMenu() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Menu")
            as? MenuViewController {
            present(vc, animated: true)
        }
    }
    func buttonTappedDecision(buttonNumber: Int) {
        var button = UIButton()
        
        if buttonNumber == 1 {
            button = answer1Button
        } else if buttonNumber == 2 {
            button = answer2Button
        } else if buttonNumber == 3 {
            button = answer3Button
        } else  {
            button = answer4Button
        }
        
        if button.titleLabel?.text == questionsAndAnswers[questionNumber].correctAnswer {
            questionNumber += 1
            correctAnwers += 1
            playerMoney += 500 * questionNumber * questionNumber
            delegate?.didTapAnswerButton(questionsCount: questionsCount, correctAnswers: correctAnwers, playerCluesLeft: cluesLeft, playerMoney: playerMoney)
            endGameDecision()
        } else {
            delegate?.didTapAnswerButton(questionsCount: questionsCount, correctAnswers: correctAnwers, playerCluesLeft: cluesLeft, playerMoney: playerMoney)
            endGame = true
            endGameDecision()
        }
        
    }
    
    
    @IBAction func button1Tapped(_ sender: Any) {
        buttonTappedDecision(buttonNumber: 1)
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        buttonTappedDecision(buttonNumber: 2)
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
        buttonTappedDecision(buttonNumber: 3)
    }
    
    @IBAction func button4Tapped(_ sender: Any) {
        buttonTappedDecision(buttonNumber: 4)
    }
    
    @IBAction func wrongAnswersAwayButtontapped(_ sender: Any) {
    }
    
    @IBAction func hallHelpButtonTapped(_ sender: Any) {
    }
    
    @IBAction func friendCallButtonTapped(_ sender: Any) {
    }
    
}
