//
//  PlayerView.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 10/11/2566 BE.
//

import UIKit
import DITranquillity
import MobileVLCKit

struct PlayerViewModel {
    let url: URL
    let frame: CGRect
}

final
class PlayerView: UIView {
        
    let playerService: PlayerService = PlayerServiceImp()
    var mediaPlayer: VLCMediaPlayer?
    
    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(model: PlayerViewModel) {
        
        mediaPlayer = playerService.configureMediaPlayer(url: model.url)
        mediaPlayer?.delegate = self
        mediaPlayer?.drawable = self
        mediaPlayer?.play()
    }
    
    
}

extension PlayerView: VLCMediaPlayerDelegate {
    func checkConnection() -> Bool {
        let isPlaying: Bool = mediaPlayer?.isPlaying == true
        return isPlaying
    }
}
