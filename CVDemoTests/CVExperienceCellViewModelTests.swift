//
//  CVExperienceCellViewModelTests.swift
//  CVDemoTests
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
import XCTest

@testable import CVDemo

class CVExperienceCellViewModelTests: XCTestCase {
    
    // Use a specific date formatter for testing
    private let testDateFormatter = DateFormatters.monthAndYearFormatter(locale: Locale(identifier: "en"),
                                                                         timeZone: .UTC)
    
    func testDateRangeText() {
        // Given
        let cellModel = CVExperienceCellViewModel(experience: .apple_2017_to_2019, dateFormatter: testDateFormatter)
        
        // When
        let actualText = cellModel.dateRangeText
        
        // Then
        XCTAssertEqual("Jun 2017 - Jun 2019", actualText)
    }
    
    func testCompanyNameText() {
        // Given
        let cellModel = CVExperienceCellViewModel(experience: .apple_2017_to_2019, dateFormatter: testDateFormatter)
        
        // When
        let actualText = cellModel.companyNameText
        
        // Then
        XCTAssertEqual("Apple", actualText)
    }
    
    func testJobTitleText() {
        // Given
        let cellModel = CVExperienceCellViewModel(experience: .apple_2017_to_2019, dateFormatter: testDateFormatter)
        
        // When
        let actualText = cellModel.jobTitleText
        
        // Then
        XCTAssertEqual("Senior iOS Developer", actualText)
    }
    
    func testAchievementsListText() {
        // Given
        let cellModel = CVExperienceCellViewModel(experience: .apple_2017_to_2019, dateFormatter: testDateFormatter)
        
        // When
        let actualText = cellModel.achievementsText
        
        // Then
        let expectedText = """
        • Invented Swift UI framework
        • Rewrote Reminders app
        • Presented new features at WWDC
        """
        XCTAssertEqual(expectedText, actualText)
    }
}
