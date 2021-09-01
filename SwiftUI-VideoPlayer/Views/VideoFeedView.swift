//
//  ContentView.swift
//  SwiftUI-VideoPlayer
//
//  Created by Lukasz Dziwosz on 31/08/2021.
//

import SwiftUI
import AVKit

struct VideoFeedView: View {
    
  private let videos = Video.fetchLocalVideos()
  //private let videoClips = VideoClip.urls
 @State private var selectedVideo: Video?
    
  var body: some View {
    NavigationView {
      List {
        makeEmbeddedVideoPlayer()
        ForEach(videos) { video in
          Button {
            // Open Video Player
            selectedVideo = video
          } label: {
            VideoRow(video: video)
          }
        }
      }
      .navigationTitle("Travel Vlogs")
    }
    .fullScreenCover(item: $selectedVideo) {
      // On Dismiss Closure
    } content: { item in
      makeFullScreenVideoPlayer(for: item)
    }
  }
    @ViewBuilder
    private func makeFullScreenVideoPlayer(for video: Video) -> some View {
        // 1
      if let url = video.videoURL {
        // 2
        let avPlayer = AVPlayer(url: url)
        // 3
        VideoPlayer(player: avPlayer)
          // 4
          .edgesIgnoringSafeArea(.all)
          .onAppear {
            // 5
            avPlayer.play()
          }
      } else {
       // ErrorView()
      }
    }
  private func makeEmbeddedVideoPlayer() -> some View {
    HStack {
      Spacer()

      Rectangle()
        .background(Color.black)
        .frame(width: 250, height: 140)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(.vertical)

      Spacer()
    }
  }
}


struct VideoFeedView_Previews: PreviewProvider {
  static var previews: some View {
    VideoFeedView()
  }
}
