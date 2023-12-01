//
//  TaskListPresenter.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 27.11.2023.
//

import UIKit

class TableViewPresenter: ViewToPresenterTableViewProtocol {
    
    //MARK: - Properties
    weak var view: PresenterToViewTableViewProtocol?
    var interactor: PresenterToInteractorTableViewProtocol
    var router: PresenterToRouterTableViewProtocol
    
    init(interactor: PresenterToInteractorTableViewProtocol, router: PresenterToRouterTableViewProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Func viewDidLoad
    func viewDidLoad(with text: String) {
        interactor.fetchImageList(with: text)
    }
    
    //MARK: - Func numberOfRowsInSection
    func numberOfRowsInSection() -> Int {
        return interactor.imagesCount()
    }
    
    //MARK: - Func getImage
    func getImage(at index: Int) -> Hit? {
        return interactor.getImage(at: index)
    }
    
    //MARK: - Func showImageDetail
    func showImageDetail(at index: Int) {
        if let image = interactor.getImage(at: index) {
            router.pushToDetail(with: image)
        }
    }
    
    //MARK: - Func setCell
    func setCell(tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as? TableViewCell {
            if let image = interactor.getImage(at: indexPath.row) {
                cell.setData(model: image)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    //MARK: - Func tableViewCellHeight
    func tableViewCellHeight() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}

extension TableViewPresenter: InteractorToPresenterTableViewProtocol {
    
    //MARK: - Func fetchImageListSuccess
    func fetchImageListSuccess(images: [Hit]) {
        self.view?.reloadData()
    }
}
