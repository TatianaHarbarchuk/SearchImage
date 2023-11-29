//
//  NetworkManager.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 27.11.2023.
//

import Foundation

struct ImageService {
    private struct Constant {
        static let scheme = "https"
        static let host = "pixabay.com"
        static let path = "/api"
        static let apiKey = "32828521-f057d7007ce70179fd3955d93"
    }
    
    func fetchingAPIImages(matching query: String, completion: @escaping ([Hit], Error?) -> ())  {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constant.scheme
        urlComponents.host = Constant.host
        urlComponents.path = Constant.path
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: Constant.apiKey),
            URLQueryItem(name: "q", value: query)
        ]
        
        guard let url = urlComponents.url else { return }
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            if error == nil {
                do {
                    guard let data = data else {
                        return
                    }
                    let imageModel = try JSONDecoder().decode(Image.self, from: data)
                    completion(imageModel.hits, nil)
                } catch {
                    print(error)
                    completion([],error)
                }
            }
        }
        dataTask.resume()
    }
}
