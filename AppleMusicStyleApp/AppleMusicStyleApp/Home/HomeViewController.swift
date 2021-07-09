//
//  HomeViewController.swift
//  AppleMusicStyleApp
//
//  Created by 김현균 on 2021/07/09.
//

import UIKit

class HomeViewController: UIViewController {
    let trackManager: TrackManager = TrackManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    // 몇개 표시할까?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackManager.tracks.count
    }
    
    // 셀 어떻게 표시할까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        let track = trackManager.track(at: indexPath.item)
        cell.updateUI(item: track)
        return cell
    }
    
    // 헤더뷰 어떻게 표시할까?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    // 클릭했을때 어떻게 할까
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 곡 클릭시 플레이어뷰 띄우기
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    // 셀 사이즈 어떻게 할까/
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 20 - card - 20 - card - 20
        // 셀 사이즈 구하기
        let itemSpacing: CGFloat = 20
        let inset: CGFloat = 20 // margin
        let width = (collectionView.bounds.width - itemSpacing - inset * 2) / 2
        let height = width + 60
        return CGSize(width: width, height: height)
    }
}
