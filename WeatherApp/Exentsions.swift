//
//  Exentsions.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/12/24.
//

import Foundation

extension DateFormatter {
    static let hourFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "ha"
        return formatter
    }()
    
    static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "EEEE"
        return formatter
    }()
}

extension String {
    //dt - Day/time function for hour
    static func hour(from dt: Float) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        return DateFormatter.hourFormatter.string(from: date)
    }
    
    //dt - Day/time function for hour
    static func day(from dt: Float) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        return DateFormatter.dayFormatter.string(from: date)
    }
    
    static func iconUrlString(for iconCode: String) -> String {
        return "https://openweathermap.org/img/wn/\(iconCode)@4x.png"
    }
    
}


