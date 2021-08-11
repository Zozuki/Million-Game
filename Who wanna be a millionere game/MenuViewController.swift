//
//  ViewController.swift
//  Who wanna be a millionere game
//
//  Created by user on 10.08.2021.
//

import UIKit

class MenuViewController: UIViewController {
  
    func buildQuestions() {
        for (question, answers) in questions {
            let question = Question(question: question, answer1: answers[1], answer2: answers[2], answer3: answers[3], correctAnswer: answers[0])
            questionsAndAnswers.append(question)
        }
    }
    
    var questionsAndAnswers = [Question]()
    
    var questions = [
        "Какое растение существует на самом деле?": ["Лох индийский","Лох чилийский","Лох греческий","Лох русский"],
        "Что за место, попав в которое, человек делает селфи на кухне, которую не может себе позволить?": ["Икея","Рим","Париж","Лондон"],
        "Какой город объявлен официальной родиной русского Деда Мороза?": ["Великий Устюг","Малая Вишера","Вышний Волочек","Нижний Новгород"],
        "Что проводит боксер, наносящий удар противнику снизу?": ["Апперкот","Свинг","Хук","Джэб"],
        "К кому первому обратились за помощью дед и бабка, не справившись с репкой?": ["К внучке","К Жучке","К дочке","К залу"],
        "Кого нет среди смешариков?": ["Коня","Барана","Свиньи","Лося"],
        "Как называется ближайшая к Земле звезда?": ["Солнце","Проксиома Центавра","Полярная","Сириус"],
        "Что помогает запомнить мнемоническое правило «Это я знаю и помню прекрасно»?": ["Число Пи","Ряд металлов","Цвета радуги","Порядок падежей"],
        "Какую площадь имеет клетка стандартной школьной тетради?": ["0.25 кв.см","1 кв.см","0.5 кв.см","1.25 кв. см"],
        "Что происходит на соревнованиях по стрельбе, если соперники набрали одинаковое количество очков?": ["Перестрелка","Перевербовка","Перепалка","Перебранка"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildQuestions()
        // Do any additional setup after loading the view.
    }

    @IBAction func startGameTapped(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Game")
            as? GameViewController {
            vc.delegate = Game.shared.startGameSession()
            vc.questionsAndAnswers = self.questionsAndAnswers
            present(vc, animated: true)
        }
    }
    
    @IBAction func recordsButtonTapped(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Records")
            as? RecordsTableViewController {
           
            present(vc, animated: true)
        }
    }
    
}


