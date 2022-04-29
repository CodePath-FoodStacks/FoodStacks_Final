//
//  FilterViewController.swift
//  Yelpy
//
//  Created by Socheata Hour on 4/29/22.
//  Copyright © 2022 memo. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var mileSlider: UISlider!
    @IBOutlet weak var favLabel: UISegmentedControl!
    @IBOutlet weak var mileLabel: UILabel!
    @IBOutlet weak var dinningButton: UIButton!
    
    @IBAction func mileSlider(_ sender: Any) {
    }
    //property
    let cuisines = ["American", "Asian", "Mexican"]
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cuisines.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

                return cuisines[row]
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cuisineLabel.text = cuisines[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}
//    @IBAction func dinningDropButton(_ sender: Any) {
//    }

//    @IBAction func favControl(_ sender: Any) {
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


