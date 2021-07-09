//
//  TrackCollectionViewCell.swift
//  AppleMusicStyleApp
//
//  Created by 김현균 on 2021/07/09.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    // Collection View Cell이 호출될 때
    override func awakeFromNib(){
        super.awakeFromNib()
        trackThumbnail.layer.cornerRadius = 4
        trackArtist.textColor = UIColor.systemGray2
    }
    
    func updateUI(item: Track?){
        // 곡정보 표시하기
        guard let track = item else { return }
        trackThumbnail.image = track.artwork
        trackTitle.text = track.title
        trackArtist.text = track.artist
    }
}
