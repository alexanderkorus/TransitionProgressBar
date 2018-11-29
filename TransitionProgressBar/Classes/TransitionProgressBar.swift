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
    
    private var _leftProgress: CGFloat = 0.5
    private let _cornerRadius: CGFloat = 0.7
    
    public var leftProgress: CGFloat {
        get {
            return self._leftProgress
        }
        
        set {
            self._leftProgress = min(max(newValue,0), 1)
            
            self.setNeedsLayout()
            self.setNeedsUpdateConstraints()
            self.layoutIfNeeded()
        }
    }
    
    public var roundedCorners: Bool = true {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    public var font: UIFont = UIFont.systemFont(ofSize: 15.0) {
        didSet {
            self.leftProgressLabel.font = font
            self.rightProgressLabel.font = font
            self.setNeedsLayout()
        }
    }
    
    public var fontColor: UIColor = UIColor.white {
        didSet {
            self.leftProgressLabel.textColor = fontColor
            self.rightProgressLabel.textColor = fontColor
            self.setNeedsLayout()
        }
    }
    
    public var leftProgressColor: UIColor = UIColor.green {
        didSet {
            self.leftProgressView.backgroundColor = leftProgressColor
            self.setNeedsLayout()
        }
    }
    
    public var rightProgressColor: UIColor = UIColor.lightGray {
        didSet {
            self.container.backgroundColor = leftProgressColor
            self.setNeedsLayout()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.subviews(forAutoLayout: [self.container])
        self.container.subviews(forAutoLayout: [self.leftProgressView, self.leftProgressLabel, self.rightProgressLabel])
        
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
            make.width.equalToSuperview().multipliedBy(0.99)
            
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateProgressLabel()
        self.setNeedsUpdateConstraints()
        self.setNeedsLayout()
        
    }
    
    public override func updateConstraints() {
        super.updateConstraints()
        updateProgress()
    }
    
    private func updateProgress() {
        
        self.leftProgressView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(_leftProgress)
            
        }
        
        if roundedCorners {
            self.container.round(corners: [.topRight, .bottomRight, .topLeft, .bottomLeft], radius: _cornerRadius)
            self.leftProgressView.round(corners: [.topLeft, .bottomLeft], radius: _cornerRadius)
        }
    }
    
    private func updateProgressLabel() {
        self.leftProgressLabel.text = "\(Int(Darwin.round(_leftProgress * 100)))%"
        self.rightProgressLabel.text = "\(Int(Darwin.round((1.0 - _leftProgress) * 100)))%"
    }
    
    public func animateTo(leftProgress: CGFloat, completion: (() -> Void)? = nil) {
        
        UIView.animate(withDuration: 0.8, animations: {
            self.leftProgress = leftProgress
            self.layoutIfNeeded()
        })
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Instance methods

    // MARK: Subviews
    private lazy var container: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.lightGray
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var leftProgressView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    
    private let leftProgressLabel: UILabel = {
        let label: UILabel = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.text = "50 %"
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()
    
    private let rightProgressLabel: UILabel = {
        let label: UILabel = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.text = "50 %"
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()
    
}


