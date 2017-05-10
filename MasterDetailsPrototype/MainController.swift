//
//  MainViewController.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    var newsCoordinator: NewsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        newsCoordinator = NewsCoordinator(navigationController: navigationController!)
    }
    
    @IBAction func onNewsButtonClick(_ sender: Any) {
        newsCoordinator?.start()
    }
}
