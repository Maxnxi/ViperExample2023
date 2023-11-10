//
//  MainScreenMainScreenInitializer.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import UIKit

class MainScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var mainscreenViewController: MainScreenViewController!

    override func awakeFromNib() {

        let configurator = MainScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mainscreenViewController)
    }

}
