//
//  FetcherViewControllerViewModel.swift
//  WifiFetcher
//
//  Created by Admin on 19.09.2024.
//

import UIKit

class FetcherViewControllerViewModel {
    
    var fetchingStatusViewModel = FetchingStatusViewViewModel()
    
    var resultsPanelViewModel = ShowResultsPanelViewViewModel()
    
    var state: FetchingState = .initial {
        didSet {
            fetchingStatusViewModel.state = state
        }
    }
    
    public func fetchData(completion: @escaping () -> Void) {
        state = .fetching
        if resultsPanelViewModel.isToggled {
            APICaller.shared.fetchFifthIdToDo { [weak self] result in
                switch result {
                case .success(let todos):
                    self?.state = .completed
                    completion()
                    print(todos)
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            APICaller.shared.fetchToDos { [weak self] result in
                switch result {
                case .success(let todos):
                    self?.state = .completed
                    completion()
                    print(todos)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
