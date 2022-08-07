//
//  CustomTableViewCell.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 05.08.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "CustomTableViewCell"
    
    // MARK: - UIElements
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellLabelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupHierarchy() {
        addSubview(cellLabelStack)
        cellLabelStack.addArrangedSubview(characterNameLabel)
        cellLabelStack.addArrangedSubview(descriptionLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            cellLabelStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            cellLabelStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            cellLabelStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            cellLabelStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: - Configuration Methods
    func configureModel(with model: MarvelResults) {
        characterNameLabel.text = description.description
        
        if let description = model.description, description != "" {
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
        }
     }
}
