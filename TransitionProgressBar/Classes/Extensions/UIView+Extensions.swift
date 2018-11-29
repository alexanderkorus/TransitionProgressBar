//
//  UIView+Extensions.swift
//  Pods-TransitionProgressBar_Example
//
//  Created by Alexander Korus on 25.11.18.
//

import Foundation
import UIKit

extension UIView {
    
    func subview(forAutoLayout subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func subviews(forAutoLayout subviews: UIView...) {
        self.subviews(forAutoLayout: subviews)
    }
    
    func subviews(forAutoLayout subviews: [UIView]) {
        subviews.forEach { (subview: UIView) -> Void in
            self.subview(forAutoLayout: subview)
        }
    }
    
    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: self.frame.size.width * radius, height: self.frame.size.height * radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.clipsToBounds = true
        self.layer.mask = mask
    }
}
