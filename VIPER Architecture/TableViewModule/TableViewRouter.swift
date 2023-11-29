//
//  TaskListRouter.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 27.11.2023.
//

import UIKit

class TableViewRouter: PresenterToRouterTableViewProtocol {
    
    //MARK: - Properties
    weak var viewController: TableViewController?
    var navigationController: UINavigationController?
    
    //MARK: - Func pushToDetail
    func pushToDetail(with image: Hit) {
        let vc = DetailImageModuleBuilder.build(image: image)
        navigationController?.pushViewController(vc, animated: true)
    }
}
