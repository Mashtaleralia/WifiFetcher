//
//  ShowResultsPanelView.swift
//  WifiFetcher
//
//  Created by Admin on 18.09.2024.
//

import UIKit

class ShowResultsPanelViewViewModel {
    var isToggled: Bool = false
}

protocol ShowResultsPanelViewDelegate: AnyObject {
    func showResults()
}

class ShowResultsPanelView: UIView {
    
    let resultsButton = ShowResultsButton()
    
    var viewModel = ShowResultsPanelViewViewModel()
    
    weak var delegate: ShowResultsPanelViewDelegate?
    
    let toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.offImage = UIImage(systemName: "person.slash.fill")
        toggle.onImage = UIImage(systemName: "person.fill")
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.onTintColor = Colors.lightGreen
        return toggle
    }()

    init(viewModel: ShowResultsPanelViewViewModel, frame: CGRect) {
        self.viewModel = viewModel
        super.init(frame: frame)
        resultsButton.addTarget(self, action: #selector(didTapShowResults), for: .touchUpInside)
        setUp()
        toggleSwitch.addTarget(self, action: #selector(didToggle(_:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapShowResults() {
        delegate?.showResults()
    }
    
    @objc private func didToggle(_ sender: UISwitch) {
        viewModel.isToggled = sender.isOn
    }
    
    private func setUp() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(resultsButton)
        addSubview(toggleSwitch)
        backgroundColor = Colors.hintBackgroundColor
        layer.cornerRadius = 35
        
        NSLayoutConstraint.activate([
            resultsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            resultsButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            resultsButton.heightAnchor.constraint(equalToConstant: 45),
            resultsButton.widthAnchor.constraint(equalToConstant: 155),
            toggleSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
            toggleSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
        ])
    }
    
}
