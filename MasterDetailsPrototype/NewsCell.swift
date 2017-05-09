//
//  NewsCell.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    var newsItem: NewsItem? {
        didSet {
            textLabel?.text = newsItem?.title
        }
    }
}
