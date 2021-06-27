//
//  CustomSearchBar.swift
//  Weather
//
//  Created by Micle on 27.06.2021.
//

import SwiftUI


struct CustomSearchBar: View {
    @ObservedObject var searchData:SearchCity
    @ObservedObject var viewModel:WeatherViewModel
    @State private var isSearching = false
    @Binding var isShowedSearch:Bool
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 10)
                    .font(.title2)
                    .foregroundColor(Color.black.opacity(0.7))
                TextField("Search", text:$searchData.query)
                    .onTapGesture {
                        isSearching = true
                    }
                
                if isSearching {
                    Button(action: {
                        searchData.query = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    })
                    
                    
                }
                
                
            }
            .frame(height:40)
            .background(Color(.systemGray4))
            .cornerRadius(6)
            
            
            
            .padding(.vertical, 10)
            .padding(.horizontal)
            
            if !searchData.searchedCities.isEmpty {
                ScrollView(.vertical, showsIndicators:false) {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(searchData.searchedCities.filter({"\($0)".contains(searchData.query) || searchData.query.isEmpty}), id: \.id) { city in
                            VStack(alignment:.leading, spacing:6) {
                                
                                
                                HStack {
                                    Text(city.name)
                                }
                                .padding(.top,10)
                                .padding(.bottom, 10)
                                .onTapGesture {
                                    viewModel.weatherData.city = city.name
                                    viewModel.refresh()
                                    withAnimation(.spring()) {
                                        isShowedSearch.toggle()
                                    }
                                }
                            
                                Divider()
                            }
                            .padding(.horizontal)
                        }
                  
                    }
                    .padding(.top)
                }
                
                .foregroundColor(.gray)
                
            }
            
        }
        .padding()
        
    }
}


