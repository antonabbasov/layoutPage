//
//  PhotoCollectionViewCell.swift
//  LayoutPage
//
//  Created by Anton on 02.02.2021.
//

import UIKit

public class PhotoCollectionViewCell: UICollectionViewCell, CustomCellProtocol {

    @IBOutlet weak var photoImageView: UIImageView!
    
    func configure(image: UIImage) {
        photoImageView.image = image
    }
    
    public static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    public static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
