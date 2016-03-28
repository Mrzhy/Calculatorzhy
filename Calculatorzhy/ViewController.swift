//
//  ViewController.swift
//  Calculatorzhy
//
//  Created by Mr.Zhao on 16/3/21.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var 计算器 = 计算()
    var 显示缓存 = ""

    @IBOutlet weak var 屏幕: UITextField!
    
    @IBAction func 数字9(sender: AnyObject) {
        点按("9")
    }
    @IBAction func 数字8(sender: AnyObject) {
        点按("8")
    }
    @IBAction func 数字7(sender: AnyObject) {
        点按("7")
    }
    @IBAction func 数字6(sender: AnyObject) {
        点按("6")
    }
    @IBAction func 数字5(sender: AnyObject) {
        点按("5")
    }
    @IBAction func 数字4(sender: AnyObject) {
        点按("4")
    }
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
        计算器.设置当前算法(.加法)
        求值()
    }
    @IBAction func 算法减(sender: AnyObject) {
        计算器.设置当前算法(.减法)
        求值()
    }
    @IBAction func 算法乘(sender: AnyObject) {
        计算器.设置当前算法(.乘法)
        求值()
    }
    @IBAction func 算法除(sender: AnyObject) {
        计算器.设置当前算法(.除法)
        求值()
    }
    @IBAction func 算法百分比(sender: AnyObject) {
        计算器.设置当前算法(.百分号)
        求值()
    }
    @IBAction func 重置当前(sender: AnyObject) {
    }
    @IBAction func 重置所有(sender: AnyObject) {
    }
    @IBAction func 结果(sender: AnyObject) {
        求值()
    }
    
    func 点按(数字:String) {
        显示缓存 += 数字
        //屏幕.stringValue
    }
    
    func 求值() {
        
    }
}

