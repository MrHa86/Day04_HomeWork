//
//  ViewController.swift
//  Day04_HomeWork
//
//  Created by Vu Nam Ha on 08/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var repeatTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    var arrRepeat: [String] = ["Never", "Hourly", "Every day", "Every week","Every month", "Every year" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configdateTextField()
        configTimeTextField()
        configPickerView()
    }
    
    func configPickerView() {
            // Delegate
            pickerView.delegate = self
            // Data source
            pickerView.dataSource = self
        }
    
    func configTimeTextField() {
            
            timePicker.datePickerMode = .time
            
            timeTextField.inputView = timePicker
            
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            
            
            timePicker.preferredDatePickerStyle = .wheels
            
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTimePicker))
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
            // thêm khoảng trống để nút Cancel sang bên phải
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: #selector(cancelDatePicker))
            
            toolBar.setItems([doneButton, space, cancelButton], animated: true)
            
            timeTextField.inputAccessoryView = toolBar
        }
    
    func configdateTextField() {
            // mode cho datepicker
            datePicker.datePickerMode = .date   // chọn ngày tháng năm
            // set textfield chỉ nhận input từ datepicker, ko nhận từ bàn phím
            dateTextField.inputView = datePicker
            // tạo toolbar cho datepicker
            let toolBar = UIToolbar()
            toolBar.sizeToFit()     // tự động giãn fit kích thước input view
            
            // chọn style cho datePicker
            datePicker.preferredDatePickerStyle = .wheels
            
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
            // thêm khoảng trống để nút Cancel sang bên phải
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: #selector(cancelDatePicker))
            
            toolBar.setItems([doneButton, space, cancelButton], animated: true)
            
            dateTextField.inputAccessoryView = toolBar
        }
        
        @objc func doneDatePicker() {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "EEEE, dd MMM yyyy"
            dateTextField.text = dateFormater.string(from: datePicker.date)
        
            cancelDatePicker()
        }
    
    @objc func doneTimePicker() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "h:mm a"
        timeTextField.text = dateFormater.string(from: timePicker.date)
    
        cancelDatePicker()
    }
    
        @objc func cancelDatePicker() {
            self.view.endEditing(true)
        }


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return arrRepeat.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return String(arrRepeat[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        repeatTextField.text = String(arrRepeat[row])
    }
}

