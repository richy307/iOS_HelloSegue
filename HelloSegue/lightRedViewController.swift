//
//  lightRedViewController.swift
//  HelloSegue
//
//  Created by 王麒翔 on 2022/12/13.
//

import UIKit

protocol LightRedViewControllerDelegate {
    func setColor(colorType: String)
}

class lightRedViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPickerView: UIPickerView!
    
     
    @IBAction func myUnwindSegue2(_ sender: UIButton) {
        // view2 contriller control-click to Exit
        // Set nuwind Segue ID // Use performSegue()
        performSegue(withIdentifier: "back", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "back" {
            let fvc = segue.destination as? ViewController
        }
    }

    @IBAction func myUnwindSegue1(_ sender: UIButton) {
        // Define View1 UIStoryboardSegue
        // btn control-click to Exit
        // UIStoryboardSegue // segue.source
    }
    
    @IBAction func myDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)             // 回上一頁     // 對應 present()
    }
    
    @IBAction func backtoView1(_ sender: UIButton) {
        let colorNumber = myPickerView.selectedRow(inComponent: 0)
        let color = colorArray[colorNumber]
        delegate?.setColor(colorType: color) // 設定上一頁的 backgroundColor
        navigationController?.popViewController(animated: true) // 回上一頁
    }
    
    var delegate:LightRedViewControllerDelegate? // 上一頁 delegate
    var infoFromViewOne:String?
    var colorArray = ["red", "green", "blue"] // pickerView option
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.text = infoFromViewOne
        myPickerView.dataSource = self
        myPickerView.delegate = self
    }
    
    // init pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // column number
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count // row number
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row] // row option title
    }
}
