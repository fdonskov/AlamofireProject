//
//  CharactersDisplayConfiguratedView.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 07.08.2022.
//

import UIKit
import Alamofire

class CharactersDisplayConfiguratedView: UIView {
    
    // MARK: - UIElements
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var imageActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    private lazy var characterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupHierarchy() {
        addSubview(characterStackView)
        characterStackView.addArrangedSubview(characterImageView)
        characterImageView.addSubview(imageActivityIndicator)
        addSubview(tableView)
        
        setupLayout()
        setupView()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            characterStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            characterStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            characterStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            characterStackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.6),
            
            tableView.topAnchor.constraint(equalTo: characterStackView.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: characterStackView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: characterStackView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            imageActivityIndicator.centerXAnchor.constraint(equalTo: characterImageView.centerXAnchor),
            imageActivityIndicator.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor)
        ])
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
//        tableView.tableHeaderView = characterNameLabel
    }
}
