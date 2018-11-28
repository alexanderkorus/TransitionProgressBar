//
//  View.swift
//  TransitionProgressBar_Example
//
//  Created by Alexander Korus on 25.11.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import TransistionProgressBar

class View: UIView {
    
    // MARK: - Subviews
    let bar: TransitionProgressBar = {
        let bar: TransitionProgressBar = TransitionProgressBar()
        return bar
    }()
    
    let leftProgressTextField: UITextField = {
        let view: UITextField = UITextField()
        view.borderStyle = UITextField.BorderStyle.line
        return view
    }()
    
    let rightProgressTextField: UITextField = {
        let view: UITextField = UITextField()
        view.borderStyle = UITextField.BorderStyle.line
        return view
    }()
    
    let changeProgressButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("Change progress", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        // Set Subviews
        for view in [self.bar, self.leftProgressTextField, self.rightProgressTextField, self.changeProgressButton] {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = true
        }
        
        // Constraints
        self.leftProgressTextField.snp.makeConstraints {
            $0.leading.equalTo(self.bar.snp.leading)
            $0.bottom.equalTo(self.bar.snp.top).offset(-10)
            $0.width.equalTo(self.bar.snp.width).multipliedBy(0.5)
            $0.height.equalTo(40.0)
        }
        
        self.rightProgressTextField.snp.makeConstraints {
            $0.trailing.equalTo(self.bar.snp.trailing)
            $0.bottom.equalTo(self.bar.snp.top).offset(-10)
            $0.width.equalTo(self.bar.snp.width).multipliedBy(0.5)
            $0.height.equalTo(40.0)
        }
        
        self.changeProgressButton.snp.makeConstraints {
            $0.top.equalTo(self.bar.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        
        self.bar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(30.0)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

