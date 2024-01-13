//
//  HeaderViewModel.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/4/24.
//

import Foundation
import SwiftUI

class HeaderViewModel: ObservableObject {
    var location: String = "Columbus, OH"
    var currentTemp: String = "68°"
    var currentConditions: String = "Clear"
    var iconURLString: String = "https://www.apple.com"
}
