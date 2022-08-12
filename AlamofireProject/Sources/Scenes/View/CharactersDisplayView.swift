//
//  CharactersDisplayView.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 07.08.2022.
//

import UIKit

class CharactersDisplayView: UIView {
    
    // MARK: - UIElements
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CustomTableViewCell.identifier
        )
        return tableView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupHierarchy() {
        addSubview(tableView)
        addSubview(activityIndicator)
        
        setupLayout()
        setupView()
        reloadTableView()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
