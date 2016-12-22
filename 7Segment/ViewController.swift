//
//  ViewController.swift
//  7Segment
//
//  Created by Adi Mathew on 10/21/16.
//  Copyright © 2016 RCPD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var valuePicker: UIPickerView!
    
    let pickerValues: [Int] = Array(0 ..< 16)
    var segmentVC: SGSevenSegmentViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.valuePicker.delegate = self
        self.valuePicker.dataSource = self
        
        self.segmentVC = self.childViewControllers.first as? SGSevenSegmentViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UIPickerView methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerValues[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let val = pickerValues[row]
        self.segmentVC?.display(value: val)
    }
}

