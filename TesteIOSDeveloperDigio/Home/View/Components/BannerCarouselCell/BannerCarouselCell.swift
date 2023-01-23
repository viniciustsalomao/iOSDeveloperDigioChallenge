//
//  BannerCarouselCell.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 19/01/23.
//

import UIKit
import TinyConstraints

protocol BannerCarouselCellDelegate: AnyObject {
    func goToDetails(of productIndex: Int)
}

class BannerCarouselCell: UICollectionViewCell {

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
    static var identifier: String = "BannerCarouselCell"
    
    weak var delegate: BannerCarouselCellDelegate?
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

extension BannerCarouselCell {
    func setupUI() {
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
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
        imageView.topToSuperview()
        imageView.widthToSuperview()
        imageView.heightToSuperview()
        imageView.centerXToSuperview()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.0

    }

}
