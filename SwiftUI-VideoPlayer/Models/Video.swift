//
//  Video.swift
//  Video
//
//  Created by Lukasz Dziwosz on 31/08/2021.
//

import Foundation

struct Video: Decodable, Identifiable {
  let id = UUID()
  let title: String
  let fileName: String
  let subtitle: String
  let remoteVideoURL: URL?

  private enum CodingKeys: String, CodingKey {
    case title, subtitle
    case fileName = "file_name"
    case remoteVideoURL = "remote_video_url"
  }
}

extension Video {
  var localVideoURL: URL? {
    return Bundle.main.url(forResource: fileName, withExtension: "mp4")
  }

  var videoURL: URL? {
    return remoteVideoURL ?? localVideoURL
  }
}

extension Video {
  static func fetchLocalVideos() -> [Video] {
      print([Video].self)
    return readJSON(fileName: "LocalVideos")
  }

  static func fetchRemoteVideos() -> [Video] {
    return readJSON(fileName: "RemoteVideos")
  }
}
