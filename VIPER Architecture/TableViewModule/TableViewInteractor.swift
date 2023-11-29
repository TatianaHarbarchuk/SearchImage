//
//  TaskListInteractor.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 27.11.2023.
//

import Foundation

class TableViewInteractor: PresenterToInteractorTableViewProtocol {
    
    //MARK: - Properties
    private var imageService = ImageService()
    var presenter: InteractorToPresenterTableViewProtocol?
    var images: [Hit]?
    
    //MARK: - Func fetchImageList
    func fetchImageList() {
        imageService.fetchingAPIImages(matching: "Girl") { [weak self] image, _ in
            guard let self else { return }
            self.images = image
            if let imageList = self.images {
                self.presenter?.fetchImageListSuccess(images: imageList)
            }
        }
    }
    
    //MARK: - Func getImageDetailAt
    func getImageDetailAt(index: Int) {
        presenter?.getImageDetailSuccess()
    }
}
