//
//  VLCMediaPlayer.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 10/11/2566 BE.
//

import Foundation
import MobileVLCKit
////
////struct VlcPlayerRepresentable: UIViewRepresentable{ //MARK: Transform from a UIView into swiftUI compatible
////func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VlcPlayerRepresentable>) {
////}
////
////func makeUIView(context: Context) -> UIView {
////    return PlayerUIView(frame: .zero)
////}}
//
protocol Player {
    
}

class PlayerImp: Player {
    
}
//
//class PlayerUIView: UIView, VLCMediaPlayerDelegate, ObservableObject{
//let mediaPlayer : VLCMediaPlayer = VLCMediaPlayer()// You can also add options in here
//override init(frame: CGRect) {
//    super.init(frame: UIScreen.screens[0].bounds)
//    let url = URL(string: "rtsps://stream-eu1-bravo.dropcam.com:443/sdm_live_stream/")!//replace your resource here
//
//    let media = VLCMedia(url: url)
//
//    media.addOptions([// Add options here
//        "network-caching": 300,
//        "--rtsp-frame-buffer-size":100,
//        "--vout": "ios",
//        "--glconv" : "glconv_cvpx",
//        "--rtsp-caching=": 150,
//        "--tcp-caching=": 150,
//        "--realrtsp-caching=": 150,
//        "--h264-fps": 20.0,
//        "--mms-timeout": 60000
//    ])
//
//    mediaPlayer.media = media
//    mediaPlayer.delegate = self
//    mediaPlayer.drawable = self
//    mediaPlayer.audio?.isMuted = true
//
//    mediaPlayer.videoAspectRatio = UnsafeMutablePointer<Int8>(mutating: ("16:9" as NSString).utf8String)
//    mediaPlayer.play()}
//    
//    func checkConnection() -> Bool{
//        let isPlaying: Bool = mediaPlayer.isPlaying
//        return isPlaying
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//struct StreamsTab: View {
//var body: some View {
//    return VStack{
//        Text("stream")
//        VlcPlayerRepresentable()
//    }
//}}
