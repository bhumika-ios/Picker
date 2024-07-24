//
//  ViewController.swift
//  Picker
//
//  Created by Bhumika Patel on 24/07/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    private let pickerView = UIPickerView()
        
        private let days = Array(1...31)
        private let hours = Array(0...23)
        private let minutes = Array(0...59)

    @IBOutlet weak var dateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
                pickerView.delegate = self
                
                dateTextField.inputView = pickerView
                
                // Create a toolbar with a Done button
                let toolbar = UIToolbar()
                toolbar.sizeToFit()
                
                let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
                toolbar.setItems([doneButton], animated: false)
                
                dateTextField.inputAccessoryView = toolbar
    }
    @objc func doneAction() {
           let day = days[pickerView.selectedRow(inComponent: 0)]
           let hour = hours[pickerView.selectedRow(inComponent: 1)]
           let minute = minutes[pickerView.selectedRow(inComponent: 2)]
           
           dateTextField.text = String(format: "%02dd %02dh %02dm", day, hour, minute)
           dateTextField.resignFirstResponder()
       }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 3
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch component {
            case 0:
                return days.count
            case 1:
                return hours.count
            case 2:
                return minutes.count
            default:
                return 0
            }
        }
        
        // MARK: - UIPickerViewDelegate
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch component {
            case 0:
                return "\(days[row]) Days"
            case 1:
                return "\(hours[row]) Hours"
            case 2:
                return "\(minutes[row]) Minutes"
            default:
                return nil
            }
        }
}

