//
//  ViewController.swift
//  WifiFetcher
//
//  Created by Admin on 18.09.2024.
//

import UIKit

class FetcherViewController: UIViewController {
    
    private let showResultsPanel = ShowResultsPanelView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(showResultsPanel)
        addConstraints()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.showResultsPanel.resultsButton.isEnabled = true
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            showResultsPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            showResultsPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            showResultsPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            showResultsPanel.heightAnchor.constraint(equalToConstant: 68)
            
        ])
        
        
    }


}

