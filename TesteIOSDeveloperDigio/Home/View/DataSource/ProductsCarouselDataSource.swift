//
//  ProductsCarouselDataSource.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 20/01/23.
//

import UIKit

protocol ProductsCarouselDataSourceDelegate: AnyObject {
    func goToDetailsProducts(of productIndex: Int)
}

class ProductsCarouselDataSource: NSObject {
    
    var data = [Product]()
    var collectionView: UICollectionView
    var delegate: ProductsCarouselDataSourceDelegate?

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func registerCollectionViewCells() {
        self.collectionView.register(ProductCarouselCell.self, forCellWithReuseIdentifier: ProductCarouselCell.identifier)
    }
}

extension ProductsCarouselDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCarouselCell.identifier, for: indexPath)
                as? ProductCarouselCell else {
            return UICollectionViewCell()
        }
        
        cell.imageView.getImagefromStringURL(data[indexPath.row].imageURL, placeHolder: UIImage())
        cell.productIndex = indexPath.row
        cell.delegate = self

        return cell
    }
}

extension ProductsCarouselDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
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

extension ProductsCarouselDataSource: ProductCarouselCellDelegate {
    func goToDetails(of productIndex: Int) {
        delegate?.goToDetailsProducts(of: productIndex)
    }
    
}
