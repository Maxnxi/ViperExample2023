//
//  RTSPScreenViewInput.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

protocol RTSPScreenViewInput: class {
    
    func setupInitialState()
    func updateViewWithCamerasIps(ips: [String])
}
