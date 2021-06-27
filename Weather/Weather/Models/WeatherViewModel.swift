//
//  WatherDataModel.swift
//  WatherApp
//
//  Created by Micle on 18.06.2021.
//

import Foundation

//lat = 47.8167
//lon = 35.1833



public class WeatherViewModel:ObservableObject {
    @Published var weatherData:MyWeatherFormat = MyWeatherFormat.empty()
    
    
    private var lat:Double = 34
    private var lon:Double = 40
    public let weatherService:WeatherService
    public init (weatherService:WeatherService){
        self.weatherService = weatherService
    }
    public func refresh() {
        weatherService.loadCurretWeatherDataForCity(City: self.weatherData.city ?? "Zaporizhia") { weather in
            DispatchQueue.main.async { [self] in
                self.weatherData.tempMax = weather.tempMax
                self.weatherData.tempMin = weather.tempMin
                self.weatherData.humidity = weather.humidity
                self.weatherData.wind_speed = weather.wind_speed
                self.weatherData.wind_deg = weather.wind_deg
                self.weatherData.lat = weather.lat
                self.weatherData.lon = weather.lon
                
                print(self.weatherData.tempMax,self.weatherData.tempMin,self.weatherData.wind_speed)
                
                self.weatherService.loadCurretWeatherDataForCoord(lat: self.weatherData.lat, lon: self.weatherData.lon) { weather in
                    DispatchQueue.main.async {
                        
                        self.weatherData.hourlyTemp = weather.hourlyTemp
                        self.weatherData.hourlyIcon = weather.hourlyIcon
                        self.weatherData.dailyMaxTemp = weather.dailyMaxTemp
                        self.weatherData.dailyMinTemp = weather.dailyMinTemp
                        self.weatherData.dailyIcon = weather.dailyIcon
                        
                        print(self.weatherData.tempMax,self.weatherData.dailyIcon,self.weatherData.dailyMaxTemp)
                    }
                }
            }
        }
        
    }
    
    public func refreshFromMap() {
        weatherService.loadCurretWeatherDataForCoord(lat: self.weatherData.lat, lon: self.weatherData.lon) { weather in
            DispatchQueue.main.async {
                
                self.weatherData.city = "lat: "+"\(weather.lat)" + ", lon:"+"\(weather.lon)"
                self.weatherData.hourlyTemp = weather.hourlyTemp
                self.weatherData.hourlyIcon = weather.hourlyIcon
                self.weatherData.dailyMaxTemp = weather.dailyMaxTemp
                self.weatherData.dailyMinTemp = weather.dailyMinTemp
                self.weatherData.dailyIcon = weather.dailyIcon
                
                print(self.weatherData.tempMax,self.weatherData.dailyIcon,self.weatherData.dailyMaxTemp)
            }
        }
    }
}



    
    


