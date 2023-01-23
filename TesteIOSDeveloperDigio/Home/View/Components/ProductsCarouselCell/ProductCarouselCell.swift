//
//  ProductCarouselCell.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 20/01/23.
//

import UIKit
import TinyConstraints

protocol ProductCarouselCellDelegate: AnyObject {
    func goToDetails(of productIndex: Int)
}

class ProductCarouselCell: UICollectionViewCell {

    // MARK: UI
    lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(goToDetails), for: .touchUpInside)
        return view
    }()
    
    lazy var imageView: UIImageView = UIImageView()
    
    // MARK: Variables
    static var identifier: String = "ProductCarouselCell"
    
    weak var delegate: ProductCarouselCellDelegate?
    var productIndex: Int!

    // MARK: Methods
    @objc func goToDetails() {
        delegate?.goToDetails(of: productIndex)
    }
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

extension ProductCarouselCell {
    
    func setupUI() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.backgroundColor = UIColor.clear.cgColor
        
        setupButton()
        setupImageView()
    }

    // MARK: UI Setup Functionality
    private func setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topToSuperview()
        button.widthToSuperview()
        button.heightToSuperview()
        button.centerXToSuperview()
        button.clipsToBounds = true
        button.layer.cornerRadius = 18.0

    }

    private func setupImageView() {
        backgroundColor = .clear
               
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYToSuperview()
        imageView.centerXToSuperview()
        imageView.height(70)
        imageView.autoresizingMask = .flexibleWidth
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

    }

}
