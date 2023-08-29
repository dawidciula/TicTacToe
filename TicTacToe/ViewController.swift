//
//  ViewController.swift
//  TicTacToe
//
//  Created by Dawid Ciuła on 28/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    enum Player:String
    {
        case X = "X"
        case O = "O"
        case none = ""
    }
    
    var currentPlayer = Player.X
    var board: [[Player]] = [[.none, .none, .none], [.none, .none, .none], [.none, .none, .none]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cellTapped(_ sender: UIButton) {
        let row = sender.tag / 3
        let column = sender.tag % 3
        
        
    }
    
    
}

