//
//  ViewController.swift
//  Project2
//
//  Created by Michael Wu on 1/10/18.
//  Copyright © 2018 Michael Wu. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        scoreLabel.text = "Score: \(score)"
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        //let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        //ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        //present(ac, animated: true)
        self.scoreLabel.fadeTransition(0.4)
        self.scoreLabel.text = "\(title)"
        self.scoreLabel.fadeTransition(0.4)
        self.scoreLabel.text = "Score: \(score)"
        askQuestion()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

