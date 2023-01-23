//
//  BannerCarouselDataSource.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 20/01/23.
//

import UIKit

protocol BannerCarouselDataSourceDelegate: AnyObject {
    func goToDetailsBanner(of productIndex: Int)
}

class BannerCarouselDataSource: NSObject {
    
    var data = [Product]()
    var collectionView: UICollectionView
    var delegate: BannerCarouselDataSourceDelegate?

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func registerCollectionViewCells() {
        self.collectionView.register(ProductCarouselCell.self, forCellWithReuseIdentifier: ProductCarouselCell.identifier)
    }
}

extension BannerCarouselDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCarouselCell.identifier, for: indexPath)
                as? BannerCarouselCell else {
            return UICollectionViewCell()
        }
        
        cell.imageView.getImagefromStringURL(data[indexPath.row].imageURL, placeHolder: UIImage())
        cell.productIndex = indexPath.row
        cell.delegate = self

        return cell
    }
}

extension BannerCarouselDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: 12,
            left: 16,
            bottom: 12,
            right: 16
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 14
    }
}

extension BannerCarouselDataSource: BannerCarouselCellDelegate {
    func goToDetails(of productIndex: Int) {
        delegate?.goToDetailsBanner(of: productIndex)
    }
    
}
