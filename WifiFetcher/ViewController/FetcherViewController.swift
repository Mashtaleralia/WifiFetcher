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
    
    let viewModel = FetcherViewControllerViewModel()
    
    private let vanillaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("COCK", for: .normal)
        button.backgroundColor = .red
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(showResultsPanel)
        view.addSubview(vanillaButton)
        view.addSubview(fetchingStatusView)
        addConstraints()
        vanillaButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
       
    }
    
    @objc func didTapButton() {
        viewModel.fetchData {
            DispatchQueue.main.async {
                self.showResultsPanel.resultsButton.isEnabled = true
            }
        }
//        
//        APICaller.shared.fetchToDos { result in
//            switch result {
//            case .success(let result):
//                print(result)
//              
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            showResultsPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            showResultsPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            showResultsPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showResultsPanel.heightAnchor.constraint(equalToConstant: 68),
            vanillaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vanillaButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vanillaButton.heightAnchor.constraint(equalToConstant: 80),
            vanillaButton.widthAnchor.constraint(equalToConstant: 80),
            
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
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

