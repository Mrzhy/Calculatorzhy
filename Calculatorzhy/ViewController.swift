//
//  ViewController.swift
//  Calculatorzhy
//
//  Created by Mr.Zhao on 16/3/21.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    @IBAction func six(sender: AnyObject) {
        let digit = sender.currentTitle!!
        print("digit = \(digit)")
        if(userIsInTheMiddleOfTypingANumber) {
            display.text = display.text! + digit
        } else {
            display.text = digit
            if(digit != "0") {
                userIsInTheMiddleOfTypingANumber = true
            }
        }
    }
    @IBAction func seven(sender: AnyObject) {
    }
    
}

