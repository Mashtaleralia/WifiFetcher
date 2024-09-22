//
//  TodosViewControllerViewModel.swift
//  WifiFetcher
//
//  Created by Admin on 20.09.2024.
//

import Foundation

enum Section: String {
    case completed = "Completed"
    case notCompleted = "Not completed"
}

final class TodosViewControllerViewModel {
    var sections: [Section] = [.completed, .notCompleted]
    
    var todos: [ToDo]
    
    init(todos: [ToDo]) {
        self.todos = todos
        print("viewmodel is ready")
        self.completedToDoViewModels = todos
        .filter
        { $0.completed }
        .compactMap
        { return TodosTableViewCellViewModel(title: $0.title, isCompleted: $0.completed) }
        self.notCompletedToDoViewModels = todos
        .filter
        { !$0.completed }
        .compactMap
        { return TodosTableViewCellViewModel(title: $0.title, isCompleted: $0.completed) }
        //print(completedToDoViewModels.count)
    }
    
    var completedToDoViewModels: [TodosTableViewCellViewModel]
    
    var notCompletedToDoViewModels: [TodosTableViewCellViewModel]
}
