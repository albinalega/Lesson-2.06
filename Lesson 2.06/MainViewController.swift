//
//  ViewController.swift
//  Lesson 2.06
//
//  Created by Альбина Лега on 30/09/2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber)
}

class MainViewController: UIViewController {
    
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    @IBOutlet var getRandomNumberButton: UIButton!
    
    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)

    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueLabel.text = randomNumber.minimumValue.formatted()
        maximumValueLabel.text = randomNumber.maximumValue.formatted()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // вызывается всегда при переходе по сигвею. В этом методе мы создаем экземпляр класса, на который собираемся перейти, для того, чтобы передать туда данные (на VC на который собираемся перейти)
        //Это делается только в том случае, если нам нужно передать данные. Если передавать данные не нужно, то реализовывать методы тоже не нужно
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
        
    }

    @IBAction func getRandomNumberButtonTapped() {
        randomValueLabel.text = randomNumber.getRandom.formatted()
    }
    
//  @IBAction func unwind(for segue: UIStoryboardSegue) {}// с этим методом мы связали кнопку SAVE. Этот метод используется только в том случае, когда нужно передать данные из того VC, с которого вы ушли, на текущий VC.
}

// лучше подписывать класс под протокол в расширении

// MARK: SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber) {
        self.randomNumber = randomNumber
        minimumValueLabel.text = randomNumber.minimumValue.formatted()
        maximumValueLabel.text = randomNumber.maximumValue.formatted()
    }
}
