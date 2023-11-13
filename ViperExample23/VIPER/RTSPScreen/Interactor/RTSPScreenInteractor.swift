//
//  MainScreenMainScreenInteractor.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import Foundation

class RTSPScreenInteractor: RTSPScreenInteractorInput {

    var camerasIPFetchService: CamerasIPFetchService?
    var output: RTSPScreenInteractorOutput?

    func fetchCamerasIP() {
        DispatchQueue.global().async { [weak self] in
            self?.camerasIPFetchService?.fetchCamerasIPs(completion: { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let camerasIps):
                        self?.output?.succesFetchCamerasIPs(ips: camerasIps)
                    case .failure(let failure):
                        debugPrint(Self.self, #function)
                    }
                }
            })
        }
    }

}
