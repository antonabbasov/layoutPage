//
//  UIMainPage.swift
//  LayoutPage
//
//  Created by Anton on 01.02.2021.
//

import UIKit

public class MainPageController: UIViewController {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var numberOfFriendsLabel: UILabel!
    @IBOutlet weak var friendCollectionView: UICollectionView!
    
    var friends: [FriendUserModel] = []
    var photos: [UIImage] = []
    let friendCellWidth = 75
    let friendCellHeight = 128
    enum MainPageControllerException: Error {
        case layerSettings
    }
    
    func fillFriendsArray() {
        friends.append(FriendUserModel(image: #imageLiteral(resourceName: "tX8911m9jeM.jpg"), name: "Arina Milkova"))
        friends.append(FriendUserModel(image: #imageLiteral(resourceName: "9jTcdcyW2a4.jpg"), name: "Michail Petrov"))
        friends.append(FriendUserModel(image: #imageLiteral(resourceName: "E3hM4pxPPF4.jpg"), name: "Timur Zadvornov"))
        friends.append(FriendUserModel(image: #imageLiteral(resourceName: "hpXWIXc_CqY.jpg"), name: "Vladik Suhoruchenko"))
        friends.append(FriendUserModel(image: #imageLiteral(resourceName: "icRoEonhfE8.jpg"), name: "Kirill Yanuskin"))
        friends.append(FriendUserModel(image: #imageLiteral(resourceName: "yvUe3VuA5i4.jpg"), name: "Nikita Belyaev"))
    }
    
    func fillPhotosArray() {
        photos.append(#imageLiteral(resourceName: "4.jpg"))
        photos.append(#imageLiteral(resourceName: "3.jpg"))
        photos.append(#imageLiteral(resourceName: "1.jpg"))
        photos.append(#imageLiteral(resourceName: "2.jpg"))
        photos.append(#imageLiteral(resourceName: "7.jpg"))
        photos.append(#imageLiteral(resourceName: "5.jpg"))
        photos.append(#imageLiteral(resourceName: "6.jpg"))
    }
    
    func userAvatarImageRender() {
        userAvatarImageView.image = UIImage(named: "8PYXxP_F1Ao")
        userAvatarImageView.layer.borderWidth = 1
        userAvatarImageView.layer.masksToBounds = false
        userAvatarImageView.layer.borderColor = UIColor.black.cgColor
        userAvatarImageView.layer.cornerRadius = userAvatarImageView.frame.height/2
        userAvatarImageView.clipsToBounds = true
    }
    
    func editButtonRender() {
        editButton.layer.cornerRadius = 15
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func layoutSettings(customLayout: UICollectionViewLayout, collectionView: UICollectionView) throws -> CGSize {
        let noOfCellsInRow = 3
        guard let flowLayout = customLayout as? UICollectionViewFlowLayout else {
            throw MainPageControllerException.layerSettings
        }
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: size)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsArray()
        fillPhotosArray()
        userAvatarImageRender()
        editButtonRender()
        numberOfFriendsLabel.text = String(friends.count)
      
        friendCollectionView.registerCustomCell(FriendCollectionViewCell.self)
        photoCollectionView.registerCustomCell(PhotoCollectionViewCell.self)
    }
}

extension MainPageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.friendCollectionView {
            return friends.count
        } else {
            return photos.count
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.friendCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendCollectionViewCell.cellIdentifier(), for: indexPath) as! FriendCollectionViewCell
            
            let friend = friends[indexPath.row]
            cell.configure(name: friend.name, image: friend.image)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.cellIdentifier(), for: indexPath) as! PhotoCollectionViewCell
            
            cell.configure(image: photos[indexPath.row])
            
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.photoCollectionView {
            do {
                return try layoutSettings(customLayout: collectionViewLayout, collectionView: photoCollectionView)
            } catch {
                return CGSize()
            }
        } else {
            return CGSize(width: friendCellWidth, height: friendCellHeight)
        }
    }
}
