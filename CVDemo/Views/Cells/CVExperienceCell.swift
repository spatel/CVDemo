//
//  CVExperienceCell.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CVExperienceCell
class CVExperienceCell: UITableViewCell, Reusable {
    
    @discardableResult
    func configure(with experience: ExperienceDetail) -> Self {
        let cellModel = CVExperienceCellViewModel(experience: experience)
        self.textLabel?.numberOfLines = 0 // Required for dynamic cell height
        self.textLabel?.text = cellModel.text
        return self
    }
}

// MARK: - CVExperienceCellViewModel
class CVExperienceCellViewModel {

    let companyNameText: String
    let dateRangeText: String
    let jobTitleText: String
    let achievementsText: String
    
    var text: String {

        // N.B. This is not the best way to do things. You'd probably want to use NSAttributedString
        // for text formatting and/or break the cell down further (e.g. into vertical stack views)
        // depending on your designs. Am only doing it this way due to time constraints and I
        // just want to focus on unit testing the cell view model.
        return """
        \(dateRangeText)
        \(companyNameText)
        \(jobTitleText)
        
        \(achievementsText)
        
        """
    }
    
    init(experience: ExperienceDetail,
         dateFormatter: DateFormatter = DateFormatters.monthAndYearFormatter(timeZone: .UTC)) {
        
        self.companyNameText = experience.company.name
        
        let startDate = dateFormatter.string(from: experience.startDate)
        let endDate = dateFormatter.string(from: experience.endDate)
        self.dateRangeText = "\(startDate) - \(endDate)"
        
        self.jobTitleText = experience.jobTitle
        self.achievementsText = experience.achievements.toBulletPointText()
    }
}

// MARK: - Helper methods
private extension Array where Element == String {
    
    func toBulletPointText() -> String {
        return self.map { "• \($0)" }.joined(separator: "\n")
    }
}
