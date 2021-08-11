//
//  Game.swift
//  Who wanna be a millionere game
//
//  Created by user on 10.08.2021.
//

import Foundation

class Game {
    
    static let shared = Game()
    private let careTaker = RecordsCaretaker()
    
    var gameSession: GameSession?
    
    private(set) var records: [Record] {
        didSet {
            careTaker.saveRecords(records: records)
        }
    }
    
    private init() {
        records = careTaker.loadRecords() ?? []
    }
    
    func addRecord(record: Record) {
        records.insert(record, at: 0)
    }
    
    func clearRecords() {
        records.removeAll()
    }
    
    func startGameSession() -> GameSession? {
        self.gameSession = GameSession()
        return self.gameSession
    }
    
    func endGameSession() {
        self.gameSession = nil
    }
}
