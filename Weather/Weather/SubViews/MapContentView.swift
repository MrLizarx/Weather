//
//  MapContentView.swift
//  Weather
//
//  Created by Micle on 25.06.2021.
//

import SwiftUI
import MapKit
struct MapContentView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel:WeatherViewModel
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var location = MKPointAnnotation()
    var body: some View {
        
        ZStack{
            
            MapView(centerCoordinate: $centerCoordinate,annotation: location)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32, alignment: .center)
            
            
            HStack{
                Spacer()
                VStack{
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        self.location = newLocation
                        
                        viewModel.weatherData.lat = location.coordinate.latitude
                        viewModel.weatherData.lon = location.coordinate.longitude
                        viewModel.refreshFromMap()
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Image(systemName: "thermometer")
                            .padding()
                            .background(Color.black.opacity(0.60))
                            .font(.title)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .padding(.trailing)
                    })
                    
                  /*  Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        self.location = newLocation
                    }, label: {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black.opacity(0.60))
                            .font(.title)
                            .foregroundColor(.white)
                                .clipShape(Circle())
                            .padding(.trailing)
                    })*/
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "multiply")
                            .padding()
                            .background(Color.black.opacity(0.60))
                            .font(.title)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .padding(.trailing)
                            .padding(.bottom, 20)
                        
                        
                    })
                }
                
                
                
            }
            
        }
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
