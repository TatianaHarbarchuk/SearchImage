//
//  Model.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 27.11.2023.
//

import Foundation

//MARK: - Image
struct Image: Codable {
    let hits: [Hit]
    
    init(hits: [Hit]) {
        self.hits = hits
    }
}

// MARK: - Hit
struct Hit: Codable {
    var id: Int
    var webformatURL: String
    var imageWidth, imageHeight: Int
    
    enum CodingKeys: String, CodingKey {
        case id, webformatURL, imageWidth, imageHeight
    }
}
