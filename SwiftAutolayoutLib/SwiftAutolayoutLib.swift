//
//  SwiftAutolayoutLib.swift
//  SwiftAutolayoutLib
//
//  Created by SEAN on 2019/3/17.
//  Copyright © 2019 seanlin. All rights reserved.
//

import Foundation

public extension UIView {
    
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView, deltaWidth: CGFloat = 0, deltaHeight: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false

        widthAnchor.constraint(equalTo: view.widthAnchor, constant: deltaWidth).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, constant: deltaHeight).isActive = true
    }
    
    func anchorCenter(to view: UIView, offsetX: CGFloat = 0, offSetY: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false

        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offsetX).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offSetY).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
