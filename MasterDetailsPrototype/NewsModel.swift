//
//  NewsModel.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import Foundation

class NewsModel {
    static let updatedNotification = Notification.Name("NewsUpdated")
    
    var news: [NewsItem]?
    
    func updateNews(onError: ((NetworkError) -> Void)?) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.news = [
                NewsItem(id: 1, title: "А у нас в квартире...", text: "А у нас в квартире газ, а у вас?"),
                NewsItem(id: 2, title: "А у нас...", text: "А у нас водопровод, вот."),
                NewsItem(id: 3, title: "А у нас сегодня кошка родила...", text: "А у нас сегодня кошка родила вчера котят. Котята выросли немножко, а есть из блюдца не хотят"),
            ]
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NewsModel.updatedNotification, object: nil)
            }
        }
        
    }
}
