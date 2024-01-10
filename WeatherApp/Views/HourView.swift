//
//  HourView.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/8/24.
//

import SwiftUI

struct HourView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var model: HourData
    
    var body: some View {
        VStack {
            //image, temp, hour
            Image(systemName: "sun.max.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35, alignment: .center)
            Text(model.temp)
                .bold()
                .foregroundColor(.white)
            Text(model.hour)
                .foregroundColor(.white)
        }
    }
}

struct HourView_Previews: PreviewProvider {
    static var previews: some View {
        HourView(model: HourData())
            .environmentObject(WeatherViewModel())
    }
}
