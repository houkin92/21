//
//  MainViewController.swift
//  通信窗口
//
//  Created by 方瑾 on 2019/2/1.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit
//类型后面+！表示隐式拆包

class MainViewController: UIViewController {
    //画面控件
    @IBOutlet weak var displayLabel: UILabel!  //显示Label
    
    @IBOutlet weak var tcTextField: UITextField!  //文字颜色选择用textfield
    
    @IBOutlet weak var bcTextField: UITextField!  //背景颜色选择用textfield
    
    @IBOutlet weak var darkTypeSwitch: UISwitch!   //黑暗模式选择用switch
    
    @IBOutlet weak var inputTextField: UITextField! //文字输入选择用textfield
    //设置pickerview
    var tcPicker = UIPickerView()
    var bcPicker = UIPickerView()
    let colorData = ["红色","黄色","蓝色","棕色","绿色","灰色","黑色","白色"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置tcPicker，bcPicker
        tcTextField.inputView = tcPicker
        bcTextField.inputView = bcPicker
        tcPicker.delegate = self
        tcPicker.dataSource = self
        bcPicker.delegate = self
        bcPicker.dataSource = self
        //switch的初始状态
        darkTypeSwitch.isOn = false
        inputTextField.delegate = self
        
        //self.view.backgroundColor = UIColor(red: 18/255, green: 22/255, blue: 100/255, alpha: 0.5)
        darkTypeSwitch.addTarget(self, action: #selector(onOff), for: .valueChanged)
        
    }
    @objc func onOff(_ sender:UISwitch) {   //_ 匿名参数
        if sender.isOn {
            self.view.backgroundColor = .orange
        } else {
            self.view.backgroundColor = .white
            
        }
    }
    
    //一键消除按键
    @IBAction func allClear(_ sender: UIButton) {
        displayLabel.text = ""
        inputTextField.text = ""
    }
    //全屏显示按键
    @IBAction func openScreen(_ sender: UIButton) {
      performSegue(withIdentifier: "ToFirstSegue", sender: nil)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToFirstSegue" {
//           let firstForm = segue.destination as! FirstViewController
//            firstForm.text = displayLabel.text!
            let nextPageVC = segue.destination as! FirstViewController
            nextPageVC.lastPageInfo = (displayLabel.text!,displayLabel.textColor,displayLabel.backgroundColor ?? .white)
        }
        
    }
    
}
extension MainViewController :UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var color : UIColor = .white
        switch colorData[row] {
        case"红色":
            color = .red
        case"黄色":
            color = .yellow
        case"蓝色":
            color = .blue
        case"棕色":
            color = .brown
        case"绿色":
            color = .green
        case"灰色":
            color = .gray
        case"黑色":
            color = .black
        default:
            color = .white
        }
        if pickerView == tcPicker {
            //如果当前选择为字体颜色
            displayLabel.textColor = color
            
        } else {
            //如果当前选择为背景颜色
            displayLabel.backgroundColor = color
        }
    }
    
   
}
extension MainViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        displayLabel.text = text
        return true
    }
}
