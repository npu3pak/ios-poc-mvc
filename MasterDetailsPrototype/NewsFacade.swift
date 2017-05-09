//
//  NewsFacade.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import Foundation

class NewsFacade {
    var model = Model.instance.news

    var news: [NewsItem]? {
        return model.news
    }
    
    func reloadNews() {
        model.reloadNews()
    }
    
    var hasNews: Bool {
        return news != nil
    }
    
    func detailsFacadeForItem(row: Int) -> NewsDetailsFacade? {
        if let item = news?[row] {
            return NewsDetailsFacade(newsItem: item)
        }
        return nil
    }
}
