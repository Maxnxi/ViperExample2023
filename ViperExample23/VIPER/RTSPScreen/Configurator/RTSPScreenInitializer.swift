//
//  RTSPScreenInitializer.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import UIKit

typealias RTSPScreenModule = (
    moduleInput: RTSPScreenModuleInput,
    presentable: Presentable
)

protocol Presentable {
    func toPresent() -> UIViewController
}

class RTSPScreenModuleInitializer: NSObject {

    private
    let configurator = RTSPScreenModuleConfigurator()
    //Connect with object on storyboard
    @IBOutlet weak var mainscreenViewController: RTSPScreenViewController!

    override func awakeFromNib() {

        let configurator = RTSPScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mainscreenViewController)
    }
    
//    func instantiateRTSPModule() -> RTSPScreenModule? {
//        let viewController = RTSPScreenViewController()
//        configurator.configureModuleForViewInput(viewInput: viewController)
//    }

}
