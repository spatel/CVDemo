//
//  MockCVDataService.swift
//  CVDemoTests
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
@testable import CVDemo

class MockCVDataService: CVDataServiceType {
    
    var getCVModel: Result<CVModel, Error>

    init(getCVModel: Result<CVModel, Error> = .success(.empty)) {
        self.getCVModel = getCVModel
    }
    
    func getCV(completion: @escaping (Result<CVModel, Error>) -> Void) {
        completion(getCVModel)
    }
}
