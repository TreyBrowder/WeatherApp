//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/4/24.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    var headerViewModel = HeaderViewModel()
    var hourlyModel = HourlyModel()
}
