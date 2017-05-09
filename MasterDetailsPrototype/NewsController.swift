//
//  NewsController.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {
    private let model = NewsFacade()

    override func viewDidLoad() {
        super.viewDidLoad()
        showItems()
    }
    
    func showItems() {
        guard model.hasNews else {
            //Показываем надпись, что новостей нет
            return
        }
        
        tableView.reloadData()
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
