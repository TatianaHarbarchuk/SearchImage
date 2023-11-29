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
    private var images = [Hit]()
    
    init(interactor: PresenterToInteractorTableViewProtocol, router: PresenterToRouterTableViewProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Func viewDidLoad
    func viewDidLoad() {
        interactor.fetchImageList()
    }
    
    //MARK: - Func numberOfRowsInSection
    func numberOfRowsInSection() -> Int {
        images.count
    }
    
    //MARK: - Func setCell
    func setCell(tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as? TableViewCell {
            let images = images[indexPath.row]
            cell.setData(model: images)
            return cell
        }
        return UITableViewCell()
    }
    
    //MARK: - Func didSelectRowAt
    func didSelectRowAt(index: Int) {
        interactor.getImageDetailAt(index: index)
    }
    
    //MARK: - Func tableViewCellHeight
    func tableViewCellHeight() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}

extension TableViewPresenter: InteractorToPresenterTableViewProtocol {
    //MARK: - Func fetchImageListSuccess
    func fetchImageListSuccess(images: [Hit]) {
        self.images = images
        self.view?.reloadData()
    }
    
    //MARK: - Func getImageDetailSuccess
    func getImageDetailSuccess() {
        let images = interactor.images
        guard let firstImage = images?.first else { return }
        router.pushToDetail(with: firstImage)
    }
}
