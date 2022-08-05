//
//  NetworkManager.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 05.08.2022.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate {
    func updateUI(for model: [MarvelResults])
}

class NetworkManager {
    var delefate: NetworkManagerDelegate?
    
    func networkRequest() {
        AF.request("https://gateway.marvel.com:443/v1/public/characters?orderBy=name&limit=1&apikey=180f88a51ebc9bbabf73c54e5deb800a")
            .validate()
            .responseDecodable(of: MarvelCharacterModel.self) { (data) in
                guard let responce = data.value else { return }
                let characters = responce.data.results
                
                DispatchQueue.main.async {
                    self.delefate?.updateUI(for: characters)
                }
            }
    }
}
