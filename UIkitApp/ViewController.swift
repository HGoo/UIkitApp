//
//  ViewController.swift
//  UIkitApp
//
//  Created by Николай Петров on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLable: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var hideAllElements: UISwitch!
    @IBOutlet var switchLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup main lable
        mainLable.font = mainLable.font.withSize(35)
        mainLable.textAlignment = .center
        mainLable.numberOfLines = 2
        
        //Setup segment contril
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        //Setup slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .blue
        slider.thumbTintColor = .red

        mainLable.text = String(slider.value)
        
        //Setup date pocker
        datePicker.locale = Locale(identifier: "ru_RU")
        
        //Локализация в соответсвие с текущими настройками системы
        // datePicker.locale = Locale.current
        
        hideAllElements.onTintColor = .red
        switchLable.text = "Hide all elements"
    }

    @IBAction func changeSegmente() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLable.text = "The first segment is selected"
            mainLable.textColor = .purple
        case 1:
            mainLable.text = "The second segment is selected"
            mainLable.textColor = .blue
        case 2:
            mainLable.text = "The third segment is selected"
            mainLable.textColor = .green
        default: break
        }
    }
    
    @IBAction func sliderAction() {
        let backgroundColor = view.backgroundColor
        view.backgroundColor =
        backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        mainLable.text = String(slider.value)
    }
    
    @IBAction func doneButtonPresed() {
        guard let inputText = textField.text, !inputText.isEmpty else { return }
        
        if let _ = Double(inputText) {
            showAlert(title:"Wrong Format", message: "Please enter your name")
        } else {
            mainLable.text = inputText
            textField.text = nil
        }
    }
    @IBAction func chngeDate() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.locale = Locale(identifier: "ru_RU")
        
        let dateValue = dateFormater.string(from: datePicker.date)
        mainLable.text = dateValue
        

    }

    @IBAction func switchAction() {
        segmentedControl.isHidden.toggle()
        mainLable.isHidden.toggle()
        slider.isHidden.toggle()
        textField.isHidden.toggle()
        doneButton.isHidden.toggle()
        datePicker.isHidden.toggle()
        
        switchLable.text = hideAllElements.isOn ?  "View all elements" :"Hide all elements"
    }
    
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.textField.text = ""
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
}
