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
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        //get data and location info
        
        let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=minutely&units=imperial&appid=6f3ff9c55638690ab0d153ebe50ba7e7"
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            
        }
        task.resume()
    }
}
