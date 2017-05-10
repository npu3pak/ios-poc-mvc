//
//  NewsNavigationCoordinator.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import SegueCoordinator

class NewsCoordinator: SegueCoordinator {
    init(navigationController: UINavigationController) {
        super.init(storyboardName: "News", rootNavigationController: navigationController)
    }
    
    func start() {
        pushInitial() {
            let newsController = $0 as! NewsController
            newsController.coordinator = self
            newsController.model = NewsFacade()
            newsController.onShowNewsDetails = showNewsDetails
        }
    }
    
    func showNewsDetails(model: NewsDetailsFacade) {
        segue("ShowDetails") {
            let detailsController = $0 as! NewsDetailsController
            detailsController.coordinator = self
            detailsController.model = model
        }
    }
}
