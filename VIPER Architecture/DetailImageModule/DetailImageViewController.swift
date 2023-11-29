//
//  DetailImageViewController.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 29.11.2023.
//

import UIKit

class DetailImageViewController: UIViewController {
    
    //MARK: - Properties
    private var imageView: UIImageView?
    var presenter: DetailImagePresenterProtocol?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        presenter?.viewDidLoad()
        if let imageView {
            view.addSubview(imageView)
        }
    }
    
    //MARK: - Func setupUI
    private func setupUI() {
        imageView = UIImageView(frame: CGRect(x: 20, y: 200, width: 350, height: 330))
    }
}

extension DetailImageViewController: DetailImageViewControllerProtocol {
    func show(image: Hit) {
        imageView?.imageFromURL(image.webformatURL)
    }
}
