//
//  UIColor.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 10/11/2566 BE.
//

import UIKit

extension UIColor {
    var randomColor: UIColor {
        UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
    }
}
