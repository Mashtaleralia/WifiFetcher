//
//  FetcherViewControllerViewModel.swift
//  WifiFetcher
//
//  Created by Admin on 19.09.2024.
//

import UIKit

protocol FetcherViewControllerViewModelProtocol: AnyObject {
    func dataDidFetch()
}

class FetcherViewControllerViewModel {
    
    weak var delegate: FetcherViewControllerViewModelProtocol?
    
    var fetchingStatusViewModel = FetchingStatusViewViewModel()
    
    var resultsPanelViewModel = ShowResultsPanelViewViewModel()
    
    var todos: [ToDo] = []
    
    var state: FetchingState = .initial {
        didSet {
            fetchingStatusViewModel.state = state
        }
    }
    
    func fetchData() {
        state = .fetching
        if resultsPanelViewModel.isToggled {
            APICaller.shared.fetchFifthIdToDo { [weak self] result in
                switch result {
                case .success(let todos):
                    self?.state = .completed
                    self?.todos = todos
                    //print(todos)
                    self?.delegate?.dataDidFetch()
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            APICaller.shared.fetchToDos { [weak self] result in
                switch result {
                case .success(let todos):
                    self?.state = .completed
                    self?.todos = todos
                    self?.delegate?.dataDidFetch()
                    //print(todos)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
