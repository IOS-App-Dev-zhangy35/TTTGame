//
//  TicTacToeGame.swift
//  TTTGame
//
//  Created by 章音童 on 2022/3/21.
//

import Foundation



// TODO: Create the TicTacToeGame class
class TicTacToeGame: CustomStringConvertible{
    
    enum MarkType: String{
        case x = "X"
        case o = "O"
        case none = "-"
    }
    
    enum GameState: String{
        case xTurn = "X's Turn"
        case oTurn = "O's Turn"
        case xWon = "X Wins!"
        case oWon = "O Wins!"
        case tie = "Tie Game"
    }
    
    var board: [MarkType]
    var state: GameState
    
    init(){
        self.board = [MarkType]()
        for _ in 0..<9 {
            board.append(.none)
        }
        self.state = .xTurn
    }
    
    func pressedSquare(at index: Int){
        if index < 0 || index > 8 {
            print("invalid index")
            return
        }
        
        if board[index] != .none {
            print("this square is not empty")
            return
        }
        
        switch state{
            
        case .xTurn:
            board[index] = .x
            state = .oTurn
        case .oTurn:
            board[index] = .o
            state = .xTurn
        default:
            print("game already ended")
            return
        
        }
        
        checkForWin()
    }
    
    func getGameString(_ indices: [Int] = [0,1,2,3,4,5,6,7,8]) -> String {
        var gameString = ""
        for i in indices {
            gameString += board[i].rawValue
        }
        return gameString
    }
    
    func checkForWin() {
        if !board.contains(.none){
            state = .tie
        }
        var linesOf3 = [String]()
        linesOf3.append(getGameString([0,1,2]))
        linesOf3.append(getGameString([3,4,5]))
        linesOf3.append(getGameString([6,7,8]))
        
        linesOf3.append(getGameString([0,3,6]))
        linesOf3.append(getGameString([1,4,7]))
        linesOf3.append(getGameString([2,5,8]))
        
        linesOf3.append(getGameString([0,4,8]))
        linesOf3.append(getGameString([2,4,6]))
        
        for line in linesOf3 {
            if line == "XXX" {
                state = .xWon
            }
            if line == "OOO"{
                state = .oWon
            }
        }
        
    }
    
    var description: String{
        return "\(state.rawValue) \(getGameString())"
    }
}
