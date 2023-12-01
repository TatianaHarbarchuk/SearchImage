//
//  DetailImageViewController.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 29.11.2023.
//

import UIKit

class DetailImageViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Properties
    private var imageView = UIImageView()
    private var imageScrollView = UIScrollView()
    private var likeButton = UIButton(type: .custom)
    var presenter: DetailImagePresenterProtocol?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureScrollView()
        presenter?.viewDidLoad()
    }
    
    //MARK: - Func configureScrollView
    private func configureScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageScrollView.backgroundColor = .clear
        imageScrollView.delegate = self
        view.addSubview(imageScrollView)
        imageScrollView.addSubview(imageView)
        imageScrollView.maximumZoomScale = 3.0
        imageScrollView.minimumZoomScale = 1.0
        let constraints: [NSLayoutConstraint] = [
            imageScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: imageScrollView.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: imageScrollView.leadingAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: imageScrollView.bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 350),
            imageView.heightAnchor.constraint(equalToConstant: 500)
        ]
        NSLayoutConstraint.activate(constraints)
        imageView.contentMode = .scaleAspectFit
    }
    
    private func configureLikeButton() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        let likeBarButtonItem = UIBarButtonItem(customView: likeButton)
        navigationItem.rightBarButtonItems = [likeBarButtonItem]
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeButton.addTarget(self, action: #selector(favouriteButtonPressed), for: .touchUpInside)
    }
    
    @objc private func favouriteButtonPressed(_ sender: UIButton) {
        print("Button was tapped")
    }
}

extension DetailImageViewController: DetailImageViewControllerProtocol {
    func show(image: Hit) {
        DispatchQueue.main.async {
            self.imageView.imageFromURL(image.webformatURL)
        }
    }
}
