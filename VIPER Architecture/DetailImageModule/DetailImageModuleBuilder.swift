//
//  DetailImageModuleBuilder.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 29.11.2023.
//

import Foundation

class DetailImageModuleBuilder {
    static func build(image: Hit) -> DetailImageViewController {
        let interactor = DetailImageInteractor(image: image)
        let router = DetailImageRouter()
        let presenter = DetailImagePresenter(interactor: interactor, router: router)
        let viewController = DetailImageViewController()
        
        presenter.viewController = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
