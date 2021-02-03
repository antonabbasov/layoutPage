//
//  FriendCollectionViewCell.swift
//  LayoutPage
//
//  Created by Anton on 02.02.2021.
//

import UIKit

public class FriendCollectionViewCell: UICollectionViewCell, CustomCellProtocol {
    
    @IBOutlet weak var friendAvatarImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    
    func configure(name: String, image: UIImage) {
        renderFriendAvatarImage(image: image)
        friendNameLabel.text = name
    }
    
    func renderFriendAvatarImage(image: UIImage) {
        friendAvatarImageView.image = image
        friendAvatarImageView.layer.borderWidth = 1
        friendAvatarImageView.layer.masksToBounds = false
        friendAvatarImageView.layer.borderColor = UIColor.black.cgColor
        friendAvatarImageView.layer.cornerRadius = friendAvatarImageView.frame.height / 2
        friendAvatarImageView.clipsToBounds = true
    }
    
    public static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    public static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
