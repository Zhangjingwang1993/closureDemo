//
//  ViewController.swift
//  Swift_Block
//
//  Created by zjwang on 16/3/16.
//  Copyright © 2016年 Zhangjingwang. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    
    var textField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        let button = UIButton.init(type: UIButtonType.Custom)
        button.frame = CGRectMake(20, 100, 50, 50);
        button.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(button)
        button.addTarget(self, action: Selector("click:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        textField = UITextField.init(frame: CGRectMake(20, 160, 100, 50));
        self.view.addSubview(textField)
        textField.placeholder = "I am Placehoder"
        
        
        
    }
    func addressThatTakesAClosure(string:String) ->Void{
        textField.text = string
    }
    func click(sender: UIButton)
    {
        // 初始化
        let sec = MainViewController()
        // 类似于属性传值
        sec.string = "Success"
        
        /***********************************************/
        //  ---------------华丽的分割线----------------  //
        // 用函数把地址传过去, 用于回调
//        sec.initWithClosure(addressThatTakesAClosure)
        // 或者直接这样
        sec.myClosure = addressThatTakesAClosure
        self.navigationController?.pushViewController(sec, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

