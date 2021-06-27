//
//  ContentView.swift
//  Weather
//
//  Created by Micle on 21.06.2021.
//

import SwiftUI
import MapKit
struct MainView: View {
    
    @StateObject var viewModel:WeatherViewModel
    @State private var screenCover:Bool = false
    @State private var isSearchShowded = false
    @State private var  cityName = "Zaporizhia"
    var body: some View {
        
        
        ZStack {
            
            if isSearchShowded {
                SearchView(viewModel:viewModel,isShowedSearch: $isSearchShowded)
            }
            
            VStack(spacing:0) {
                TopBarView(viewModel: viewModel, creenCover: $screenCover,isSearchShowed: $isSearchShowded)
                
                WeatherDetailView(viewModel: viewModel)
                    .background(Color.white)
                
            }
            .fullScreenCover(isPresented: $screenCover){
                MapContentView(viewModel: viewModel)
            }
            .offset(x: isSearchShowded ? -500:0, y: 0)
            .ignoresSafeArea(edges: .all)
        }
        .onAppear(perform: viewModel.refresh)
    }
        
        
        
   
    
    
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
