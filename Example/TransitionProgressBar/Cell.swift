//
//  Cell.swift
//  TransitionProgressBar_Example
//
//  Created by Alexander Korus on 31.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import TransitionProgressBar
import Relieve

class Cell: UITableViewCell, RelieveTableViewCell {
    
    static var Identifier: String = "CellIdentifier"
    
    let bar: TransitionProgressBar = {
        let bar: TransitionProgressBar = TransitionProgressBar()
        bar.roundedCorners = true
        return bar
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        
        // Set Subviews
        for view in [self.bar] {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = true
        }
        
        
        
        self.bar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(25.0)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
