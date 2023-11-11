//
//  RTSPScreenInteractorOutput.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import Foundation

protocol RTSPScreenInteractorOutput: class {
    func succesFetchCamerasIPs(ips: [String])
}
