//
//  FirstViewController.swift
//  通信窗口
//
//  Created by 方瑾 on 2019/2/1.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    
    var lastPageInfo : (text:String,textColor:UIColor,bgColor:UIColor) = ("",.white,.white)
//    var text = ""
//    var firstForm: MainViewController?

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//根据上一页的页面传来的值对本页面进行更改
        firstLabel.text = lastPageInfo.text
        firstLabel.textColor = lastPageInfo.textColor
        firstLabel.backgroundColor = lastPageInfo.bgColor
        
        if lastPageInfo.bgColor == .black {
            backButton.setTitleColor(.white, for:.normal)
            //setTitleColor表示键上的数字颜色
        }
        

        
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
//        firstForm?.displayLabel.text = firstLabel.text!
//        dismiss(animated: true, completion: nil)

        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true
            , completion: nil)
        
    }
    
    
    
}
