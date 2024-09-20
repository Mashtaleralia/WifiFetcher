//
//  ViewController.swift
//  WifiFetcher
//
//  Created by Admin on 18.09.2024.
//

import UIKit

class FetcherViewController: UIViewController {
    
    private lazy var showResultsPanel = ShowResultsPanelView(viewModel: viewModel.resultsPanelViewModel, frame: .zero)
    
    private lazy var fetchingStatusView = FetchingSatusView(viewModel: viewModel.fetchingStatusViewModel, frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(showResultsPanel)
        view.addSubview(vanillaButton)
        view.addSubview(fetchingStatusView)
        addConstraints()
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            showResultsPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            showResultsPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            showResultsPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showResultsPanel.heightAnchor.constraint(equalToConstant: 68)
            
            fetchingStatusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            fetchingStatusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            fetchingStatusView.heightAnchor.constraint(equalToConstant: 68),
            fetchingStatusView.bottomAnchor.constraint(equalTo: showResultsPanel.topAnchor, constant: -25)
        ])
        
        
    }


}

