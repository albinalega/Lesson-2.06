//
//  ViewController.swift
//  Lesson 2.06
//
//  Created by Альбина Лега on 30/09/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    @IBOutlet var getRandomNumberButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // вызывается всегда при переходе по сигвею. В этом методе мы создаем экземпляр класса, на который собираемся перейти, для того, чтобы передать туда данные (на VC на который собираемся перейти)
        //Это делается только в том случае, если нам нужно передать данные. Если передавать данные не нужно, то реализовывать методы тоже не нужно
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.minimumValue = minimumValueLabel.text
        settingsVC.maximumValue = maximumValueLabel.text
        
    }

    @IBAction func getRandomNumberButtonTapped() {
        let minimumNumber = Int(minimumValueLabel.text ?? "") ?? 0
        let maximumNumber = Int(maximumValueLabel.text ?? "") ?? 0
        
        randomValueLabel.text = Int.random(in: minimumNumber...maximumNumber).formatted()
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) { // с этим методом мы связали кнопку SAVE. Этот метод используется только в том случае, когда нужно передать данные из того VC, с которого вы ушли, на тот, на текущий VC. Если данные передавать не нужно, то реализовывать метод тоже не нужно
        guard let settingsVC = segue.source as? SettingsViewController else { return }
        minimumValueLabel.text = settingsVC.minimumValueTF.text
        maximumValueLabel.text = settingsVC.maximumValueTF.text
    }

}

