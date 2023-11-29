//
//  DetailImagePresenter.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 29.11.2023.
//

import Foundation

class DetailImagePresenter: DetailImagePresenterProtocol {
    
    //MARK: - Properties
    weak var viewController: DetailImageViewControllerProtocol?
    var interactor: DetailImageInteractorProtocol
    var router: DetailImageRouterProtocol
    
    init(interactor: DetailImageInteractorProtocol, router: DetailImageRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Func viewDidLoad
    func viewDidLoad() {
        let image = interactor.showImage()
        viewController?.show(image: image)
    }
}
