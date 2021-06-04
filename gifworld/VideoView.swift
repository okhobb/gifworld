//
//  VideoView.swift
//  gifworld
//
//  Created by dmitri lemmerman on 6/4/21.
//

import Foundation
import UIKit
import SwiftUI
import AVKit


class PlayerUIView: UIView {
    
    private let playerLayer = AVPlayerLayer()
    
    private var videoLooper: AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let pickleUrl = "https://media.giphy.com/media/8aLQDT8BXSj7y/giphy.mp4"
        let url = URL(string: pickleUrl)!
        
        let asset = AVAsset(url: url)
        let item = AVPlayerItem(asset: asset)
        let player = AVQueuePlayer()
        videoLooper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
        playerLayer.player = player
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct VideoView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VideoView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero)
    }
    
}
