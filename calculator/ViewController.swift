//
//  ViewController.swift
//  calculator
//
//  Created by Sean O'Neill on 7/30/17.
//  Copyright © 2017 Sean O'Neill. All rights reserved.
//

//controller

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton)
    {
        
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping
        {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
            print("\(digit) was touched")
        }
        else
        {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathmaticalSymbol = sender.currentTitle {
            brain.performOperation(mathmaticalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
        
    }
}



