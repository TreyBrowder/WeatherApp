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
            ForEach(1...7, id: \.self) { num in
                DayRowView(model: DayData())
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
