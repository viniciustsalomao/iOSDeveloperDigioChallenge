//
//  DetailsViewController.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 23/01/23.
//

import UIKit

class DetailsViewController: UIViewController {

    let viewModel: DetailsViewModel
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = DetailsView(viewModel: viewModel)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
