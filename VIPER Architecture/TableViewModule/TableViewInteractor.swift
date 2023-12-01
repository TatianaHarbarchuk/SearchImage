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
    
    //MARK: - Func imagesCount
    func imagesCount() -> Int {
        return images?.count ?? 0
    }
    
    //MARK: - Func getImage
    func getImage(at index: Int) -> Hit? {
        return images?[index]
    }
}
