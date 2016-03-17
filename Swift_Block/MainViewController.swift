//
//  MainViewController.swift
//  Swift_Block
//
//  Created by zjwang on 16/3/16.
//  Copyright © 2016年 Zhangjingwang. All rights reserved.
//

import UIKit
// 类似于OC中的typedef
typealias sendValueClosure = (string:String)->Void

class MainViewController: UIViewController {

    var string = ""
    // 声明一个Closure(闭包)
    var myClosure:sendValueClosure?
    // 下面这个方法需要传入上个界面的someFunctionThatTakesAClosure函数指针
    func initWithClosure(closure:sendValueClosure?){
        myClosure = closure
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        // Do any additional setup after loading the view.
        // 类似于OC中的属性传值
        print("Success: \(string)")
        let label = UILabel.init(frame: CGRectMake(10, 100, 150, 30))
        label.text = string
        self.view.addSubview(label)
        
        backButtonCreate()
        
        
    }
    func backButtonCreate()
    {
        // 返回按钮
        var buttonRight = UIButton()
        buttonRight = UIButton.init(type: UIButtonType.Custom)
        buttonRight.backgroundColor = UIColor.redColor()
        buttonRight.frame = CGRectMake(280, 100, 50, 50)
        self.view.addSubview(buttonRight)
        buttonRight.setTitle("返回", forState: UIControlState.Normal)
        buttonRight.addTarget(self, action: Selector("click"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    func click()
    {
        if myClosure != nil{
            myClosure!(string: string);
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
