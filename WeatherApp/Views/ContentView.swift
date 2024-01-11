//
//  ContentView.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            ScrollView(showsIndicators: false){
                VStack {
                    HeaderView()
                        .padding(.bottom,25)
                    HourlyView()
                        .padding(.bottom,25)
                    DailyView()
                    
                    Spacer()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(WeatherViewModel())
    }
}
