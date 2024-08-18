//
//  VideoPlayerView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 07/08/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoName: String
    var body: some View {
        if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
            VideoPlayer(player: AVPlayer(url: url))
        }else {
            Text("Could't find \(videoName).mp4")
                .foregroundStyle(Color.red)
        }
    }
}

#Preview {
    VideoPlayerView(videoName: "squat")
}
