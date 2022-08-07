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
    var delegate: NetworkManagerDelegate?
    
    func networkRequest() {
        AF.request("https://gateway.marvel.com/v1/public/characters?ts=1&apikey=4c7c0f61e37a25cc26778a4e11fdd4e5&hash=a6dab223fd7a5fc6570be234e8172df5")
            .validate()
            .responseDecodable(of: MarvelCharacterModel.self) { (data) in
                guard let responce = data.value else { return }
                let characters = responce.data.results
                
                DispatchQueue.main.async {
                    self.delegate?.updateUI(for: characters)
                }
            }
    }
}

// https://gateway.marvel.com/v1/public/characters?ts=1&apikey=4c7c0f61e37a25cc26778a4e11fdd4e5&hash=a6dab223fd7a5fc6570be234e8172df5
