//
//  DailyView.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/9/24.
//

import SwiftUI

struct DailyView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.dailyData) { model in
                DayRowView(model: model)
                    .padding(7)
            }
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
            .preferredColorScheme(.dark)
            .environmentObject(WeatherViewModel())
    }
}
