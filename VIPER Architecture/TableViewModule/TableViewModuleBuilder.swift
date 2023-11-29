//
//  TableViewModuleBuilder.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 28.11.2023.
//

import UIKit

class TableViewModuleBuilder {
    static func build() -> UINavigationController {
        let interactor = TableViewInteractor()
        let router = TableViewRouter()
        let presenter = TableViewPresenter(interactor: interactor, router: router)
        let viewController = TableViewController()
        let navC = UINavigationController(rootViewController: viewController)
        
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        presenter.interactor = interactor
        router.viewController = viewController
        router.navigationController = navC
        return navC
    }
}
