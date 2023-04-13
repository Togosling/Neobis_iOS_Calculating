//
//  ViewController.swift
//  Neobis_iOS_Calculating
//
//  Created by Тагай Абдылдаев on 12/4/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    var periodAnswer: Float = 0
    var calculator = Calculator(left: 0, right: 0, operation: .plus)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        calculating()
    }
    
    fileprivate func calculating() {
        mainView.operationPressed = {[weak self] (leftNumber, operation) in
            switch operation{
            case 11:
                if self?.periodAnswer == 0 {
                    self?.periodAnswer = Float(leftNumber)
                    self?.calculator.operation = .plus
                } else {
                    self?.calculator.left = self?.periodAnswer ?? 0
                    self?.calculator.right = Float(leftNumber)
                    self?.periodAnswer = self?.calculator.calculate() ?? 0
                    self?.calculator.operation = .plus
                }
            case 12:
                if self?.periodAnswer == 0 {
                    self?.periodAnswer = Float(leftNumber)
                    self?.calculator.operation = .minus
                } else {
                    self?.calculator.left = self?.periodAnswer ?? 0
                    self?.calculator.right = Float(leftNumber)
                    self?.periodAnswer = self?.calculator.calculate() ?? 0
                    self?.calculator.operation = .minus
                }
            case 13:
                if self?.periodAnswer == 0 {
                    self?.periodAnswer = Float(leftNumber)
                    self?.calculator.operation = .multiply
                } else {
                    self?.calculator.left = self?.periodAnswer ?? 0
                    self?.calculator.right = Float(leftNumber)
                    self?.periodAnswer = self?.calculator.calculate() ?? 0
                    self?.calculator.operation = .multiply
                }
            case 14:
                if self?.periodAnswer == 0 {
                    self?.periodAnswer = Float(leftNumber)
                    self?.calculator.operation = .divide
                } else {
                    self?.calculator.left = self?.periodAnswer ?? 0
                    self?.calculator.right = Float(leftNumber)
                    self?.periodAnswer = self?.calculator.calculate() ?? 0
                    self?.calculator.operation = .divide
                }
            case 15:
                self?.calculator.right = Float(leftNumber)
                self?.calculator.left = self?.periodAnswer ?? 0
                self?.handleEqual()
                self?.periodAnswer = 0
            case 18:
                self?.handlePercent(number: Float(leftNumber))
            default: ()
            }
        }
    }
    
    fileprivate func handleEqual() {
        let answer = calculator.calculate()
        let intAnswer = Int(answer)
        if answer - Float(intAnswer) != 0 {
            let stringAnswer = String(answer)
            mainView.answerlabel.text = stringAnswer
        } else {
            let stringAnswer = String(Int(answer))
            mainView.answerlabel.text = stringAnswer

        }
    }
    
    fileprivate func handlePercent(number: Float) {
        let answer = number / 100
        let intAnswer = Int(answer)
        if answer - Float(intAnswer) != 0 {
            let stringAnswer = String(answer)
            mainView.answerlabel.text = stringAnswer
        } else {
            let stringAnswer = String(Int(answer))
            mainView.answerlabel.text = stringAnswer

        }
    }
    
    fileprivate func setupView() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }


}

