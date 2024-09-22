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

class TodosViewControllerViewModel {
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
    
    public var completedToDoViewModels: [TodosTableViewCellViewModel]
    
//    private func setUpcompletedToDoViewModels() -> [TodosTableViewCellViewModel] {
//        return todos.filter { $0.completed }.compactMap { return TodosTableViewCellViewModel(title: $0.title, isCompleted: $0.completed) }
//    }
//    
//    private func setUpUncompletedToDoViewModels() -> [TodosTableViewCellViewModel] {
//        return todos.filter { !$0.completed }.compactMap { return TodosTableViewCellViewModel(title: $0.title, isCompleted: $0.completed) }
//    }
    
    public var notCompletedToDoViewModels: [TodosTableViewCellViewModel]
}
