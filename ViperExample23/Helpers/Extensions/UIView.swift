//
//  UIView.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 10/11/2566 BE.
//

import UIKit

extension UIView {
    var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.leftAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.rightAnchor
    }
    
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.leadingAnchor
    }
    
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.trailingAnchor
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.topAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.bottomAnchor
    }
    
    func roundCorners(
        corners: UIRectCorner,
        radius: CGFloat
    ) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        
    }
}

public
extension UIView {
    class func fromNib(named: String? = nil) -> Self {
        let name = named ?? "\(Self.self)"
        guard
            let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        else { fatalError("missing expected nib named: \(name)") }
        guard
            // we're using `first` here because compact map chokes compiler on
            // optimized release, so you can't use two views in one nib if you wanted to
            // and are now looking at this
            let view = nib.first as? Self
        else { fatalError("view of type \(Self.self) not found in \(nib)") }
        return view
    }
}

public
extension UIView {
    func reversedScaleAnimate() {
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.fromValue = CGAffineTransform.identity
        scale.toValue = CGAffineTransform(scaleX: 0.5, y: 0.5)
        scale.timingFunction = .init(name: .linear)
        scale.duration = 0.16
        scale.autoreverses = true
        layer.add(scale, forKey: nil)
    }
}

public
extension UIView {
    func dropShadow(
        color: UIColor?,
        opacity: Float = 0.5,
        offset: CGSize,
        radius: CGFloat = 1,
        scale: Bool = true
    ) {
        layer.masksToBounds = false
        layer.shadowColor = (color ?? .lightGray).cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
}
