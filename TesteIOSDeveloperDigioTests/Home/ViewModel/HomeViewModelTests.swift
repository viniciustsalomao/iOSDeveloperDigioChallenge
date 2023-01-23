//
//  TesteIOSDeveloperDigioTests.swift
//  TesteIOSDeveloperDigioTests
//
//  Created by Vinícius Tinajero Salomão on 18/01/23.
//

import XCTest
@testable import TesteIOSDeveloperDigio

final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        viewModel = HomeViewModel(service: HomeServiceMock())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // MARK: - Functions
    func testGetProductsIsNotEmpty() {
        // Arrange
        let expectation = expectation(description: "success")
        var value: Bool = false
        
        // Act
        viewModel.bindSuccess = {
            expectation.fulfill()
            value = !(self.viewModel.products?.isEmpty ?? false)
        }

        viewModel.bindFailure = { error in
            XCTFail("Expected to be a success but got a failure with error: \(error)")
        }
        
        viewModel.getProducts()
        
        // Assert
        waitForExpectations(timeout: 1) { _ in
            XCTAssertEqual(value, true)
        }
    }
    
    func testGetProductsValueIsValid() {
        // Arrange
        let expectation = expectation(description: "success")
        var value: String = "XBOX"
        
        // Act
        viewModel.bindSuccess = {
            expectation.fulfill()
            value = self.viewModel.products?.first?.name ?? ""
        }

        viewModel.bindFailure = { error in
            XCTFail("Expected to be a success but got a failure with error: \(error)")
        }
        
        viewModel.getProducts()
        
        // Assert
        waitForExpectations(timeout: 1) { _ in
            XCTAssertEqual(value, "XBOX")
        }
    }

}
