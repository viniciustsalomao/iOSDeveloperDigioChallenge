//
//  HomeScreen.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 19/01/23.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func goToDetailsBanner(of productIndex: Int)
    func goToDetailsProducts(of productIndex: Int)
    func goToDetailsCash()
    func showAlert()
}

final class HomeView: UIView {
    
    // MARK: Views
    lazy var welcomeUserLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Olá, Vinícius"
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return view
    }()
    
    lazy var bannerCarousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    lazy var digioCashLabel: UILabel = {
        let view = UILabel(frame: .zero)
        
        let str = "digio Cash"
        var attrString = NSMutableAttributedString(string: str)
        attrString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor(red: 0.00, green: 0.15, blue: 0.37, alpha: 1.00),
            range: NSRange(location: 0, length: 5))
        attrString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.gray,
            range: NSRange(location: 6, length: 4))
        
        view.attributedText = attrString
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return view
    }()
    
    lazy var digioCashBanner: UIView = UIView()
    
    lazy var digioCashBannerImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()

    lazy var digioCashBannerButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(goToDetailsCash), for: .touchUpInside)
        return view
    }()
    
    lazy var productsLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Produtos"
        view.textColor = UIColor(red: 0.00, green: 0.15, blue: 0.37, alpha: 1.00)
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return view
    }()
    
    lazy var productsCarousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false

        return collectionView
    }()
    
    // MARK: Variables
    let viewModel: HomeViewModel
    var delegate: HomeViewDelegate?
    var bannerCarouselDataSource: BannerCarouselDataSource?
    var productsCarouselDataSource: ProductsCarouselDataSource?

    // MARK: Init
    init(frame: CGRect = .zero, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        setupCarousels()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bannerCarousel.collectionViewLayout.invalidateLayout()
        self.productsCarousel.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: Methods
    func setupCarousels() {
        bannerCarouselDataSource = BannerCarouselDataSource(collectionView: bannerCarousel)
        bannerCarouselDataSource?.registerCollectionViewCells()
        bannerCarouselDataSource?.delegate = self
        bannerCarousel.dataSource = bannerCarouselDataSource
        bannerCarousel.delegate = bannerCarouselDataSource
        
        productsCarouselDataSource = ProductsCarouselDataSource(collectionView: productsCarousel)
        productsCarouselDataSource?.registerCollectionViewCells()
        productsCarouselDataSource?.delegate = self
        productsCarousel.dataSource = productsCarouselDataSource
        productsCarousel.delegate = productsCarouselDataSource

    }
    
    @objc func goToDetailsCash() {
        delegate?.goToDetailsCash()
    }
    
    func bindViewModelActions() {
        viewModel.bindSuccess = { [weak self] in
            DispatchQueue.main.async {
                self?.bannerCarouselDataSource?.data = self?.viewModel.spotLight ?? []
                self?.bannerCarousel.reloadData()
                
                self?.productsCarouselDataSource?.data = self?.viewModel.products ?? []
                self?.productsCarousel.reloadData()
                
                self?.digioCashBannerImage.getImagefromStringURL((self?.viewModel.cash!.imageURL)!, placeHolder: UIImage())

            }
        }
        
        viewModel.bindFailure = { [weak self] in
            self?.delegate?.showAlert()
        }
    }

}

extension HomeView: BannerCarouselDataSourceDelegate {
    
    func goToDetailsBanner(of productIndex: Int) {
        delegate?.goToDetailsBanner(of: productIndex)
    }
    
}

extension HomeView: ProductsCarouselDataSourceDelegate {
    
    func goToDetailsProducts(of productIndex: Int) {
        delegate?.goToDetailsProducts(of: productIndex)
    }
    
}
