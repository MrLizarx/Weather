//
//  CityDetailHeadView.swift
//  WatherApp
//
//  Created by Micle on 21.06.2021.
//

import SwiftUI

struct WeatherDetailHeadView: View {
    @ObservedObject  var viewModel:WeatherViewModel
    private let date = Date().getFormattedDate(format: "d MMM, HH:mm")
    var body: some View {
        
            VStack(){
                Text("\(date)")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                HStack {
                    Image(systemName: viewModel.weatherData.dailyIcon[0].getIconName())
                        .foregroundColor(.white)
                        .font(.system(size: 100))
                        .padding(.leading, 10)
                    Spacer()
                    SubParametrsView(viewModel: viewModel)
                        .padding(.trailing, 50)
                }
                    
                
            }
            .frame(maxWidth:.infinity)
            .background(Color.blue)
        }
        
    
}

struct WeatherDetailHeadView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailHeadView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}

private struct SubParametrsView: View {
    @ObservedObject var viewModel:WeatherViewModel
    var body: some View {
       
    
        
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "thermometer")
                    .foregroundColor(.white)
                Text("\(viewModel.weatherData.tempMax)"+"℃ / "+"\(viewModel.weatherData.tempMin)" + "℃")
                    .foregroundColor(.white)
            }.padding(.bottom, 5)
            .padding(.top, 25)
            
            HStack
            {
                Image(systemName: "drop")
                    .foregroundColor(.white)
                Text("\(viewModel.weatherData.humidity)"+"%")
                    .foregroundColor(.white)
                
            }.padding(.bottom, 5)
            
            HStack
            {
                Image(systemName: "wind")
                    .foregroundColor(.white)
                Text("\(viewModel.weatherData.wind_speed)"+" m/s")
                    .foregroundColor(.white)
            }
            
        }
    }
}
