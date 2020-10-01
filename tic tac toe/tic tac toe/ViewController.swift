//
//  ViewController.swift
//  tic tac toe
//
//  Created by Salem Booresli on 9/29/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        buttons = [b1 ,b2 ,b3 ,b4 ,b5 ,b6 ,b7 ,b8 ,b9]
    }
    
    var counter = 0
    
    @IBAction func press(_ sender: UIButton) {
        if counter % 2 == 0 {
        sender.setTitle("X", for: .normal)
            turnLabel.text = "O turn"
        }
        else {
            sender.setTitle("O", for: .normal)
            turnLabel.text = "X turn"
        }
        counter += 1
        sender.isEnabled = false
    }
    
    @IBAction func restButton() {
    }
    func chechWinner(_ p:String) {
        let bTitles = buttons.map{$0.titleLabel!.text}
        let r1 = (bTitles[0], bTitles[1], bTitles[2]) == (p,p,p)
        let r2 = (bTitles[3], bTitles[4], bTitles[5]) == (p,p,p)
        let r3 = (bTitles[6], bTitles[7], bTitles[8]) == (p,p,p)
        let c1 = (bTitles[0], bTitles[3], bTitles[6]) == (p,p,p)
        let c2 = (bTitles[1], bTitles[4], bTitles[7]) == (p,p,p)
        let c3 = (bTitles[2], bTitles[5], bTitles[8]) == (p,p,p)
        let d1 = (bTitles[0], bTitles[4], bTitles[8]) == (p,p,p)
        let d2 = (bTitles[2], bTitles[4], bTitles[6]) == (p,p,p)
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            alertWinner(winner: p)
        }

    }
    func alertWinner(winner:String){
        let alertcontroller = UIAlertController(title: "\(winner)wins", message: "Restart the game ?", preferredStyle: .alert)
        alertcontroller.addAction(UIAlertAction(title: "Restart", style: .cancel, handler: { action in
            self.restartgame()
        }))
    }
    func restartgame(){
        buttons.forEach{ button in button.setTitle("", for: .normal)
            button.titleLabel!.text = ""
    }
  }
}
