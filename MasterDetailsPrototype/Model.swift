//
//  Model.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import Foundation

class Model {
    var news: NewsModel
    
    static let instance = Model()
    
    private init() {
        news = NewsModel()
    }
    
    func initialize() {
        //Тут можно сделать предварительную настройку модели
    }
}
