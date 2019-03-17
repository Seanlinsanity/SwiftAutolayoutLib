//
//  SwiftAutolayoutLibTests.swift
//  SwiftAutolayoutLibTests
//
//  Created by SEAN on 2019/3/17.
//  Copyright © 2019 seanlin. All rights reserved.
//

import XCTest
@testable import SwiftAutolayoutLib

class SwiftAutolayoutLibTests: XCTestCase {

    var myView: UIView?
    var superView: UIView?
    
    override func setUp() {
        myView = UIView()
        superView = UIView()
    }
    
    func testFillSuperview() {
        guard let view = myView else {
            XCTAssertThrowsError("Failed to initialize view...")
            return
        }
        
        superView?.addSubview(view)
        myView?.fillSuperview()
        myView?.superview?.constraints.forEach({ (constraint) in
            if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.top){
                print("check top constraint")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, 0)
            } else if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.bottom){
                print("check bottom constraint")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, 0)
            } else if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.leading){
                print("check leading constraint")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, 0)
            } else if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.trailing){
                print("check trailing constraint")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, 0)
            }
        })

    }
    
    func testAnchorCenter() {
        guard let superView = superView, let view = myView else {
            XCTAssertThrowsError("Failed to initialize view...")
            return
        }
        
        let offsetX: CGFloat = 10
        let offsetY: CGFloat = 20
        superView.addSubview(view)
        myView?.anchorCenter(to: superView, offsetX: offsetX, offSetY: offsetY)
        myView?.superview?.constraints.forEach({ (constraint) in
            if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.centerX) {
                print("check center X constraint")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, offsetX)
            } else if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.centerY) {
                print("check center Y constraint")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, offsetY)
            }
        })
    }
    
    func testAnchorSize() {
        guard let superView = superView, let view = myView else {
            XCTAssertThrowsError("Failed to initialize view...")
            return
        }
        superView.addSubview(view)
        let deltaWidth: CGFloat = 100
        let delatHeight: CGFloat = 50
        myView?.anchorSize(to: superView, deltaWidth: deltaWidth, deltaHeight: delatHeight)
        myView?.superview?.constraints.forEach({ (constraint) in
            if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.width) {
                print("check width constraint")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, deltaWidth)
            } else if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.height) {
                print("check height constraint")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, delatHeight)
            }
        })
    }
    
    func testAnchorWithPaddingAndSize() {
        guard let superView = superView, let view = myView else {
            XCTAssertThrowsError("Failed to initialize view...")
            return
        }
        superView.addSubview(view)
        let width: CGFloat = 300
        let height: CGFloat = 400
        let top: CGFloat = 10
        let left: CGFloat = 20
        let bottom: CGFloat = 30
        let right: CGFloat = 40
        
        myView?.anchor(top: superView.topAnchor, leading: superView.leadingAnchor, bottom: superView.bottomAnchor, trailing: superView.trailingAnchor, padding: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right), size: CGSize(width: width, height: height))
        myView?.superview?.constraints.forEach({ (constraint) in
            if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.top){
                print("check top padding")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, top)
            } else if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.leading){
                print("check left padding")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, left)
            } else if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.bottom){
                print("check bottom padding")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, -bottom)
            } else if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.trailing){
                print("check trailing padding")
                XCTAssertTrue(constraint.secondItem as? UIView == superView)
                XCTAssertEqual(constraint.constant, -right)
            }
        })
        
        myView?.constraints.forEach({ (constraint) in
            if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.width) {
                print("check width size")
                XCTAssertEqual(constraint.constant, width)
            } else if (constraint.firstItem as? UIView == view && constraint.firstAttribute == NSLayoutConstraint.Attribute.height) {
                print("check height size")
                XCTAssertEqual(constraint.constant, height)
            }
        })
        
    }
}
