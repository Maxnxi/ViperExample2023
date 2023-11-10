//
//  PlayerView.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 10/11/2566 BE.
//

import UIKit
import DITranquillity

struct PlayerViewModel {
    let url: URL
    let frame: CGRect
}

final
class PlayerView: UIView {
    
    let url: URL
    
    init(model: PlayerViewModel) {
        self.url = model.url
        super.init(frame: model.frame)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
