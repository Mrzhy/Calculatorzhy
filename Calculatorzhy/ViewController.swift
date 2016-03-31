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
    var 缓存 = 0.0
    var 缓存2:Double?

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
        if 计算器.读取当前算法() != .加法 {//如果点击加之前是别的算法就执行这里的代码块
            求值()
            计算器.设置当前算法(.加法)
            return //用return语句让函数提前出栈
        }
        计算器.设置当前算法(.加法)
        求值()
    }
    @IBAction func 算法减(sender: AnyObject) {
        if 计算器.读取当前算法() != .减法 {
            求值()
            计算器.设置当前算法(.减法)
            return
        }
        计算器.设置当前算法(.减法)
        求值()
    }
    @IBAction func 算法乘(sender: AnyObject) {
        if 计算器.读取当前算法() != .乘法 {
            求值()
            计算器.设置当前算法(.乘法)
            return
        }
        计算器.设置当前算法(.乘法)
        求值()
    }
    @IBAction func 算法除(sender: AnyObject) {
        if 计算器.读取当前算法() != .除法 {
            求值()
            计算器.设置当前算法(.除法)
            return
        }
        计算器.设置当前算法(.除法)
        求值()
    }
    @IBAction func 算法百分比(sender: AnyObject) {
        if 计算器.读取当前算法() != .百分号 {
            求值()
            计算器.设置当前算法(.百分号)
            return
        }
        计算器.设置当前算法(.百分号)
        求值()
    }
    @IBAction func 重置当前(sender: AnyObject) {
        点计数 = 0
        显示缓存 = ""
        屏幕.text = ""
    }
    @IBAction func 重置所有(sender: AnyObject) {
        点计数 = 0 //同理，清空重置什么的，都要加上这个
        显示缓存 = ""
        缓存 = 0.0
        缓存2 = nil
        计算器.设置当前算法(.未选择)
        屏幕.text = ""
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
        显示缓存 += 数字
        屏幕.text = 显示缓存
    }
    
    func 求值() {
        点计数 = 0 //这里我们清空统计，因为你按了等于不是吗？这样就又可以输入小数点了
        if !显示缓存.isEmpty {
            let 临时 = 显示缓存 as NSString
            缓存 = 临时.doubleValue
            显示缓存 = ""
        }
        let 临时 = 缓存
        var 结果 = ""
        
        if  let 前一个数字 = 缓存2 {
        
            结果 = 计算器.求结果(操作数: 前一个数字, 被操作数: 临时)
            屏幕.text = 结果
            let 临 = 结果 as NSString
            缓存2 = 临.doubleValue
            
        } else {
            缓存2 = 缓存
            缓存 = 0.0
        }
    }
}

