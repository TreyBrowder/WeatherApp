//
//  APIResponse.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/11/24.
//

import Foundation

struct APIResponse: Codable {
    let lat: Float
    let lon: Float
    let current: Current
    
    //array to hold keys/value for hourly weather data
    let hourly: [HourResponse]
    
    //array to hold key/value for daily weather
    let daily: [DayResponse]
}

struct Current: Codable {
    let temp: Double
    let weather: [Info]
}

//hourly
struct HourResponse: Codable {
    let dt: Float
    let temp: Double
    let weather: [Info]
}

//struct to hold current weather info
struct Info: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


//daily
struct DayResponse: Codable {
    let dt: Float
    let temp: Temp
}

struct Temp: Codable {
    let min: Double
    let max: Double
}


