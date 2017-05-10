//
//  NewsController.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import UIKit

class NewsController: UITableViewController, NewsFacadeDelegate {
    var model: NewsFacade? {
        didSet {
            model?.delegate = self
        }
    }
    
    var onShowNewsDetails: ((NewsDetailsFacade) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новости"
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
        update()
    }
    
    func update() {
        model?.updateNews()
    }
    
    //MARK: События модели
    func onNewsUpdated() {
        refreshControl?.endRefreshing()
        
        guard model?.hasNews ?? false else {
            //Показываем надпись, что новостей нет
            return
        }
        
        tableView.reloadData()
    }
    
    func onNewsUpdateError(_ error: NetworkError) {
        refreshControl?.endRefreshing()
        //Показываем сообщение об ошибке
    }

    //MARK: Заполнение таблицы
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.news?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.newsItem = model?.news![indexPath.row]
        return cell
    }
    
    //MARK: Отображение подробностей
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        model?.selectItem(row: indexPath.row)
    }
    
    func showNewsDetails(model: NewsDetailsFacade) {
        onShowNewsDetails?(model)
    }
}
