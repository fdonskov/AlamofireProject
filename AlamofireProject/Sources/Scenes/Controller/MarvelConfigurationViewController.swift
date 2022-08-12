//
//  MarvelConfigurationViewController.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 07.08.2022.
//

import UIKit
import Alamofire

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
        
        configureView(with: data)
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view = CharactersDisplayConfiguratedView()
        
        marvelConfigurationView?.tableView.dataSource = self
    }
    
    // MARK: - Configuration Methods
    
    func configureView(with model: MarvelResults) {
        marvelConfigurationView?.imageActivityIndicator.startAnimating()

        let imageResult = "https://img2.goodfon.ru/original/800x600/d/3f/maserati-granturismo-black-7217.jpg"

        DispatchQueue.global(qos: .userInteractive).async {

            guard let imageUrl = URL(string: model.thumbnail.path + "." + model.thumbnail.ext) else { return }

            DispatchQueue.main.async {

                AF.download(imageResult).responseData { (response) in
                    if let data = response.value {
                        let imageData = UIImage(data: data)

                        self.marvelConfigurationView?.characterImageView.image = imageData
                        self.marvelConfigurationView?.imageActivityIndicator.stopAnimating()
                        self.marvelConfigurationView?.imageActivityIndicator.isHidden = true
                    }
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension MarvelConfigurationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.comics.items.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let comics = data?.comics.items {
            cell.textLabel?.text = comics[indexPath.row].name
        } else {
            cell.textLabel?.text = "No Data Found"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Comics"
    }
}
