//
//  ContentView.swift
//  YoutubePlayerSample
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerSize: CGSize = .zero
    @State private var selected: Video = .jec
    
    var body: some View {
        VStack {
            
            PlayerView(video: $selected)
                .frame(
                    width: playerSize.width,
                    height: playerSize.height
                )
            
            Picker("動画の選択", selection: $selected) {
                ForEach(Video.allCases, id: \.self) { video in
                    Text(video.rawValue.uppercased())
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .onAppear {
            // windowサイズからplayerサイズを算出.
            let frame = UIApplication.shared.windows.first?.frame ?? .zero
            
            //縦横比16:9
            playerSize = CGSize(
                width: frame.width,
                height: frame.width / 16 * 9
            )
        }
    }
}

enum Video: String, CaseIterable {
    
    //[使用動画]
    //    日本電子専門学校　成長の理由〜ダイジェスト編〜
    //    https://www.youtube.com/watch?v=ktEgR3-5UYI
    //    ケータイ・アプリケーション科 学生応援動画【授業紹介編】
    //    https://www.youtube.com/watch?v=OvQ8ZTywzqI
    //    在校生voice
    //    https://www.youtube.com/watch?v=YYzQeeU4euQ
    
    case jec
    case Introduction
    case voice
    
    var videoId: String {
        switch self {
        case .jec: return "ktEgR3-5UYI"
        case .Introduction: return "OvQ8ZTywzqI"
        case .voice: return "YYzQeeU4euQ"
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
