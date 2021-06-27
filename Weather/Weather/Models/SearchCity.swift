//
//  SearchCityViewModel.swift
//  Weather
//
//  Created by Micle on 27.06.2021.
//

import Foundation

class SearchCity: ObservableObject {
    @Published var query:String = ""
    @Published var searchedCities: [City] = cityList
   
}
