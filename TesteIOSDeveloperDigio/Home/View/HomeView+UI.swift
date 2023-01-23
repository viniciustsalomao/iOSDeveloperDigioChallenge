//
//  HomeView+UI.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 23/01/23.
//

import UIKit
import TinyConstraints

extension HomeView {
    
    func setupUI() {
        backgroundColor = .white
        setupWelcomeUserLabel()
        setupBannerCarousel()
        setupDigioCashLabel()
        setupDigioCashBanner()
        setupProductsLabel()
        setupProductsCarousel()
    }

    // MARK: UI Setup Functionality
    private func setupWelcomeUserLabel() {
        
        self.addSubview(self.welcomeUserLabel)
        
        self.welcomeUserLabel.topToSuperview(offset: 16, usingSafeArea: true)
        self.welcomeUserLabel.leftToSuperview(offset: 16)
        
    }
    
    private func setupBannerCarousel() {
        
        self.addSubview(self.bannerCarousel)
        
        self.bannerCarousel.topToBottom(of: welcomeUserLabel, offset: 24)
        self.bannerCarousel.leftToSuperview()
        self.bannerCarousel.rightToSuperview()
        self.bannerCarousel.height(180)
        self.bannerCarousel.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        self.bannerCarousel.register(BannerCarouselCell.self, forCellWithReuseIdentifier: BannerCarouselCell.identifier)
    }
    
    private func setupDigioCashLabel() {
        
        self.addSubview(self.digioCashLabel)
        
        self.digioCashLabel.topToBottom(of: bannerCarousel, offset: 24)
        self.digioCashLabel.leftToSuperview(offset: 16)
        
    }
    
    private func setupDigioCashBanner() {
               
        self.addSubview(digioCashBanner)
        self.digioCashBanner.translatesAutoresizingMaskIntoConstraints = false
        self.digioCashBanner.topToBottom(of: digioCashLabel, offset: 18)
        self.digioCashBanner.leftToSuperview(offset: 14)
        self.digioCashBanner.rightToSuperview(offset: -14)
        self.digioCashBanner.height(100)
        self.digioCashBanner.clipsToBounds = true
        self.digioCashBanner.layer.cornerRadius = 12.0
        self.setupDigioCashBannerButton()
        self.setupDigioCashBannerImage()
    }
    
    private func setupDigioCashBannerButton() {
        self.digioCashBanner.addSubview(digioCashBannerButton)
        digioCashBannerButton.translatesAutoresizingMaskIntoConstraints = false
        digioCashBannerButton.topToSuperview()
        digioCashBannerButton.widthToSuperview()
        digioCashBannerButton.heightToSuperview()
        digioCashBannerButton.centerXToSuperview()
        digioCashBannerButton.clipsToBounds = true
        digioCashBannerButton.layer.cornerRadius = 18.0

    }

    private func setupDigioCashBannerImage() {
        self.digioCashBanner.addSubview(digioCashBannerImage)
        digioCashBannerImage.translatesAutoresizingMaskIntoConstraints = false
        digioCashBannerImage.topToSuperview()
        digioCashBannerImage.widthToSuperview()
        digioCashBannerImage.heightToSuperview()
        digioCashBannerImage.centerXToSuperview()
        digioCashBannerImage.contentMode = .scaleAspectFill
        digioCashBannerImage.clipsToBounds = true
        digioCashBannerImage.layer.cornerRadius = 12.0

    }
    
    private func setupProductsLabel() {
        
        self.addSubview(self.productsLabel)
        
        self.productsLabel.topToBottom(of: digioCashBanner, offset: 24)
        self.productsLabel.leftToSuperview(offset: 16)
        
    }
    
    private func setupProductsCarousel() {
        
        self.addSubview(self.productsCarousel)
        
        self.productsCarousel.topToBottom(of: productsLabel, offset: 18)
        self.productsCarousel.leftToSuperview()
        self.productsCarousel.rightToSuperview()
        self.productsCarousel.height(130)
        self.productsCarousel.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
    }
}
