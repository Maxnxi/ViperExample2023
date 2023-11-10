//
//  MainScreenMainScreenConfigurator.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import UIKit

class MainScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MainScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainScreenViewController) {

        let router = MainScreenRouter()

        let presenter = MainScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MainScreenInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
