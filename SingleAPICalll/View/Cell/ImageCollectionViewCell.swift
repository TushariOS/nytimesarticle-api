//
//  ImageCollectionViewCell.swift
//  SingleAPICalll
//
//  Created by Tushar on 30/04/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!

    func setUpCell(urlString: String?) {
        if let imageString = urlString, let imageUrl = URL(string: imageString) {
            imageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
}
