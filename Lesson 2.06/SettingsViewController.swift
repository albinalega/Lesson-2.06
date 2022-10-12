//
//  SettingsViewController.swift
//  Lesson 2.06
//
//  Created by Альбина Лега on 30/09/2022.
//

import UIKit

final class SettingsViewController: UIViewController { // final - указание на конечный класс
    @IBOutlet var minimumValueTF: UITextField!
    @IBOutlet var maximumValueTF: UITextField!
    
    var randomNumber: RandomNumber!
    var delegate: SettingsViewControllerDelegate! // экземпляр протокола
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.delegate = self
        maximumValueTF.delegate = self
        minimumValueTF.text = randomNumber.minimumValue.formatted()
        maximumValueTF.text = randomNumber.maximumValue.formatted()
        
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true) // закрывает ViewController
    }
    
    @IBAction func saveButtonPressed() {
        view.endEditing(true)
        delegate.setNewValues(for: randomNumber)
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return } // извлекаем значение
        guard let numberValue = Int(newValue) else { return } // убеждаемся, что newValue явл-ся целочисленным
        if textField == minimumValueTF {
            randomNumber.minimumValue = numberValue
        } else {
            randomNumber.maximumValue = numberValue
        }
    }
}

