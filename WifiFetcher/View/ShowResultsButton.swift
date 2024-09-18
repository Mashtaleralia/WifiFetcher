//
//  ShowResultsButton.swift
//  WifiFetcher
//
//  Created by Admin on 18.09.2024.
//

import UIKit

class ShowResultsButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            setUpButton()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        isEnabled = false
        setUpButton()
        //translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpButton() {
        layer.cornerRadius = 23
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("Show Results", for: .normal)
        backgroundColor = isEnabled ? Colors.lightGreen : Colors.dimmedGreen
        setTitleColor(Colors.greenTextColor, for: .normal)
    }
    
}
