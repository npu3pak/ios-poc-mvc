//
//  NewsController.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import UIKit

class NewsController: UITableViewController, NewsFacadeDelegate {
    private let model = NewsFacade()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
        update()
    }
    
    func update() {
        model.updateNews()
    }
    
    //MARK: События модели
    func onNewsUpdated() {
        refreshControl?.endRefreshing()
        
        guard model.hasNews else {
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
        return model.news?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.newsItem = model.news![indexPath.row]
        return cell
    }
    
    //MARK: Отображение подробностей
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            let detailsController = segue.destination as! NewsDetailsController
            detailsController.model = model.detailsFacadeForItem(row: tableView.indexPathForSelectedRow!.row)
        }
    }
}
