//
//  TodosTableViewCell.swift
//  WifiFetcher
//
//  Created by Admin on 20.09.2024.
//

import UIKit

final class TodosTableViewCell: UITableViewCell {
    
    static let identifier = "TodosTableViewCell"
    var viewModel: TodosTableViewCellViewModel?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColor = .black
    }
    
    private let thumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let completedMark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private let uncompletedMark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "multiply")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        layer.cornerRadius = 8
        addSubview(thumbImageView)
        addSubview(titleLabel)
        addSubview(completedMark)
        addSubview(uncompletedMark)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            thumbImageView.heightAnchor.constraint(equalToConstant: 40),
            thumbImageView.widthAnchor.constraint(equalToConstant: 40),
            thumbImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            thumbImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: completedMark.leadingAnchor, constant: -5),
            completedMark.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            completedMark.heightAnchor.constraint(equalToConstant: 25),
            completedMark.widthAnchor.constraint(equalToConstant: 25),
            completedMark.centerYAnchor.constraint(equalTo: centerYAnchor),
            uncompletedMark.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            uncompletedMark.heightAnchor.constraint(equalToConstant: 25),
            uncompletedMark.widthAnchor.constraint(equalToConstant: 25),
            uncompletedMark.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    public func configure(with viewModel: TodosTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        thumbImageView.image = viewModel.thumbImage
        completedMark.isHidden = !viewModel.isCompleted
        uncompletedMark.isHidden = viewModel.isCompleted
        self.viewModel = viewModel
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        thumbImageView.image = nil
    }
    
}
