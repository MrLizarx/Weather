//
//  WeatherApp.swift
//  Weather
//
//  Created by Micle on 21.06.2021.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            MainView(viewModel: viewModel)
        }
    }
}
