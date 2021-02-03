//
//  CustomCell.swift
//  LayoutPage
//
//  Created by Anton on 03.02.2021.
//

import Foundation
import UIKit

public protocol CustomCellProtocol {
    
    static func cellNib() -> UINib?
    static func cellIdentifier() -> String
}
