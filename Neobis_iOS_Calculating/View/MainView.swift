//
//  MainView.swift
//  Neobis_iOS_Calculating
//
//  Created by Тагай Абдылдаев on 12/4/23.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    var operationPressed: ((Float,Int) -> ())?
    
    let button1 =  UIButton(type: .system)
    let button2 =  UIButton(type: .system)
    let button3 =  UIButton(type: .system)
    let button4 =  UIButton(type: .system)
    let button5 =  UIButton(type: .system)
    let button6 =  UIButton(type: .system)
    let button7 =  UIButton(type: .system)
    let button8 =  UIButton(type: .system)
    let button9 =  UIButton(type: .system)
    let button0 =  UIButton(type: .system)
    let buttonDot =  UIButton(type: .system)
    let buttonMultiply =  UIButton(type: .system)
    let buttonDivide =  UIButton(type: .system)
    let buttonEqual =  UIButton(type: .system)
    let buttonMinus =  UIButton(type: .system)
    let buttonPlusMinus =  UIButton(type: .system)
    let buttonPlus =  UIButton(type: .system)
    let buttonAC =  UIButton(type: .system)
    let buttonPercent =  UIButton(type: .system)
    
    let answerlabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 100)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        backgroundColor = .black
        
        setupViews()
        addTarget()
        
    }
    
    fileprivate func addTarget() {
        
        button1.tag = 1
        button2.tag = 2
        button3.tag = 3
        button4.tag = 4
        button5.tag = 5
        button6.tag = 6
        button7.tag = 7
        button8.tag = 8
        button9.tag = 9
        button0.tag = 0
        buttonDivide.tag = 14
        buttonMinus.tag = 12
        buttonDot.tag = 17
        buttonEqual.tag = 15
        buttonMultiply.tag = 13
        buttonPlus.tag = 11
        buttonPlusMinus.tag = 16
        buttonAC.tag = 19
        buttonPercent.tag = 18
        
        button1.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button2.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button3.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button4.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button5.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button6.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button7.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button8.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button9.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        button0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        buttonDivide.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        buttonMinus.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        buttonDot.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        buttonEqual.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        buttonMultiply.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        buttonPlus.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        buttonPlusMinus.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        buttonAC.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        buttonPercent.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
    }
    
    @objc func handleButtonTap(sender: UIButton) {
                
        switch sender.tag {
        case 0,1,2,3,4,5,6,7,8,9 :
            if answerlabel.text == "0" {
                answerlabel.text = "\(sender.tag)"
            } else if let text = answerlabel.text {
                answerlabel.text = "\(text)\(sender.tag)"
            }
            setButtonColorToDefault()
            buttonAC.setTitle("C", for: .normal)
        case 11,12,13,14:
            if let text = answerlabel.text, let value = Float(text) {
                operationPressed?(value,sender.tag)
            }
            answerlabel.text = "0"
            setButtonColorToDefault()
            if sender.backgroundColor == .white {
                sender.backgroundOrange()
            } else {
                sender.backgroundWhite()
            }
        case 15:
            if let text = answerlabel.text, let value = Float(text) {
                operationPressed?(value,sender.tag)
            }
            setButtonColorToDefault()
        case 16:
            if let text = answerlabel.text, let value = Float(text) {
                let result = value * (-1)
                let intResult = Int(result)
                if value + Float(intResult) != 0 {
                    answerlabel.text = "\(value * (-1))"
                } else {
                    answerlabel.text = "\(Int(value) * (-1))"
                }
            }
        case 17:
            if let text = answerlabel.text {
                answerlabel.text = "\(text)."
            }
        case 18:
            if let text = answerlabel.text, let value = Float(text) {
                operationPressed?(value, sender.tag)
            }
        case 19:
            answerlabel.text = "0"
            setButtonColorToDefault()
            buttonAC.setTitle("AC", for: .normal)
        default: break
        }
        
    }
    
    fileprivate func setButtonColorToDefault() {
        
        let opertationButtons = [buttonPlus, buttonDivide, buttonMinus, buttonMultiply]

        opertationButtons.forEach { button in
            button.backgroundOrange()
        }
    }
    
    fileprivate func setupViews() {
        
        let buttons = [button1,button2,button3,button4,button5, button6, button7, button8, button9, buttonDot, buttonDivide, buttonMultiply, buttonEqual, buttonMinus, buttonPlus, buttonPlusMinus, buttonAC, buttonPercent]
        
        for i in 0 ..< 9 {
            buttons[i].configureButton(title: "\(i+1)", tintColor: .white, backgroundColor: UIColor(red: 97/255, green: 92/255, blue: 100/255, alpha: 1))
        }
        
        button0.configureButton(title: "0", tintColor: .white, backgroundColor: UIColor(red: 97/255, green: 92/255, blue: 100/255, alpha: 1))
        buttonMultiply.configureButton(title: "*", tintColor: .white, backgroundColor: UIColor(red: 255/255, green: 159/255, blue: 12/255, alpha: 1))
        buttonDivide.configureButton(title: "/", tintColor: .white, backgroundColor: UIColor(red: 255/255, green: 159/255, blue: 12/255, alpha: 1))
        buttonPlus.configureButton(title: "+", tintColor: .white, backgroundColor: UIColor(red: 255/255, green: 159/255, blue: 12/255, alpha: 1))
        buttonMinus.configureButton(title: "-", tintColor: .white, backgroundColor: UIColor(red: 255/255, green: 159/255, blue: 12/255, alpha: 1))
        buttonPlusMinus.configureButton(title: "+/-", tintColor: .black, backgroundColor: UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1))
        buttonEqual.configureButton(title: "=", tintColor: .white, backgroundColor: UIColor(red: 255/255, green: 159/255, blue: 12/255, alpha: 1))
        buttonAC.configureButton(title: "AC", tintColor: .black, backgroundColor: UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1))
        buttonDot.configureButton(title: ".", tintColor: .white, backgroundColor: UIColor(red: 97/255, green: 92/255, blue: 100/255, alpha: 1))
        buttonPercent.configureButton(title: "%", tintColor: .black, backgroundColor: UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1))
        
        buttons.forEach { button in
            button.snp.makeConstraints { make in make.height.width.equalTo(self.frame.height / 10)}
            button.layer.cornerRadius = self.frame.height / 20
        }
        
        button0.snp.makeConstraints { make in make.height.equalTo(self.frame.height / 10)
            make.width.equalTo(self.frame.height / 4.6)
        }
        
        addSubview(button0)
        button0.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-(self.frame.height / 18.52))
            make.leading.equalToSuperview()
        }
        let bottomStackView = UIStackView(arrangedSubviews: [buttonDot, buttonEqual])
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 17
        bottomStackView.distribution = .fillProportionally
        addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.bottom.equalTo(button0.snp.bottom)
            make.leading.equalTo(button0.snp.trailing).offset(17)
        }
        
        let bottomUpStackView = UIStackView(arrangedSubviews: [button1, button2, button3, buttonPlus])
        bottomUpStackView.axis = .horizontal
        bottomUpStackView.spacing = 17
        bottomUpStackView.distribution = .fillEqually
        addSubview(bottomUpStackView)
        bottomUpStackView.snp.makeConstraints { make in
            make.bottom.equalTo(bottomStackView.snp.top).offset(-12)
        }
        
        let middleStackView = UIStackView(arrangedSubviews: [button4, button5, button6, buttonMinus])
        middleStackView.axis = .horizontal
        middleStackView.spacing = 17
        middleStackView.distribution = .fillEqually
        addSubview(middleStackView)
        middleStackView.snp.makeConstraints { make in
            make.bottom.equalTo(bottomUpStackView.snp.top).offset(-12)
        }
        
        let middleUpStackView = UIStackView(arrangedSubviews: [button7, button8, button9, buttonMultiply])
        middleUpStackView.axis = .horizontal
        middleUpStackView.spacing = 17
        middleUpStackView.distribution = .fillEqually
        addSubview(middleUpStackView)
        middleUpStackView.snp.makeConstraints { make in
            make.bottom.equalTo(middleStackView.snp.top).offset(-12)
        }
        
        let topStackView = UIStackView(arrangedSubviews: [buttonAC, buttonPlusMinus, buttonPercent, buttonDivide])
        topStackView.axis = .horizontal
        topStackView.spacing = 17
        topStackView.distribution = .fillEqually
        addSubview(topStackView)
        topStackView.snp.makeConstraints { make in
            make.bottom.equalTo(middleUpStackView.snp.top).offset(-12)
        }
        
        addSubview(answerlabel)
        answerlabel.snp.makeConstraints { make in
            make.bottom.equalTo(topStackView.snp.top).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview()
            make.height.equalTo(90)
        }
        
    }
}

