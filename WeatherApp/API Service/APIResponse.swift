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
    let hourly: String
    let daily: [DayModel]
}

struct Current: Codable {
    let temp: Double
    let weather: [Info]
}

//hourly
struct HourModel: Codable {
    let dt: Float
    let temp: Double
    let weather: [Info]
}

struct Info: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


//daily
struct DayModel: Codable {
    let dt: Float
    let temp: Temp
}

struct Temp: Codable {
    let min: Double
    let max: Double
}


