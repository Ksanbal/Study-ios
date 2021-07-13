//
//  Extension+AVPlayerItem.swift
//  AppleMusicStyleApp
//
//  Created by 김현균 on 2021/07/09.
//

import AVFoundation
import UIKit

extension AVPlayerItem {
    // extension에서는 Stored Property를 추가할 수 없다.
    
    func convertToTrack() -> Track? {
        let metadataList = asset.metadata
        
        var trackTitle: String?
        var trackArtist: String?
        var trackAlbumName: String?
        var trackArtwork: UIImage?
        
        for meatadata in metadataList {
            if let title = meatadata.title {
                trackTitle = title
            }
            
            if let artist = meatadata.artist {
                trackArtist = artists
            }
            
            if let albumName = meatadata.albumName {
                trackAlbumName = albumName
            }
            
            if let artwork = meatadata.artwork {
                trackArtwork = artwork
            }
        }
        
        guard let title = trackTitle,
              let artist = trackArtist,
              let albumName = trackAlbumName,
              let artwork = trackArtwork else {
            return nil
        }
        return Track(title: title, artist: artist, albumName: albumName, artwork: artwork)
    }
}

extension AVMetadataItem {
    var title: String? {
        guard let key = commonKey?.rawValue, key == "title" else {
            return nil
        }
        return stringValue
    }
    
    var artist: String? {
        guard let key = commonKey?.rawValue, key == "artist" else {
            return nil
        }
        return stringValue
    }
    
    var albumName: String? {
        guard let key = commonKey?.rawValue, key == "albumName" else {
            return nil
        }
        return stringValue
    }
    
    var artwork: UIImage? {
        guard let key = commonKey?.rawValue, key == "artwork", let data = dataValue, let image = UIImage(data: data) else {
            return nil
        }
        return image
    }
}

extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}
