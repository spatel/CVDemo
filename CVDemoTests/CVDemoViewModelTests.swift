//
//  CVDemoViewModelTests.swift
//  CVDemoTests
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
import XCTest

@testable import CVDemo

class CVDemoViewModelTests: XCTestCase {
    
    private var mockService: MockCVDataService!
    private var viewModel: CVDemoViewModel!
    
    // Outputs
    private var actualModel: CVModel?
    private var actualErrorMessage: String?
    private var networkActivityRecordedValues: [Bool] = []
    
    override func setUp() {
        super.setUp()
        
        self.mockService = MockCVDataService()
        viewModel = CVDemoViewModel(dataService: mockService)
        
        viewModel.shouldReloadUI = { [weak self] in self?.actualModel = $0 }
        viewModel.shouldShowErrorMessage = { [weak self] in self?.actualErrorMessage = $0 }
        viewModel.shouldShowNetworkActivity = { [weak self] in self?.networkActivityRecordedValues.append($0) }
    }
    
    func testViewDidLoad_LoadCV_Success() {
        // Given a successful API call
        let expectedModel = CVModel.demo
        mockService.getCVModel = .success(expectedModel)
        
        // When the view loads
        viewModel.viewDidLoad()
        
        // Then I expect the model to be loaded
        XCTAssertEqual(expectedModel, actualModel)
        XCTAssertNil(actualErrorMessage)
    }
    
    func testViewDidLoad_LoadCV_Failure() {
        // Given a failed API call
        mockService.getCVModel = .failure(ServiceError.unknown)

        // When the view loads
        viewModel.viewDidLoad()

        // Then I expect an error message to be displayed
        XCTAssertEqual(ServiceError.unknown.localizedDescription, actualErrorMessage)
        XCTAssertNil(actualModel)
    }

    func testTappingTheRefreshButton_ReloadsTheCV() {
        
        // Given a successful API call
        let expectedModel = CVModel.demo
        mockService.getCVModel = .success(expectedModel)
        
        // When the view loads
        viewModel.viewDidLoad()
        
        // Then I expect the section models to be reloaded...
        XCTAssertEqual(expectedModel, actualModel)
        
        // ...and also the network activity indicator to be shown, then hidden
        XCTAssertEqual([true, false], networkActivityRecordedValues)
    }
    
}
