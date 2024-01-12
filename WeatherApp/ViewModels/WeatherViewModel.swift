//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/4/24.
//

import Foundation
import SwiftUI
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var headerViewModel = HeaderViewModel()
    @Published var hourlyData: [HourData] = []
    @Published var dailyData: [DayData] = []
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        //get data and location info
        LocationManager.shared.getLocation { location in
            LocationManager.shared.resolveName(For: CLLocation(latitude: location.lat,
                                                              longitude: location.lon)
            ) { name in
                DispatchQueue.main.async {
                    self.headerViewModel.location = name ?? "Current"
                }
            }
            
            let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(location.lat)&lon=\(location.lon)&exclude=minutely&units=imperial&appid=6f3ff9c55638690ab0d153ebe50ba7e7"
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
                        self.headerViewModel.currentTemp = "\(Int(result.current.temp))°F"
                        self.headerViewModel.currentConditions = result.current.weather.first?.main ?? "-"
                        self.headerViewModel.iconURLString = String.iconUrlString(for: result.current.weather.first?.icon ?? "-")
                        
                        //display the current days high and low if possible based on API
                        
                        
                        //this will show hourly data
                        self.hourlyData = result.hourly.compactMap({
                            let data = HourData()
                            data.temp = "\(Int($0.temp))°"
                            data.hour = String.hour(from: $0.dt)
                            data.imageURL = String.iconUrlString(for: $0.weather.first?.icon ?? "-")
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
}
