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
    
    var minimumValue: String!
    var maximumValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.text = minimumValue
        maximumValueTF.text = maximumValue
        
    }
    
    @IBAction func cancelButtonWasTapped() {
        dismiss(animated: true) // закрывает ViewController
    }
    
}

