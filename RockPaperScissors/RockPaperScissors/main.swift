//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/*
게임 시작할 때 최초로 출력해주는 함수
code by jake
*/
func printRockPaperScissors() {
    print("가위(1).바위(2).보(3)! <종료 : 0> : ", terminator:"")
}

/*
 가위 바위 보 승부를 판단하는 함수
 computer와 user 모두 입력은 1,2,3만 들어오는 것을 가정하고 코드 작성
 즉, 0이나 4이상의 숫자에 대한 예외처리는 입력 받을 때 처리 되어야할 것 같다.
 code by jake
 */
func judgmentWinDrawLose(computer : Int, user : Int) -> String {
    var result : String = ""
    switch computer {
    case 1 : // computer 가위인 경우
        if user == 1 { print("비겼습니다!"); result = "비겼습니다!" }
        else if user == 2 { print("이겼습니다!"); result = "이겼습니다!" }
        else { print("졌습니다!"); result = "졌습니다!" }
    case 2 : // computer 바위인 경우
        if user == 1 { print("졌습니다!"); result = "졌습니다!" }
        else if user == 2 { print("비겼습니다!"); result = "비겼습니다!" }
        else { print("이겼습니다!"); result = "이겼습니다!" }
    default : // computer 보인 경우
        if user == 1 { print("이겼습니다!"); result = "이겼습니다!" }
        else if user == 2 { print("졌습니다!"); result = "졌습니다!" }
        else { print("비겼습니다!"); result = "비겼습니다!" }
    }
    return result
}

/*
 컴퓨터의 패를 정해주는 함수
 난수를 통해서 1~3중 하나의 값을 갖는다
 code by kkomal
 */
func createComputerRockPaperScissors() -> Int {
    let computerNumber = Int.random(in: 1...3)
    return computerNumber
}

/*
 사용자에게 입력받는 함수
 code by kkomal
 */
func inputRockPaperScissors() -> String {
    // 입력값이 nil이 되는 경우 종료시켜준다.
    guard let input = readLine() else { print("입력값이 nil이라서 종료됩니다."); exit(0) }
    return input
}

/*
 사용자에게 입력받은 값을 확인하는 함수
 -1, 0, 1, 2, 3 중 하나를 반환한다
 code by kkomal
 */
func verifyInput(userInput : String) -> Int {
    var userNumber = Int(userInput) ?? -1 // 숫자가 아닌 값이면 -1로 변환
    if userNumber > 3 || userNumber < 0 {
        userNumber = -1
    }
    return userNumber
}

/*
 가위 바위 보 게임을 수행하는 함수
 code by jake
 */
func RockPaperScissorsGame() {
    printRockPaperScissors()
    var userNumber : Int = 0
    userNumber = verifyInput(userInput: inputRockPaperScissors())
    switch userNumber {
    case -1 : // 사용자 입력이 0,1,2,3이 아닌 경우
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return RockPaperScissorsGame()
    case 0 : // 사용자 입력이 0인 경우
        return print("게임 종료")
    default : // 사용자 입력이 1,2,3 중에 하나인 경우
        var result : String = ""
        result = judgmentWinDrawLose(computer: createComputerRockPaperScissors(), user: userNumber)
        if result == "비겼습니다!" {
            return RockPaperScissorsGame()
        }
    }
}

/*
 메인 함수
 */
func main(){
    RockPaperScissorsGame()
}
main()
