//
//  ViewController.swift
//  WifiFetcher
//
//  Created by Admin on 18.09.2024.
//

import UIKit

final class FetcherViewController: UIViewController, FetcherViewControllerViewModelProtocol {
    
    
    private lazy var showResultsPanel = ShowResultsPanelView(viewModel: viewModel.resultsPanelViewModel, frame: .zero)
    
    private lazy var fetchingStatusView = FetchingSatusView(viewModel: viewModel.fetchingStatusViewModel, frame: .zero)
    
    let viewModel = FetcherViewControllerViewModel()
    
    let button = FetchWifiButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.action = { [weak self] in
            self?.didTapButton()
        }
        view.addSubview(showResultsPanel)
        view.addSubview(fetchingStatusView)
        view.addSubview(button)
        addConstraints()
        
        viewModel.delegate = self
        showResultsPanel.delegate = self

    }
    
    func didTapButton() {
        viewModel.fetchData()
    }
    
    func dataDidFetch() {
        DispatchQueue.main.async {
            self.button.loaded = true
            self.showResultsPanel.resultsButton.isEnabled = true
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            showResultsPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            showResultsPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            showResultsPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showResultsPanel.heightAnchor.constraint(equalToConstant: 68),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 320),
            button.widthAnchor.constraint(equalToConstant: 320),
            
            
            fetchingStatusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            fetchingStatusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            fetchingStatusView.heightAnchor.constraint(equalToConstant: 68),
            fetchingStatusView.bottomAnchor.constraint(equalTo: showResultsPanel.topAnchor, constant: -25)
        ])
    }
}

extension FetcherViewController: ShowResultsPanelViewDelegate {
    func showResults() {
        print(viewModel.todos)
        let toDoVM = TodosViewControllerViewModel(todos: viewModel.todos)
        
        let vc = TodosViewController(viewModel: toDoVM)
        vc.delegate = button as? any FetchWifiButtonDelegate & FetchingSatusViewDelegate & ShowResultsPanelViewRevertDelegate
        vc.fetchingSatusViewDelegate = fetchingStatusView
        vc.showResultsDelegate = showResultsPanel
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

