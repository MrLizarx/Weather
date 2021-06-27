//
//  SearchView.swift
//  Weather
//
//  Created by Micle on 27.06.2021.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel:WeatherViewModel
    @StateObject private var searchData = SearchCity()
    @Binding var isShowedSearch:Bool
    var body: some View {
        VStack{
            CustomSearchBar(searchData: searchData, viewModel: viewModel, isShowedSearch: $isShowedSearch)
            
            Spacer()
                
        }
        
        }
    }


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: WeatherViewModel(weatherService: WeatherService()),isShowedSearch: .constant(true))
    }
}
