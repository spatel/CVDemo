//
//  TestData.swift
//  CVDemoTests
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation
@testable import CVDemo

extension CVModel {
    
    static let empty = CVModel(candidateName: "", summary: "", skills: [], experience: [])
    
    static let demo = CVModel(candidateName: "John Smith",
                              summary: "John has 8 years of experience working for Apple",
                              skills: ["Objective C", "Swift", "Core Data"],
                              experience: [.apple_2017_to_2019,
                                           .google_2015_to_2017])
    
}

extension Company {
    static let apple = Company(name: "Apple")
    static let google = Company(name: "Google")
}

extension ExperienceDetail {
    
    static let apple_2017_to_2019 = ExperienceDetail(company: .apple,
                                                     jobTitle: "Senior iOS Developer",
                                                     startDate: Date.UTC(year: 2017, month: 6, day: 1)!,
                                                     endDate: Date.UTC(year: 2019, month: 6, day: 1)!,
                                                     achievements: ["Invented Swift UI framework",
                                                                    "Rewrote Reminders app",
                                                                    "Presented new features at WWDC"])
    
    static let google_2015_to_2017 = ExperienceDetail(company: .google,
                                                      jobTitle: "Senior iOS Developer",
                                                      startDate: Date.UTC(year: 2015, month: 6, day: 1)!,
                                                      endDate: Date.UTC(year: 2017, month: 6, day: 1)!,
                                                      achievements: ["Worked on Google iOS apps",
                                                                     "Rewrote gmail app"])
}
