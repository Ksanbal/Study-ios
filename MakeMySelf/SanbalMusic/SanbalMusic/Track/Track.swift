//
//  Track.swift
//  SanbalMusic
//
//  Created by 김현균 on 2021/07/12.
//

import UIKit

struct Track {
    let title: String
    let artist: String
    let albumName: String
    let artwork: UIImage
    
    init(title: String, artist: String, albumName: String, artwork: UIImage){
        self.title = title
        self.artist = artist
        self.albumName = albumName
        self.artwork = artwork
    }
}
