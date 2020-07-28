//
//  ViewController.swift
//  Three Letter Word hackwich
//
//  Created by tbredemeier on 7/27/20.
//  Copyright © 2020 tbredemeier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentLetterLabel: UILabel!
    @IBOutlet weak var label0: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    var labels = [UILabel]()
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var counter = 0
    var currentLetter = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labels = [label0, label1, label2]
        getCurrentLetter()
    }

    func getCurrentLetter() {
        let index = letters.index(letters.startIndex, offsetBy: counter)
        let letter = String(letters[index])
        currentLetterLabel.text = letter
        currentLetter = letter
    }
    
    @IBAction func whenTapped(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: view)
        for label in labels {
            if label.frame.contains(selectedPoint) {
                label.text = currentLetter
            }
        }
        counter += 1
        if counter == letters.count {
            counter = 0
        }
        getCurrentLetter()
    }

    @IBAction func onResetButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Reset?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            for label in self.labels {
                label.text = ""
            }
            self.counter = 0
            self.getCurrentLetter()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

