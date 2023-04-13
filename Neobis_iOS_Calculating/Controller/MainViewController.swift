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
                self?.calculator.left = Float(leftNumber)
                self?.calculator.operation = .plus
            case 12:
                self?.calculator.left = Float(leftNumber)
                self?.calculator.operation = .minus
            case 13:
                self?.calculator.left = Float(leftNumber)
                self?.calculator.operation = .multiply
            case 14:
                self?.calculator.left = Float(leftNumber)
                self?.calculator.operation = .divide
            default: ()
            }
        }
        
        mainView.equalPressed = {[weak self] rightNumber in
            self?.calculator.right = Float(rightNumber)
            self?.handleEqual()
            
        }
    }
    
    fileprivate func handleEqual() {
        let answer = calculator.calculate() 
        let stringAnswer = String(answer)
        mainView.answerlabel.text = stringAnswer
        
    }
    
    fileprivate func setupView() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }


}

