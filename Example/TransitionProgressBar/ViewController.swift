//
//  ViewController.swift
//  TransitionProgressBar
//
//  Created by BigAlKo on 11/25/2018.
//  Copyright (c) 2018 BigAlKo. All rights reserved.
//

import UIKit
import SnapKit
import TransitionProgressBar

class ViewController: UIViewController {
    
    // MARK: - Stored Properties

    // MARK: - Initializers
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.changeProgressButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
      
    }
    
    
    override func loadView() {
        self.view = View()
    }
    
    // MARK: - Instance Methods
    
}

// MARK: - Views
private extension ViewController {
    unowned var rootView: View { return self.view as! View }
    unowned var leftProgressTextField: UITextField { return self.rootView.leftProgressTextField }
    unowned var changeProgressButton: UIButton { return self.rootView.changeProgressButton }
    unowned var bar: TransitionProgressBar { return self.rootView.bar }
}

// MARK: - Target Action Functions
extension ViewController {
    
    @objc func buttonClicked() {
        if let progress = NumberFormatter().number(from: self.leftProgressTextField.text ?? "0") as? CGFloat {
            self.bar.leftProgress = progress
        }
    }
    
}

// MARK -  Delegate Functions



