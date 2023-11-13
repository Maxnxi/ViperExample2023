//
//  RTSPScreenConfigurator.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import UIKit

class RTSPScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? RTSPScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RTSPScreenViewController) {

        let router = RTSPScreenRouter()

        let presenter = RTSPScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RTSPScreenInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
