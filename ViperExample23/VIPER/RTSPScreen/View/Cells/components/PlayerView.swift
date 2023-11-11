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
    
    //let url: URL
    
    let mediaPlayer : VLCMediaPlayer = VLCMediaPlayer()
    
    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(model: PlayerViewModel) {
        
        
        let media = VLCMedia(url: model.url)
        
        media.addOptions([// Add options here
            "network-caching": 300,
            "--rtsp-frame-buffer-size":100,
            "--vout": "ios",
            "--glconv" : "glconv_cvpx",
            "--rtsp-caching=": 150,
            "--tcp-caching=": 150,
            "--realrtsp-caching=": 150,
            "--h264-fps": 20.0,
            "--mms-timeout": 60000
        ])
        
        mediaPlayer.media = media
        mediaPlayer.delegate = self
        mediaPlayer.drawable = self
        mediaPlayer.audio?.isMuted = true
        
        mediaPlayer.videoAspectRatio = UnsafeMutablePointer<Int8>(mutating: ("16:9" as NSString).utf8String)
        mediaPlayer.play()
        
        
    }
    
    
}

extension PlayerView: VLCMediaPlayerDelegate {
    func checkConnection() -> Bool{
        let isPlaying: Bool = mediaPlayer.isPlaying
        return isPlaying
    }
}
