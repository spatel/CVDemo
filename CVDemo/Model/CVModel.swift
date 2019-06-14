//
//  CVModel.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation

/*
 
 Sample JSON:
 
{
   "candidateName": "John Smith",
   "summary": "John is a senior iOS Developer with 8 years of iOS experience.",
   "skills": ["SkillA", "SkillB", "SkillC"],
   "experience": [
      {
         "company": { "name": "Company ABC" },
         "startDate": "2017-06-01T09:00:00Z",
         "endDate": "20179-06-01T09:00:00Z",
         "achievements": [ "Developed App ABC in Swift",
                           "Developed killer app features",
                           "Achieved 100% unit test coverage" ]
      },
      etc etc
   ]
}
 */

struct CVModel: Codable, Equatable {
    let candidateName: String
    let summary: String
    let skills: [String]
    let experience: [ExperienceDetail]
}

struct ExperienceDetail: Codable, Equatable {
    let company: Company
    let jobTitle: String
    let startDate: Date
    let endDate: Date
    let achievements: [String]
}

struct Company: Codable, Equatable {
    let name: String
}
