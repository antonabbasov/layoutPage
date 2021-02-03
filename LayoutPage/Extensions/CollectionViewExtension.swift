//
//  CollectionViewExtension.swift
//  LayoutPage
//
//  Created by Anton on 03.02.2021.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCustomCell(_ cell: CustomCell.Type) {
        self.register(cell.cellNib(), forCellWithReuseIdentifier: cell.cellIdentifier())
    }
}
