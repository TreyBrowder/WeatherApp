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
            
            
            do {
                let result = try JSONDecoder().decode(APIResponse.self, from: data)
                
                DispatchQueue.main.async {
                    
                    //this will show current data - current temp and conditions
                    let headerVM = HeaderViewModel()
                    headerVM.currentTemp = "\(Int(result.current.temp))°F"
                    headerVM.currentConditions = result.current.weather.first?.main ?? "-"
                    self.headerViewModel = headerVM
                    
                    //this will show hourly data
                    self.hourlyData = result.hourly.compactMap({
                        let data = HourData()
                        data.temp = "\(Int($0.temp))°"
                        data.hour = String.hour(from: $0.dt)
                        return data
                    })
                    
                    //this will show daily data
                    self.dailyData = result.daily.compactMap({
                        let data = DayData()
                        data.day = String.day(from: $0.dt)
                        data.high = "\(Int($0.temp.max))°F"
                        data.low = "\(Int($0.temp.min))°F"
                        return data
                    })
                }
            }
            catch {
                print(error)
            }
            
        }
        task.resume()
    }
}
