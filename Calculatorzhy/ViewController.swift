//
//  ViewController.swift
//  Calculatorzhy
//
//  Created by Mr.Zhao on 16/3/21.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//
/*
计算器：Calculator
显示缓存：Displaycache
缓存：cache
屏幕：screen
temporary：临时
数字：number





@IBAction func 数字9(sender: AnyObject) {
点按("9")
}




*/

import UIKit

class ViewController: UIViewController {
    var Calculator = calculation()
    var Displaycache = ""
    var cache = 0.0
    var cache2:Double?

    @IBOutlet weak var screen: UITextField!
    
    
    @IBAction func 数字3(sender: AnyObject) {
        点按("3")
    }
    @IBAction func 数字2(sender: AnyObject) {
        点按("2")
    }
    @IBAction func 数字1(sender: AnyObject) {
        点按("1")
    }
    @IBAction func 数字0(sender: AnyObject) {
        点按("0")
    }
    @IBAction func 数字点(sender: AnyObject) {
        点按(".")
    }
    @IBAction func 算法加(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .addition {//如果点击加之前是别的算法就执行这里的代码块
            求值()
            Calculator.Setcurrentalgorithm(.addition)
            return //用return语句让函数提前出栈
        }
        Calculator.Setcurrentalgorithm(.addition)
        求值()
    }
    @IBAction func 算法减(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .subtraction {
            求值()
            Calculator.Setcurrentalgorithm(.subtraction)
            return
        }
        Calculator.Setcurrentalgorithm(.subtraction)
        求值()
    }
    @IBAction func 算法乘(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .multiplication {
            求值()
            Calculator.Setcurrentalgorithm(.multiplication)
            return
        }
        Calculator.Setcurrentalgorithm(.multiplication)
        求值()
    }
    @IBAction func 算法除(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .division {
            求值()
            Calculator.Setcurrentalgorithm(.division)
            return
        }
        Calculator.Setcurrentalgorithm(.division)
        求值()
    }
    @IBAction func 算法百分比(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .Percent {
            求值()
            Calculator.Setcurrentalgorithm(.Percent)
            return
        }
        Calculator.Setcurrentalgorithm(.Percent)
        求值()
    }
    @IBAction func 重置当前(sender: AnyObject) {
        点计数 = 0
        Displaycache = ""
        screen.text = ""
    }
    @IBAction func 重置所有(sender: AnyObject) {
        点计数 = 0 //同理，清空重置什么的，都要加上这个
        Displaycache = ""
        cache = 0.0
        cache2 = nil
        Calculator.Setcurrentalgorithm(.Nochoice)
        screen.text = ""
    }
    @IBAction func 结果(sender: AnyObject) {
        求值()
    }
    
    var 点计数 = 0;
    func 点按(数字:String) {
        if 数字 == "." { //如果是小数点，就增加计数
            点计数++
        }
        if 数字 == "." && 点计数 > 1 { //如果已经输入了一个小数点，还要输入小数点就略过后面的代码，也就不会计入缓存
            return //函数遇到return就会出栈了
        }
        Displaycache += 数字
        screen.text = Displaycache
    }
    
    func 求值() {
        点计数 = 0 //这里我们清空统计，因为你按了等于不是吗？这样就又可以输入小数点了
        if !Displaycache.isEmpty {
            let 临时 = Displaycache as NSString
            cache = 临时.doubleValue
            Displaycache = ""
        }
        let 临时 = cache
        var 结果 = ""
        
        if  let 前一个数字 = cache2 {
        
            结果 = Calculator.Resultseeking(Operationnumber: 前一个数字, Operandoperand: 临时)
            screen.text = 结果
            let 临 = 结果 as NSString
            cache2 = 临.doubleValue
            
        } else {
            cache2 = cache
            cache = 0.0
        }
    }
}

