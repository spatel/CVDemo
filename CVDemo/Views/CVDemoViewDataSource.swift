//
//  CVDemoDataSource.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
import UIKit

enum CVDemoTableSection: Equatable {
    case summary(title: String, summaryTitle: String)
    case skills(title: String, skills: [String])
    case experience(title: String, details: [ExperienceDetail])
}

class CVDemoViewDataSource: NSObject, UITableViewDataSource {

    private(set) var sectionModels: [CVDemoTableSection] = []

    // MARK: - UITableViewDataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModels.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionModel = sectionModels[section]
        switch sectionModel {
        case .summary:
            return 1
        case let .skills(_, skillsList):
            return skillsList.count
        case let .experience(_, details):
            return details.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel = sectionModels[indexPath.section]
        
        switch sectionModel {
        case let .summary(_, summaryText):
            let textCell: CVTextCell = tableView.dequeueReusableCell(for: indexPath)
            return textCell.configure(with: summaryText)
        case let .skills(_, skills):
            let textCell: CVTextCell = tableView.dequeueReusableCell(for: indexPath)
            return textCell.configure(with: skills[indexPath.row])
        case let .experience(_, details):
            let experienceDetailCell: CVExperienceCell = tableView.dequeueReusableCell(for: indexPath)
            return experienceDetailCell.configure(with: details[indexPath.row])
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionModel = sectionModels[section]
        
        switch sectionModel {
        case let .summary(title, _):
            return title
        case let .skills(title, _):
            return title
        case let .experience(title, _):
            return title
        }
    }

    // MARK: - Public API

    func populate(with model: CVModel) {
        
        self.sectionModels = [.summary(title: Strings.cvSummarySectionTitle,
                                       summaryTitle: model.summary),
                              .skills(title: Strings.cvSkillsSectionTitle,
                                      skills: model.skills),
                              .experience(title: Strings.cvExperienceSectionTitle,
                                          details: model.experience)]
    }
}
