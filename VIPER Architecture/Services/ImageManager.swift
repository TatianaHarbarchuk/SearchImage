//
//  ImageManager.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 30.11.2023.
//

import Foundation
import Alamofire

struct ImageManager {
    private struct Constant {
        static let scheme = "https"
        static let host = "pixabay.com"
        static let path = "/api"
        static let apiKey = "32828521-f057d7007ce70179fd3955d93"
    }
    
    func getImage(matching query: String, completion: @escaping ([Hit], Error?) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constant.scheme
        urlComponents.host = Constant.host
        urlComponents.path = Constant.path
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: Constant.apiKey),
            URLQueryItem(name: "q", value: query)
        ]
        
        guard let url = urlComponents.url else { return }
        AF.request(url).responseDecodable(of: Image.self) { response in
            switch response.result {
            case .success(let imageData):
                completion(imageData.hits, nil)
            case .failure(let imageFetchError):
                completion([], imageFetchError)
            }
        }
    }
}
