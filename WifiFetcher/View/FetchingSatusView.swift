//
//  FetchingSatusView.swift
//  WifiFetcher
//
//  Created by Admin on 18.09.2024.
//

import UIKit

class FetchingSatusView: UIView {
    
    private let thumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var viewModel: FetchingStatusViewViewModel
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.isHidden = true
        return indicator
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 181/255, green: 184/255, blue: 181/255, alpha: 1)
        return label
    }()

    init(viewModel: FetchingStatusViewViewModel, frame: CGRect) {
        self.viewModel = viewModel
        super.init(frame: frame)
        updateStatusView()
        setUp()
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(thumbImageView)
        addSubview(activityIndicator)
        addSubview(titleLabel)
        backgroundColor = Colors.hintBackgroundColor
        layer.cornerRadius = 18
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            activityIndicator.widthAnchor.constraint(equalToConstant: 28),
            activityIndicator.heightAnchor.constraint(equalToConstant: 28),
            
            thumbImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            thumbImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            thumbImageView.widthAnchor.constraint(equalToConstant: 28),
            thumbImageView.heightAnchor.constraint(equalToConstant: 28),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 6)
        ])
    }
    
    public func setUpTodoHint() {
        titleLabel.text = viewModel.changeStatusTitle
        thumbImageView.image = viewModel.changeStatusImage
    }
   
    
}

extension FetchingSatusView: FetchingStatusViewViewModelDelegate {
    
    func updateStatusView() {
        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = self?.viewModel.title
            self?.thumbImageView.image = self?.viewModel.thumbImage
            self?.thumbImageView.isHidden = self?.viewModel.state != .fetching ? false : true
            if self?.viewModel.state == .fetching {
                self?.activityIndicator.isHidden = false
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
            }
        }
      
    }
    
    
}
