//
//  ViewController.swift
//  Calu
//
//  Created by Thong Doan on 23/11/2021.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var displayResult: UILabel!
    
    var caculate = CalucatorLogic()
    private var isFinishedTypingNumber:Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can not conver display label text to a Double")
            }
           return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func numButtonPressed(_ sender: UIButton) {
     
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else{
                if numValue == "," {
                    
                    // Kiểm tra việc đã sử dụng dấu "." hay chưa
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
    @IBAction func caluteButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        caculate.setName(displayValue)
        if let caluMethod = sender.currentTitle {
           
            if let result = caculate.calucate(symbol: caluMethod)  {
                displayValue = result
            }
            
        }
    }
}

