//
//  CityDetailView.swift
//  WatherApp
//
//  Created by Micle on 18.06.2021.
//

import SwiftUI

struct WeatherDetailView: View {

    @ObservedObject var viewModel: WeatherViewModel
   
    
    var body: some View {
        VStack (spacing:0) {
            WeatherDetailHeadView(viewModel: viewModel)
                .frame(height:250)
                .padding(.bottom, 0)
                .background(Color.blue)
            
            WeatherDetailScrollView( viewModel: viewModel)
                .padding(.top, 0)
            ScrollView (showsIndicators:false) {
                WeatherDetailDailyView(viewModel: viewModel)
            }
            Spacer()
        }
       
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
         let arr1:[Int] = [25,25,25,25,25,25,25,25,25,25,25,2,52,52,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,]
         let arr2:[String] = ["cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun","cloud.sun"]
        
        WeatherDetailView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}

