//
//  FriendCollectionViewCell.swift
//  LayoutPage
//
//  Created by Anton on 02.02.2021.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell, CustomCell {
    
    @IBOutlet weak var friendAvatarImage: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(name: String, image: UIImage) {
        generateFriendAvatarImage(image: image)
        self.friendNameLabel.text = name
    }
    
    func generateFriendAvatarImage(image: UIImage) {
        self.friendAvatarImage.image = image
        self.friendAvatarImage.layer.borderWidth = 1
        self.friendAvatarImage.layer.masksToBounds = false
        self.friendAvatarImage.layer.borderColor = UIColor.black.cgColor
        self.friendAvatarImage.layer.cornerRadius = friendAvatarImage.frame.height/2
        self.friendAvatarImage.clipsToBounds = true
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
