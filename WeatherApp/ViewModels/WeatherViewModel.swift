//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/4/24.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var headerViewModel = HeaderViewModel()
    @Published var hourlyData: [HourData] = []
    @Published var dailyData: [DayData] = []
    
    func fetchData(){
        //get data and location info
    }
}
