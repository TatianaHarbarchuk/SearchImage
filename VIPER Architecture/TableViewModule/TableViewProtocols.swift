//
//  TableViewProtocols.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 27.11.2023.
//

import UIKit

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterTableViewProtocol: AnyObject {
    var view: PresenterToViewTableViewProtocol? { get set }
    var interactor: PresenterToInteractorTableViewProtocol { get set }
    var router: PresenterToRouterTableViewProtocol { get set }
    func viewDidLoad()
    
    func numberOfRowsInSection() -> Int
    func setCell(tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell
    func didSelectRowAt(index: Int)
    func tableViewCellHeight() -> CGFloat
}

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewTableViewProtocol: AnyObject {
    func reloadData()
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorTableViewProtocol: AnyObject {
    var presenter: InteractorToPresenterTableViewProtocol? { get set }
    var images: [Hit]? { get set}
    func fetchImageList()
    func getImageDetailAt(index: Int)
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterTableViewProtocol: AnyObject {
    func fetchImageListSuccess(images: [Hit])
    func getImageDetailSuccess()
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterTableViewProtocol {
    func pushToDetail(with image: Hit)
}
