//
//  UICollectionViewCell.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 10/11/2566 BE.
//

import UIKit

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
