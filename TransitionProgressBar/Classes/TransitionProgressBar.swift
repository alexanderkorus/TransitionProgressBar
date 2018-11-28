//
//  TransitionProgressBar.swift
//  Pods-TransitionProgressBar_Example
//
//  Created by Alexander Korus on 25.11.18.
//

import Foundation
import UIKit
import SnapKit

public class TransitionProgressBar: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.subview(forAutoLayout: self.container)
        self.container.subviews(forAutoLayout: [self.rightProgressView, self.leftProgressView, self.leftProgressLabel, self.rightProgressLabel])
        
        self.container.snp.remakeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        self.leftProgressView.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            
        }
        
        self.rightProgressView.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            
        }
        
        self.leftProgressLabel.snp.remakeConstraints {
            $0.leading.equalToSuperview().offset(10.0)
            $0.centerY.equalToSuperview()
        }
        
        self.rightProgressLabel.snp.remakeConstraints {
            $0.trailing.equalToSuperview().inset(10.0)
            $0.centerY.equalToSuperview()
        }
        
        
        
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Instance methods

    // MARK: Subviews
    private let container: UIView = {
        let view: UIView = UIView()
        return view
    }()
    
    private let leftProgressView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let rightProgressView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private let leftProgressLabel: UILabel = {
        let label: UILabel = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    private let rightProgressLabel: UILabel = {
        let label: UILabel = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
}


