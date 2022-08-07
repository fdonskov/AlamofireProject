//
//  MarvelConfigurationViewController.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 07.08.2022.
//

import UIKit

class MarvelConfigurationViewController: UIViewController {
    
    var data: MarvelResults?
    var networkManager = NetworkManager()
    
    // MARK: - MarvelConfigurationView
    private var marvelConfigurationView: CharactersDisplayConfiguratedView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersDisplayConfiguratedView
    }
    
    // MARK: - ViewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        guard let data = data else { return }
        self.marvelConfigurationView?.configureView(with: data)
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view = CharactersDisplayConfiguratedView()
        marvelConfigurationView?.tableView.dataSource = self
    }
}

// MARK: - NetworkManagerDelegate
extension MarvelConfigurationViewController: NetworkManagerDelegate {
    func updateUI(for model: [MarvelResults]) {
        marvelConfigurationView?.configureView(with: model[0])
    }
}

// MARK: - UITableViewDataSource
extension MarvelConfigurationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.comics.items.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data?.comics.items[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Comics"
    }
}
