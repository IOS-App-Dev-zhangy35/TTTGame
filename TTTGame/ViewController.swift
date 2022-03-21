//
//  ViewController.swift
//  TTTGame
//
//  Created by 章音童 on 2022/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    let xImage = UIImage(named: "X.png")
    let oImage = UIImage(named: "O.png")
    let noImage = UIImage(named: "empty.png")
    
    
    @IBOutlet var gameBoardButtons: [UIButton]!
    @IBOutlet weak var gameStateLabel: UILabel!
    var game : TicTacToeGame!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        game = TicTacToeGame()
        updateView()
    }

    @IBAction func pressedNewGame(_ sender: Any) {
        game = TicTacToeGame()
        updateView()
    }
    
    @IBAction func pressedGameBoardButton(_ sender: Any) {
        //let button = sender as! UIButton
        
        guard let button = sender as? UIButton else{
            return
        }
        
        print(button.tag)
        game.pressedSquare(at: button.tag)
        updateView()
    }
    
    func updateView() {
        gameStateLabel.text = game.state.rawValue
        
        for k in 0..<9 {
            let button = gameBoardButtons[k]
            let mark = game.board[k]
            switch mark{
            case .x:
                button.setImage(xImage, for: .normal)
            case .o:
                button.setImage(oImage, for: .normal)
            case .none:
                button.setImage(noImage, for: .normal)
            }
                
        }
    }
    
}

