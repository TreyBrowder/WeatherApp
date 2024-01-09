//
//  DayRowView.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/9/24.
//

import SwiftUI

struct DayRowView: View {
    
    var model: DayData
    
    var body: some View {
        
            HStack{
                
                Text(model.day)
                    .bold()
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack{
                    
                    Text("H: \(model.high)")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text("L: \(model.low)")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                }
            }
    }
}

struct DayRowView_Previews: PreviewProvider {
    static var previews: some View {
        DayRowView(model: DayData())
            .preferredColorScheme(.dark)
    }
}
