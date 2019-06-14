//
//  CVDemoViewDataSourceTests.swift
//  CVDemoTests
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
import XCTest

@testable import CVDemo

class CVDemoViewDataSourceTests: XCTestCase {
    
    private let dataSource = CVDemoViewDataSource()
    private var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.registerReusableCell(CVTextCell.self)
        tableView.registerReusableCell(CVExperienceCell.self)
    }
    
    func testNumberOfSections() {
        
        dataSource.populate(with: CVModel.demo)
        
        XCTAssertEqual(3, dataSource.numberOfSections(in: tableView))
    }
    
    func testSummarySectionIsPopulated() {
        dataSource.populate(with: CVModel.demo)
        
        XCTAssertEqual("Summary", dataSource.tableView(tableView, titleForHeaderInSection: 0))
        XCTAssertEqual(1, dataSource.tableView(tableView, numberOfRowsInSection: 0))
    }
    
    func testSkillsSectionIsPopulated() {
        
        dataSource.populate(with: CVModel.demo)
        
        XCTAssertEqual("Skills", dataSource.tableView(tableView, titleForHeaderInSection: 1))
        XCTAssertEqual(3, dataSource.tableView(tableView, numberOfRowsInSection: 1))
    }
    
    func testExperienceSectionIsPopulated() {
        
        dataSource.populate(with: CVModel.demo)
        
        XCTAssertEqual("Experience", dataSource.tableView(tableView, titleForHeaderInSection: 2))
        XCTAssertEqual(2, dataSource.tableView(tableView, numberOfRowsInSection: 2))
    }
}
