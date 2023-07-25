//
//  ViewController.swift
//  HelloSegue
//
//  Created by 王麒翔 on 2022/12/13.
//

import UIKit

class ViewController: UIViewController, LightRedViewControllerDelegate {
    
    // segue unwind // UIStoryboardSegue // segue.source
    @IBAction func backToViewOne(_ segue:UIStoryboardSegue) {
        // 取得其他 view的物件
        let svc = segue.source as? lightRedViewController // get view2 object
        let colorNumber = svc?.myPickerView.selectedRow(inComponent: 0) ?? 0
        let color = svc?.colorArray[colorNumber] ?? ""
        setColor(colorType: color)
    }

    
    
    
    // 實作 LightRedViewControllerDelegate
    func setColor(colorType: String) {
        if colorType == "red" {
            view.backgroundColor = .red
        } else if colorType == "green" {
            view.backgroundColor = .green
        } else if colorType == "blue" {
            view.backgroundColor = .blue
        }
    }
    
    @IBOutlet weak var myTextInput: UITextField!
    
    @IBAction func changeView(_ sender: UIButton) {
        if let inputText = myTextInput.text {
            if inputText == "" {
                 // no input, pop up an alert
                let myAlert = UIAlertController(title: "No input", message: "Please enter something", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                myAlert.addAction(okAction)
                present(myAlert, animated: true)
                
            } else {
                // change view
                performSegue(withIdentifier: "gotoView2", sender: inputText) // 導頁 // sender:傳參數
                // clear text
                myTextInput.text = ""
                myTextInput.resignFirstResponder() // 取消鍵盤
            }
        }
    }
    
    // segue prepare for
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoView2" { // 判斷下一頁 // 判斷導頁箭頭
            if let lightRed = segue.destination as? lightRedViewController { // 取得 下一頁ViewController
                lightRed.infoFromViewOne = sender as? String // 設定屬性值
                lightRed.delegate = self // 設定自己的 ViewController 傳給下一頁
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

