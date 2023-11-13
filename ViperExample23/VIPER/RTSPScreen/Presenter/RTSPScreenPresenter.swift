//
//  RTSPScreenPresenter.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

class RTSPScreenPresenter: RTSPScreenModuleInput, RTSPScreenViewOutput, RTSPScreenInteractorOutput {

    weak var view: RTSPScreenViewInput?
    var interactor: RTSPScreenInteractorInput?
    var router: RTSPScreenRouterInput?
    
    

    func viewIsReady() {

        print("____", #function)
        print("____ view = ", view)
        print("____ interactor = ", interactor)
        print("____ router = ", router)
        interactor?.fetchCamerasIP()
    }
}

// MARK: - RTSPScreenInteractorOutput
extension RTSPScreenPresenter {
    func succesFetchCamerasIPs(ips: [String]) {
        view?.updateViewWithCamerasIps(ips: ips)
    }
}
