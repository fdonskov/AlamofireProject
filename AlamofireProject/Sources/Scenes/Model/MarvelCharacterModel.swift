//
//  MarvelCharacterModel.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 05.08.2022.
//

import Foundation

struct MarvelCharacterModel: Decodable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: DescriptionData
}

struct DescriptionData: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelResults]
}

struct MarvelResults: Decodable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let thumbnail: MarvelCharacter
    let resourceURI: String
    let comics: ComicsDescription
    let series: ComicsDescription
    let stories: ComicsDescription
    let events: ComicsDescription
    let urls: [URLItem]
}

struct MarvelCharacter: Decodable {
    let path: String
    let ext: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

struct ComicsDescription: Decodable {
    let available: Int
    let collectionURI: String
    let items: [Items]
    let returned: Int
}

struct Items: Decodable {
    let resourceURI: String
    let name: String
    let type: String?
    
    var expandOption: String {
        type ?? "nil"
    }
}

struct URLItem: Decodable {
    let type: String
    let url: String
}

struct PrintableCharacter {
    let name: String
}
