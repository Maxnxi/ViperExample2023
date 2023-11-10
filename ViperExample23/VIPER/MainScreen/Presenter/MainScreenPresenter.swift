//
//  MainScreenMainScreenPresenter.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

class MainScreenPresenter: MainScreenModuleInput, MainScreenViewOutput, MainScreenInteractorOutput {

    weak var view: MainScreenViewInput!
    var interactor: MainScreenInteractorInput!
    var router: MainScreenRouterInput!

    func viewIsReady() {

    }
}
