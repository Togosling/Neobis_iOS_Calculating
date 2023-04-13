//
//  ViewController.swift
//  Neobis_iOS_Calculating
//
//  Created by Тагай Абдылдаев on 12/4/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    fileprivate func setupView() {
        
        let mainView = MainView()
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }


}

