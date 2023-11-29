//
//  DetailImageProtocol.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 29.11.2023.
//

import Foundation

//MARK: - DetailImageViewControllerProtocol
protocol DetailImageViewControllerProtocol: AnyObject {
    func show(image: Hit)
}

//MARK: - DetailImagePresenterProtocol
protocol DetailImagePresenterProtocol: AnyObject {
    func viewDidLoad()
}

//MARK: - DetailImageInteractorProtocol
protocol DetailImageInteractorProtocol: AnyObject {
    func showImage() -> Hit
}

//MARK: - DetailImageRouterProtocol
protocol DetailImageRouterProtocol: AnyObject {
    
}
