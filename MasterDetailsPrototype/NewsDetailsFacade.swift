//
//  NewsDetailsFacade.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import Foundation

class NewsDetailsFacade {
    var newsItem: NewsItem
    
    init(newsItem: NewsItem) {
        self.newsItem = newsItem
    }
    
    var title: String? {
        return newsItem.title
    }
    
    var text: String? {
        return newsItem.text
    }
}
