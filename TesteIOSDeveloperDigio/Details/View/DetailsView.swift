//
//  DetailsView.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 23/01/23.
//

import UIKit

final class DetailsView: UIView {
    
    // MARK: Views
    lazy var productBanner: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.getImagefromStringURL(viewModel.product.imageURL, placeHolder: UIImage())
        return view
    }()
    
    lazy var productNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(red: 0.00, green: 0.15, blue: 0.37, alpha: 1.00)
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.text = viewModel.product.name
        return view
    }()
    
    lazy var productDetailsLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.text = viewModel.product.description
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        return view
    }()
    
    // MARK: Variables
    let viewModel: DetailsViewModel

    // MARK: Init
    init(frame: CGRect = .zero, viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
