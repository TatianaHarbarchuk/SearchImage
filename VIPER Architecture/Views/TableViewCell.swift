//
//  TableViewCell.swift
//  VIPER Architecture
//
//  Created by Tania Harbarchuk on 27.11.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView?.image = nil
    }
    
    func setData(model: Hit) {
        imgView?.imageFromURL(model.webformatURL)
    }
    
}
