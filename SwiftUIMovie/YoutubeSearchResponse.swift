//
//  YoutubeSearchResponse.swift
//  SwiftUIMovie
//
//  Created by Saurabh Jaiswal on 27/12/25.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [ItemProperties]?
}


struct ItemProperties: Codable {
    let id: IdProperties?
}


struct IdProperties: Codable {
    let videoId: String?
}
