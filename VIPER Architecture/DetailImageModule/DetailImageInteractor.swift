//
//  DetailImageInteractor.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 29.11.2023.
//

import Foundation

class DetailImageInteractor: DetailImageInteractorProtocol {
    
    //MARK: - Properties
    weak var presenter: DetailImagePresenterProtocol?
    private let image: Hit
    
    init(image: Hit) {
        self.image = image
    }
    
    func showImage() -> Hit {
        return image
    }
}
