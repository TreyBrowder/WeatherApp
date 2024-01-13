//
//  DataDataModel.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/12/24.
//

import Foundation

class DayData: ObservableObject, Identifiable {
    var id = UUID()
    var day = "monday"
    var high = "72°F"
    var low = "62°"
}
