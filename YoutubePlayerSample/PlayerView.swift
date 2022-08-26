//
//  PlayerView.swift
//  YoutubePlayerSample
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI
import YoutubeKit

struct PlayerView: UIViewRepresentable {
    
    typealias UIViewType = YTSwiftyPlayer
    
    @Binding var video: Video
    
    func makeUIView(context: Context) -> YTSwiftyPlayer {
        // 初期化処理・初期設定.
        let player = YTSwiftyPlayer()
        player.autoplay = true
        return player
    }
    
    func updateUIView(_ uiView: YTSwiftyPlayer, context: Context) {
        // 再生する動画の設定
        uiView.setPlayerParameters([
            .playsInline(true),
            .videoID(video.videoId),
        ])
        uiView.loadPlayer()
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(video: .constant(.jec))
    }
}
