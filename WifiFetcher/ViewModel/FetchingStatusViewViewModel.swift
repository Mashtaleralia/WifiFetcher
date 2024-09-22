//
//  FetchingStatusViewViewModel.swift
//  WifiFetcher
//
//  Created by Admin on 18.09.2024.
//

import UIKit

enum FetchingState {
    case initial
    case fetching
    case completed
}

protocol FetchingStatusViewViewModelDelegate: AnyObject {
    func updateStatusView()
}

final class FetchingStatusViewViewModel {
    private var initialTitle = "Tap on the button to fetch todos"
    private var fetchingTitle = "It’ll take a couple of seconds"
    private var fetchCompletedTitle = "The fetch successfully completed"
    
    public var state: FetchingState = .initial {
        didSet {
            delegate?.updateStatusView()
        }
    }
    
    let changeStatusTitle = "Tap on the todo to change status"
    let changeStatusImage = UIImage(named: "tap")
    
    weak var delegate: FetchingStatusViewViewModelDelegate?
    
    var title: String {
        switch state {
        case .initial:
            return initialTitle
        case .fetching:
            return fetchingTitle
        case .completed:
            return fetchCompletedTitle
        }
    }
    
    var thumbImage: UIImage? {
        switch state {
        case .initial:
            return UIImage(named: "tap")
        case .fetching:
            return nil
        case .completed:
            return UIImage(named: "attention-circle")
        }
    }
    
}
