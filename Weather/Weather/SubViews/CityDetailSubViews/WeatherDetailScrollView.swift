//
//  SwiftUIView.swift
//  Weather
//
//  Created by Micle on 22.06.2021.
//

import SwiftUI

struct WeatherDetailScrollView: View {
    
    @ObservedObject var viewModel:WeatherViewModel
    var body: some View {
    
        
            ScrollView(.horizontal, showsIndicators:false) {
                
                HStack(spacing: 0) {
                     
                    
                    ForEach(0..<24) {number in
                        
                        let curentHour = Calendar.current.date(byAdding: .hour, value: number, to: Date())?.getFormattedDate(format: "H a")
                        
                        
                        
                        SubHourView(curTime: curentHour!, temperature: Int(viewModel.weatherData.hourlyTemp[number]), iconName: viewModel.weatherData.hourlyIcon[number])
                           
                    }
                }
            }
        
        
    }
}

struct WeatherDetailScrollView_Previews: PreviewProvider {
    static var previews: some View {
        

        WeatherDetailScrollView(viewModel: WeatherViewModel(weatherService: WeatherService()))
        
        
    }
}

struct SubHourView: View {
    let curTime:String
    let temperature:Int
    let iconName:String
    var body: some View {
        VStack {
            let h = Int(Date().getFormattedDate(format: "H"))
            
            Text("\(curTime)")
                .foregroundColor(.white)
                .font(.system(size: 20))
                
            Image(systemName: iconName.getIconName())
                .foregroundColor(.white)
            
            Text("\(temperature)" + "℃")
                .foregroundColor(.white)
                .font(.system(size: 20))
        }
        .frame(width: 70, height: 70)
        .background(Color.blue)
        .padding(.leading, 0)
        .padding(.trailing, 0)
        
        
        
        
    }
}
