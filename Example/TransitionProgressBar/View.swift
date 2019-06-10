//
//  View.swift
//  TransitionProgressBar_Example
//
//  Created by Alexander Korus on 25.11.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import TransitionProgressBar
import Relieve

class View: UIView {
    
    // MARK: - Subviews
    let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        // Set Subviews
        for view in [self.tableView] {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = true
        }
        
        
        self.tableView.snp.remakeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

