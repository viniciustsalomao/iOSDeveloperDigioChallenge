//
//  DetailsView+UI.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 23/01/23.
//

import UIKit
import TinyConstraints

extension DetailsView {
    
    func setupUI() {
        backgroundColor = .white
        setupProductBanner()
        setupProductNameLabel()
        setupProductDetailsLabel()
    }
    
    // MARK: UI Setup Functionality
    private func setupProductBanner() {
        self.addSubview(productBanner)
        self.productBanner.translatesAutoresizingMaskIntoConstraints = false
        self.productBanner.topToSuperview()
        self.productBanner.leftToSuperview()
        self.productBanner.rightToSuperview()
        self.productBanner.widthToSuperview()
        self.productBanner.autoresizingMask = .flexibleHeight
        self.productBanner.contentMode = .scaleAspectFit
        self.productBanner.clipsToBounds = true
        self.productBanner.layer.cornerRadius = 12.0
    }
    
    private func setupProductNameLabel() {
        self.addSubview(self.productNameLabel)
        self.productNameLabel.topToBottom(of: productBanner, offset: 24)
        self.productNameLabel.leftToSuperview(offset: 16)
        self.productNameLabel.rightToSuperview(offset: -16)
    }
    
    private func setupProductDetailsLabel() {
        self.addSubview(self.productDetailsLabel)
        self.productDetailsLabel.topToBottom(of: productNameLabel, offset: 16)
        self.productDetailsLabel.leftToSuperview(offset: 16)
        self.productDetailsLabel.rightToSuperview(offset: -16)
    }
    
}
