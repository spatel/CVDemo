//
//  Dates.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation

public enum DateFormatters {
    
    public static func demoDateFormatter(locale: Locale = .current,
                                         timeZone: TimeZone = .current) -> DateFormatter {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = locale
        formatter.timeZone = timeZone
        
        return formatter
    }
    
    public static func monthAndYearFormatter(locale: Locale = .current,
                                             timeZone: TimeZone = .current) -> DateFormatter {
        let formatter = DateFormatter()
        
        formatter.setLocalizedDateFormatFromTemplate("MMM yyyy")
        formatter.locale = locale
        formatter.timeZone = timeZone
        
        return formatter
    }
}


public extension Date {
    
    static func UTC(year: Int? = nil,
                    month: Int? = nil,
                    day: Int? = nil,
                    hour: Int? = nil,
                    minute: Int? = nil,
                    second: Int? = nil,
                    nanosecond: Int? = nil) -> Date? {
        
        var cal = Calendar.gregorianUTC
        let comps = DateComponents(calendar: cal,
                                   timeZone: cal.timeZone,
                                   year: year,
                                   month: month,
                                   day: day,
                                   hour: hour,
                                   minute: minute,
                                   second: second,
                                   nanosecond: nanosecond)
        return cal.date(from: comps)
    }
}

public extension TimeZone {
    static let UTC = TimeZone(abbreviation: "UTC")!
}

internal extension Calendar {
    
    static let gregorian = Calendar(identifier: .gregorian)
    
    static let gregorianUTC: Calendar = {
        var cal = Calendar.gregorian
        cal.timeZone = .UTC
        return cal
    }()
}

