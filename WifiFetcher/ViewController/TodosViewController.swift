//
//  TodosViewController.swift
//  WifiFetcher
//
//  Created by Admin on 20.09.2024.
//

import UIKit

class TodosViewController: UIViewController {
    
    private lazy var statusView: FetchingSatusView = {
        let viewModel = FetchingStatusViewViewModel()
        let view = FetchingSatusView(viewModel: viewModel, frame: .zero)
        view.setUpTodoHint()
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    var viewModel: TodosViewControllerViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Todos"
        tableView.register(TodosTableViewCell.self, forCellReuseIdentifier: TodosTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .black
        view.addSubview(tableView)
        view.addSubview(statusView)
        addConstraints()
    }
    
    init(viewModel: TodosViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            statusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            statusView.heightAnchor.constraint(equalToConstant: 68),
            statusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            tableView.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension TodosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodosTableViewCell.identifier, for: indexPath) as? TodosTableViewCell else {
            fatalError()
        }
        switch viewModel.sections[indexPath.section] {
        case .completed:
            cell.configure(with: viewModel.completedToDoViewModels[indexPath.row])
        case .notCompleted:
            cell.configure(with: viewModel.notCompletedToDoViewModels[indexPath.row])
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.sections[section] {
        case .completed:
            print(viewModel.completedToDoViewModels.count)
            return viewModel.completedToDoViewModels.count
        case .notCompleted:
            return viewModel.notCompletedToDoViewModels.count
        }
    }
}
