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
import Relieve

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
        
        self.tableView.register(Cell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    
    override func loadView() {
        self.view = View()
    }
    
    // MARK: - Instance Methods
    
}

// MARK: - Views
private extension ViewController {
    unowned var rootView: View { return self.view as! View }
    unowned var tableView: UITableView { return self.rootView.tableView }
}

// MARK: - Target Action Functions
extension ViewController {
    
   
    
} 

// MARK -  Delegate Functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.Identifier, for: indexPath) as! Cell
        
        switch indexPath.row {
            case 0:
                cell.bar.leftProgress = 0.01
            case 1:
                cell.bar.leftProgress = 0.42
            case 2:
                cell.bar.leftProgress = 0.61
            case 3:
                cell.bar.leftProgress = 0.56
            case 4:
                cell.bar.leftProgress = 1.0
            default:
                cell.bar.leftProgress = 0.5
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            (cell as? Cell)?.bar.leftProgress = 0.01
        case 1:
            (cell as? Cell)?.bar.leftProgress = 0.42
        case 2:
            (cell as? Cell)?.bar.leftProgress = 0.61
        case 3:
            (cell as? Cell)?.bar.leftProgress = 0.56
        case 4:
            (cell as? Cell)?.bar.leftProgress = 1.0
        default:
            (cell as? Cell)?.bar.leftProgress = 0.5
        }
        
        
    }
}


