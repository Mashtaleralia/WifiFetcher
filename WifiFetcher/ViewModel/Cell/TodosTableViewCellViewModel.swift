//
//  TodosTableViewCellViewModel.swift
//  WifiFetcher
//
//  Created by Admin on 20.09.2024.
//

import UIKit

final class TodosTableViewCellViewModel {
    
    var thumbImage: UIImage? {
        switch isCompleted {
        case true:
            return UIImage(named: "completed")
        case false:
            return UIImage(named: "uncompleted")
        }
    }
    
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
}
