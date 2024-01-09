//
//  ContentView.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
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

struct DailyView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            Image(systemName: "moon.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35, alignment: .center)
            Text("placeDay")
                .bold()
                .foregroundColor(.white)
            Text("placeDate")
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
