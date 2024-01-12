//
//  HeaderView.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/7/24.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
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
                Text("High: -°F")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Text("Low: -°F")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .preferredColorScheme(.dark)
            .environmentObject(WeatherViewModel())
            
    }
}

