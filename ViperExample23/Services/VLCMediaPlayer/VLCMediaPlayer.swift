//
//  VLCMediaPlayer.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 10/11/2566 BE.
//

import Foundation
import MobileVLCKit
/// https://stackoverflow.com/questions/70473210/rtsp-stream-works-but-rtsps-stream-doesnt
///


protocol PlayerService {
    func configureMediaPlayer(url: URL) -> VLCMediaPlayer
       
}

class PlayerServiceImp: PlayerService {
    
    let mediaPlayer : VLCMediaPlayer = VLCMediaPlayer()
    
    func configureMediaPlayer(url: URL) -> VLCMediaPlayer {
        let media = VLCMedia(url: url)
        
        media.addOptions([
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
        mediaPlayer.audio?.isMuted = true
        
        mediaPlayer.videoAspectRatio = UnsafeMutablePointer<Int8>(mutating: ("16:9" as NSString).utf8String)
        mediaPlayer.play()
        
        return mediaPlayer
    }
    
    
}
