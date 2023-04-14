//
//  Helper.swift
//  Neobis_iOS_Calculating
//
//  Created by Тагай Абдылдаев on 12/4/23.
//

import UIKit

extension UIButton {
    func configureButton(title: String, tintColor: UIColor, backgroundColor: UIColor) {
        self.setTitle(title, for: .normal)
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = .systemFont(ofSize: 40)
    }
    
    func backgroundWhite() {
        self.backgroundColor = .white
        self.tintColor = UIColor(red: 255/255, green: 159/255, blue: 12/255, alpha: 1)
    }
    
    func backgroundOrange() {
        self.backgroundColor = UIColor(red: 255/255, green: 159/255, blue: 12/255, alpha: 1)
        self.tintColor = .white
    }
    
}

