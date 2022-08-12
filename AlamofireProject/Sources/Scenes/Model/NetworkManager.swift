//
//  NetworkManager.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 05.08.2022.
//

import Foundation
import Alamofire
import UIKit

protocol NetworkManagerDelegate {
    func updateUI(for model: [MarvelResults])
}

class NetworkManager {
    
    var delegate: NetworkManagerDelegate?
    
    func networkRequest() {
        let url = "https://gateway.marvel.com/v1/public/characters"
        let parameters: [String: String] = ["ts": "1", "apikey": "4c7c0f61e37a25cc26778a4e11fdd4e5", "hash": "a6dab223fd7a5fc6570be234e8172df5"]
        
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: MarvelCharacterModel.self) { (data) in
                guard let response = data.value else { return }
                let characters = response.data.results
                
                if response.code != 200 {
                    DispatchQueue.main.async {
                        print("nil")
                    }
                } else {
                    self.delegate?.updateUI(for: characters)
                }
            }
    }
}

