//
//  ShowResultsPanelView.swift
//  WifiFetcher
//
//  Created by Admin on 18.09.2024.
//

import UIKit

class ShowResultsPanelView: UIView {
    
    let resultsButton = ShowResultsButton()
    
    let toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.offImage = UIImage(systemName: "person.slash.fill")
        toggle.onImage = UIImage(systemName: "person.fill")
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.onTintColor = Colors.lightGreen
        return toggle
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
