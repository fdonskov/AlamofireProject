//
//  ViewController.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 04.08.2022.
//

import UIKit

class MarvelViewController: UIViewController {
    
    let networkManager = NetworkManager()
    var characterResults: [MarvelResults] = []
    
    private var marvelCharacterView: CharactersDisplayView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersDisplayView
    }

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view = CharactersDisplayView()
        title = "Marvel Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        marvelCharacterView?.activityIndicator.startAnimating()
        
        marvelCharacterView?.tableView.dataSource = self
        marvelCharacterView?.tableView.delegate = self
        
        networkManager.delegate = self
        networkManager.networkRequest()
    }
}

// MARK: - UITableViewDataSource
extension MarvelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.configureModel(with: self.characterResults[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MarvelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let configurationController = MarvelConfigurationViewController()
        configurationController.data = characterResults[indexPath.row]
        present(configurationController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastVisiblePath = tableView.indexPathsForVisibleRows?.last {
            if indexPath == lastVisiblePath {
                self.marvelCharacterView?.activityIndicator.stopAnimating()
            }
        }
    }
}

// MARK: - NetworkManagerDelegate
extension MarvelViewController: NetworkManagerDelegate {
    func updateUI(for model: [MarvelResults]) {
        self.characterResults = model
        
        DispatchQueue.main.async {
            self.marvelCharacterView?.reloadTableView()
        }   
    }
}

