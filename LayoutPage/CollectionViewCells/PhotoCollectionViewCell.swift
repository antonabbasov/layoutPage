//
//  PhotoCollectionViewCell.swift
//  LayoutPage
//
//  Created by Anton on 02.02.2021.
//

import UIKit

protocol CustomCell {
    
    static func cellNib() -> UINib?
    
    static func cellIdentifier() -> String
}

class PhotoCollectionViewCell: UICollectionViewCell, CustomCell {

    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(image: UIImage) {
        self.photoImageView.image = image
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
