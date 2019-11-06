//
//  ViewController.swift
//  calculator
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Parimal Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //number on Screen
    //previous number
    // operation = - / *

    @IBOutlet weak var resultLabel: UILabel!
    
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var operation = 0
    var isPerformingOperation = false
    var percent : Double = 0
    @IBAction func dot(_ sender: Any) {
      
        
        if   resultLabel.text!.contains(".") {
        }
        else{
        resultLabel.text?.append(".")
        }
        
    
    
    }
    
    
    
    
    @IBAction func percent(_ sender: Any) {
       percent = Double(resultLabel.text!)! / 100
        resultLabel.text = String(percent)
        
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
        // Do any additional setup after loading the view.
    }

    @IBAction func operatorPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        
        if tag == 16{
            resultLabel.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            return
        }
        
        //operation =(15) +(14) -(13) x(12) /(11)
       
        if tag == 11{
             isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "/"
            operation = tag
            
        }else if tag == 12{
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "*"
             operation = tag
            
        }else if tag == 13{
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "-"
             operation = tag
            
        }else if tag == 14{
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "+"
             operation = tag
            
        }else if tag == 15{
            if operation == 11{
                resultLabel.text = String(previousNumber / numberOnScreen)
            }else if operation == 12{
                resultLabel.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 13{
                 resultLabel.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 14{
                resultLabel.text = String(previousNumber + numberOnScreen)
            }
        }
        
    }
    @IBAction func numberPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        
        if isPerformingOperation == true{
            isPerformingOperation = false
            resultLabel.text = String(tag - 1)
            numberOnScreen = Double(resultLabel.text!)!
        }
        else{
            
            resultLabel.text = resultLabel.text! + String(tag - 1)
            numberOnScreen = Double(resultLabel.text!)!        }
  }
    
}

