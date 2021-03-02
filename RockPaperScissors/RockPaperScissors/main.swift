//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int {
    case none = 0
    case scissor = 1
    case rock = 2
    case paper = 3
    
    func getRandomHandSign() -> RockPaperScissors {
        guard let randomHandSign = RockPaperScissors(rawValue: Int.random(in: 1...3)) else {
            return .none
        }
        return randomHandSign
    }
    
    func getInputHandSign(_ inputValue: Int) -> RockPaperScissors {
        guard let inputHandSign = RockPaperScissors(rawValue: inputValue) else {
            return .none
        }
        return inputHandSign
    }
}

class Player {
    var handSign: RockPaperScissors = .none
    
    func setRandomHandSign() {
        handSign = handSign.getRandomHandSign()
    }
    
    func setInputHandSign(_ userInput: Int) {
        handSign = handSign.getInputHandSign(userInput)
    }
}

class RockPaperScissorsGame {
    let player = Player()
    let computer = Player()
    var userInput = 0
    
    private func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료:0> : ", terminator:"")
    }
    
    private func castStringtoInt(inputString: String) -> Int {
        guard let resultInteger: Int = Int(inputString) else {
            return -1
        }
        return resultInteger
    }
    
    private func getUserInput() -> Int {
        guard let userInput: String = readLine() else {
            return -1
        }
        return castStringtoInt(inputString: userInput)
    }
    
    private func checkInvaildInput(_ userInput: Int) -> Bool {
        if (userInput >= 0 && userInput <= 3) {
            return true
        }
        else {
            return false
        }
    }
    
    private func choicePlayerHands(_ userInput: Int) {
        computer.setRandomHandSign()
        player.setInputHandSign(userInput)
    }
    
    private func compareWithScissor() {
        switch computer.handSign {
        case .scissor:
            print("비겼습니다!")
        case .rock:
            print("졌습니다!")
        case .paper:
            print("이겼습니다!")
        case .none:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    
    private func compareWithRock() {
        switch computer.handSign {
        case .scissor:
            print("이겼습니다!")
        case .rock:
            print("비겼습니다!")
        case .paper:
            print("졌습니다!")
        case .none:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    
    private func compareWithPaper() {
        switch computer.handSign {
        case .scissor:
            print("졌습니다!")
        case .rock:
            print("이겼습니다!")
        case .paper:
            print("비겼습니다!")
        case .none:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    
    private func comparePlayersHands() {
        switch player.handSign {
        case .scissor:
            compareWithScissor()
        case .rock:
            compareWithRock()
        case .paper:
            compareWithPaper()
        case .none:
            print("게임종료")
            exit(0)
        }
    }
    
    func play() {
        repeat {
            printMenu()
            userInput = getUserInput()
            if checkInvaildInput(userInput) {
                choicePlayerHands(userInput)
                comparePlayersHands()
            }
            else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        } while true
    }
}

let game = RockPaperScissorsGame()
game.play()
