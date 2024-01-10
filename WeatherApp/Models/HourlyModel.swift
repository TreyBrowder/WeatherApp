//
//  HourlyModel.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/8/24.
//

import Foundation
import SwiftUI

class HourData: ObservableObject {
    var temp = "55°"
    var hour = "1PM"
    var imageURL = ""
}

class DayData: ObservableObject {
    var day = "monday"
    var high = "72°F"
    var low = "62°"
}
