//
//  ViewController.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 18/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = HomeView(viewModel: viewModel)
        view.delegate = self
        view.bindViewModelActions()
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

extension HomeViewController: HomeViewDelegate {
    
    func goToDetailsBanner(of productIndex: Int) {
        guard let product = viewModel.spotLight?[productIndex] else {return}
        goToDetails(of: product)
    }
    
    func goToDetailsCash() {
        guard let product = viewModel.cash else {return}
        goToDetails(of: product)
    }
    
    func goToDetailsProducts(of productIndex: Int) {
        guard let product = viewModel.products?[productIndex] else {return}
        goToDetails(of: product)
    }
    
    func goToDetails(of product: Product) {
        let viewController = DetailsViewController(viewModel: DetailsViewModel(product: product))
        self.present(viewController, animated: true)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "An error has occurred while fetching the products!",
                                      message: "Please, try again",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default, handler: { _ in }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
