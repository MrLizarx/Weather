//
//  JsonReq.swift
//  WatherApp
//
//  Created by Micle on 18.06.2021.
//
import CoreLocation
import Foundation
import Alamofire

//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
//https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}
//https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=minutely,alerts&appid=ce770c3e7991e0909d653dc029160607




private var testCityname = "Zaporizhia"
private let weatherCity_url = "https://api.openweathermap.org/data/2.5/weather?"
private let weatherXY_url = "https://api.openweathermap.org/data/2.5/onecall?"


public  class WeatherService:NSObject {
    
    private let key = "48f4c06e351900dab942dcd4061da30f"
    var weatherData:MyWeatherFormat?
    private var completionHandler:((MyWeatherFormat) -> Void)?
    
    func loadCurretWeatherDataForCity (City:String,  completionHandler: @escaping((MyWeatherFormat) -> Void)) {
        let res = makeDataRequestForCity(City: City)
        weatherData = res
        self.completionHandler = completionHandler
    }
    
    func loadCurretWeatherDataForCoord (lat:Double, lon:Double, completionHandler: @escaping((MyWeatherFormat) -> Void)) {
        let res = makeDataRequestForCoord(lat: lat, lon: lon)
        weatherData = res
        self.completionHandler = completionHandler
    }
    
    
    
    private func makeDataRequestForCity(City:String)->MyWeatherFormat? {
        
        let finalUrl = weatherCity_url+"q="+City+",ua"+"&units=metric"+"&appid="+key
        var res:MyWeatherFormat?
        AF.request(finalUrl).responseDecodable(of: WeatherAPICity.self ) { response in
            switch (response.result) {
            case .success( _):
                do {
                    self.completionHandler?(MyWeatherFormat(weatherAPI: (response.value)!))
                    res = MyWeatherFormat(weatherAPI: (response.value)!)
                    print(response.value)
                }
 
                
            case .failure(_):
                
                print(response.value)
                
            }
        }
        return res
    }

    private func makeDataRequestForCoord(lat:Double, lon:Double)->MyWeatherFormat? {
        
        let finalUrl = weatherXY_url+"lat="+"\(lat)"+"&lon="+"\(lon)"+"&exclude=minutely,alerts"+"&units=metric"+"&appid="+key
        var res:MyWeatherFormat?
        AF.request(finalUrl).responseDecodable(of: WeatherAPICoord.self ) { response in
            switch (response.result) {
            case .success( _):
                do {
                    self.completionHandler?(MyWeatherFormat(weatherAPI: (response.value)!))
                    res = MyWeatherFormat(weatherAPI: response.value!)
                  //  print(response.value?.daily)
                }
 
                
            case .failure(_):
                print(/*response*/)
            }
        }
        return res
    }

}

