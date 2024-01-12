//
//  HourlyModel.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/8/24.
//

import Foundation
import SwiftUI

class HourData: ObservableObject, Identifiable {
    var id = UUID()
    var temp = "55°"
    var hour = "1PM"
    var imageURL = "https://www.apple.com"
}
