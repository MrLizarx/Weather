//
//  WeatherDetailDailyView.swift
//  Weather
//
//  Created by Micle on 23.06.2021.
//

import SwiftUI

struct WeatherDetailDailyView: View {
    @ObservedObject var viewModel:WeatherViewModel
    var body: some View {
        VStack {
            ForEach(0..<7){ item in
                RowDailyView(maxTemp: viewModel.weatherData.dailyMaxTemp[item], minTemp: viewModel.weatherData.dailyMinTemp[item], iconName: viewModel.weatherData.dailyIcon[item], date: Calendar.current.date(byAdding: .day, value: item, to: Date())!)
            }
        }
    }
}

 struct WeatherDetailDailyView_Previews: PreviewProvider {
    static var previews: some View {
        let VM = WeatherViewModel(weatherService: WeatherService())
        WeatherDetailDailyView(viewModel: VM)
    }
}

struct RowDailyView: View {
    let maxTemp:Int
    let minTemp:Int
    let iconName:String
    let date:Date
    var body: some View {
        HStack{
            Text("\(date.getFormattedDate(format: "EEEE"))")
                .font(.title2)
                .foregroundColor(.black)
                .padding(.leading, 20)
            Spacer()
            
            
            HStack{
                Spacer()
                Text("\(maxTemp)"+"/"+"\(minTemp)")
                    .font(.title2)
                    .foregroundColor(.black)
                
                
                
                
                Image(systemName: iconName.getIconName())
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .padding(.trailing, 25)
                    .padding(.leading, 70)
                
            }
            
            
            
            
        }
        .frame(height:50)
        .frame(maxWidth: .infinity)
    }
}
