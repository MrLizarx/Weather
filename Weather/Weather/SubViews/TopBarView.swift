//
//  TopBarView.swift
//  Weather
//
//  Created by Micle on 21.06.2021.
//

import SwiftUI

struct TopBarView: View {
    @ObservedObject var viewModel:WeatherViewModel
    @Binding var creenCover:Bool
    @Binding var isSearchShowed:Bool
    var body: some View {
        HStack{
            Button(action: {
                creenCover.toggle()
            }, label: {
                
                Image(systemName: "location")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .padding(.leading, 10)
                    .padding(.top, 30)
                
              
            })
            Text(viewModel.weatherData.city ?? "unknown place")
                .font(.system(size: 25))
                .foregroundColor(.white)
                .padding(.top, 30)
            
            Spacer()
            
            
            Button(action: {
                
                withAnimation(.spring()){
                    isSearchShowed.toggle()
                }
                
            }, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .padding(.trailing, 10)
                    .padding(.top, 30)
                
            })
            
            
            
        
            
        }
        .frame(maxWidth:.infinity)
        .frame(height: 100)
        .background(Color.blue)
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(viewModel: WeatherViewModel(weatherService: WeatherService()), creenCover: .constant(false), isSearchShowed: .constant(false))
    }
}
