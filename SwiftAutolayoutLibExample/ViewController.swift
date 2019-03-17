//
//  ViewController.swift
//  SwiftAutolayoutLibExample
//
//  Created by SEAN on 2019/3/17.
//  Copyright © 2019 seanlin. All rights reserved.
//

import UIKit
import SwiftAutolayoutLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = UIView()
        myView.backgroundColor = .red
        view.addSubview(myView)
        myView.fillSuperview()
    }


}

