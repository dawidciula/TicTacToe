import UIKit

class ViewController: UIViewController {

    enum Player: String {
        case X = "X"
        case O = "O"
        case none = ""
    }

    var currentPlayer: Player = .X
    var board: [[Player]] = [[.none, .none, .none], [.none, .none, .none], [.none, .none, .none]]

    
    
    @IBOutlet var cellButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }

    @IBAction func cellTapped(_ sender: UIButton) {
        // Ustal, który przycisk został naciśnięty na podstawie tagu
        let row = sender.tag / 3
        let column = sender.tag % 3
        
        // Jeśli pole jest puste, zaktualizuj planszę
        if board[row][column] == .none {
            board[row][column] = currentPlayer
            sender.setTitle(currentPlayer.rawValue, for: .normal)
            
            if checkForWin() {
                displayMessage("\(currentPlayer.rawValue) Wins!")
                resetGame()
                return
            } else if checkForDraw() {
                displayMessage("It's a Draw!")
                resetGame()
                return
            }
            
            // Zmień aktualnego gracza
            currentPlayer = (currentPlayer == .X) ? .O : .X
        }
    }

    // Sprawdź, czy któryś z graczy wygrał
    func checkForWin() -> Bool {
        for i in 0..<3 {
            if board[i][0] != .none && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
                return true
            }

            if board[0][i] != .none && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
                return true
            }
        }

        if board[0][0] != .none && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
            return true
        }

        if board[0][2] != .none && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
            return true
        }

        return false
    }

    // Sprawdź, czy gra zakończyła się remisem
    func checkForDraw() -> Bool {
        for row in board {
            for cell in row {
                if cell == .none {
                    return false
                }
            }
        }
        return true
    }

    // Wyświetl komunikat o wyniku gry
    func displayMessage(_ message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    // Resetuj grę do stanu początkowego
    func resetGame() {
        for i in 0..<3 {
            for j in 0..<3 {
                board[i][j] = .none
            }
        }
        for button in cellButtons {
            button.setTitle("", for: .normal)
        }
        currentPlayer = .X
    }
}

