//
//  MainScreenMainScreenViewController.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, MainScreenViewInput {

    var output: MainScreenViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: MainScreenViewInput
    func setupInitialState() {
    }
}
