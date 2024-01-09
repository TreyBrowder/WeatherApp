//
//  HourlyModel.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/8/24.
//

import Foundation
import SwiftUI

class HourlyModel: ObservableObject {
    var data: [HourData] = []
    
}

class HourData: ObservableObject {
    var temp = "55°"
    var hour = "1PM"
    var imageURL = ""
}
