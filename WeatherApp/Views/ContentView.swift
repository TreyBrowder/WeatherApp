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
                
                Spacer()
            }
        }
        
    }
}

struct HeaderView: View {
    
    var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Text(viewModel.headerViewModel.location)
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 36))
            
            Image(systemName: "sunset.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 190, height: 190, alignment: .center)
            
            Text(viewModel.headerViewModel.currentTemp)
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 95))
            
            Text(viewModel.headerViewModel.currentConditions)
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 25))
            
            HStack {
                Text("H:76°")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Text("L:58°")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
