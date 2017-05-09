//
//  NewsDetailsController.swift
//  MasterDetailsPrototype
//
//  Created by Evgeniy Safronov on 09.05.17.
//  Copyright © 2017 Evgeniy Safronov. All rights reserved.
//

import UIKit

class NewsDetailsController: UIViewController {
    var coordinator: NewsCoordinator?
    var model: NewsDetailsFacade?
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        showData()
    }
    
    func showData() {
        title = model?.title
        textView.text = model?.text
    }
    
    //MARK: Связь с координатором
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        coordinator?.prepareForSegue(segue, sender: sender)
    }
}
