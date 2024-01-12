//
//  HourlyView.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/8/24.
//

import SwiftUI

struct HourlyView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.hourlyData) {model in
                    HourView(model: model)
                }
                .padding(.horizontal,10)
            }
        }
    }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView()
            .preferredColorScheme(.dark)
            .environmentObject(WeatherViewModel())
    }
}
