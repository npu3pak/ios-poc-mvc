//
//  News.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import Foundation

class NewsItem {
    var id: Int64?
    var title: String?
    var text: String?
    
    init(id: Int64?, title: String?, text: String?) {
        self.id = id
        self.title = title
        self.text = text
    }
}
