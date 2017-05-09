//
//  NewsFacade.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import Foundation

protocol NewsFacadeDelegate {
    func onNewsUpdated()
    func onNewsUpdateError(_ error: NetworkError)
    func showNewsDetails(model: NewsDetailsFacade)
}

class NewsFacade {
    var model = Model.instance.news
    var delegate: NewsFacadeDelegate?

    //MARK: Привязка к модели
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(onNewsUpdated), name: NewsModel.updatedNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: Обращение к данным
    var hasNews: Bool {
        return news != nil
    }
    
    var news: [NewsItem]? {
        return model.news
    }
    
    //MARK: Обновление данных
    func updateNews() {
        model.updateNews(onError: onNewsUpdateError)
    }
    
    @objc private func onNewsUpdated() {
        delegate?.onNewsUpdated()
    }
    
    private func onNewsUpdateError(error: NetworkError) {
        delegate?.onNewsUpdateError(error)
    }
    
    //MARK: Вспомогательные методы
    
    func selectItem(row: Int) {
        if let item = news?[row] {
            let facade = NewsDetailsFacade(newsItem: item)
            delegate?.showNewsDetails(model: facade)
        }
    }
}
