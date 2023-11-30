//
//  TaskListInteractor.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 27.11.2023.
//

import Foundation

class TableViewInteractor: PresenterToInteractorTableViewProtocol {
    
    //MARK: - Properties
    private var imageManager = ImageManager()
    var presenter: InteractorToPresenterTableViewProtocol?
    var images: [Hit]?
    
    //MARK: - Func fetchImageList
    func fetchImageList(with text: String) {
        imageManager.getImage(matching: text) { [weak self] image, _  in
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
