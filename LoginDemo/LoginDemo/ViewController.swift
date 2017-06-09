//
//  ViewController.swift
//  LoginDemo
//
//  Created by alexiuce  on 2017/6/9.
//  Copyright © 2017年 com.Alexiuce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(LoginController(), animated: true, completion: nil)
    }

}

