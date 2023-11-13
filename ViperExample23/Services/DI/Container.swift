//
//  Container.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 10/11/2566 BE.
//

import DITranquillity

class ApplicationDependency: DIFramework {
    
    static let container: DIContainer = {
        let container = DIContainer()
        container.append(framework: ApplicationDependency.self)
        
//        assert(container.validate(checkGraphCycles: true), "Invalid dependency graph")
        
        return container
    }()
    
    static func load(container: DIContainer) {
        loadRTSPModule(container: container)
    }
}


extension ApplicationDependency {
    static
    func loadRTSPModule(container: DIContainer) {
        
        container.registerStoryboard(name: "RTSPScreenViewController")
            .as(check: UIStoryboard.self, tag: RTSPScreenViewController.self) {$0}
        
//        container.register(PlayerImp.init)
//            .as(check: Player.self) {$0}
        
        container.register(RTSPScreenPresenter.init)
            //.as(check: RTSPScreenModuleInput.self) { $0 }
            .as(check: RTSPScreenInteractorOutput.self) { $0 }
            .as(check: RTSPScreenViewOutput.self) { $0 }

            .injection(cycle: true, \.interactor)
            .injection(cycle: true, \.router)
            .injection(cycle: true, \.view)
        
        container.register(RTSPScreenRouter.init)
            .as(check: RTSPScreenRouterInput.self) { $0 }
            .lifetime(.objectGraph)
        
        container.register(RTSPScreenInteractor.init)
            .as(check: RTSPScreenInteractorInput.self) { $0 }
            .lifetime(.objectGraph)
            .injection(\.output)
            .injection(\.camerasIPFetchService)
        
        container.register(RTSPScreenViewController.self)
            .as(check: RTSPScreenViewInput.self) { $0 }
            .lifetime(.objectGraph)
            .injection(\.output)
        
        
        container.register(CamerasIPFetchServiceImp.init)
            .as(check: CamerasIPFetchService.self) {$0}
    }
}
