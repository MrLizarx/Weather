//
//  Weather.swift
//  Weather
//
//  Created by Micle on 22.06.2021.
//

import Foundation

struct MyWeatherFormat:Codable {
    var city:String?
    var lat:Double
    var lon:Double
    var tempMax:Int
    var tempMin:Int
    var humidity:Int
    var wind_speed:Int
    var wind_deg:Int
    
    var dailyMaxTemp:[Int]=Array(repeating: 0, count: 16)
    var dailyMinTemp:[Int]=Array(repeating: 0, count: 16)
    var dailyIcon:[String]=Array(repeating: "cloud.sun", count: 16)
    
    var hourlyTemp:[Int] = Array(repeating: 0, count: 50)
    var hourlyIcon:[String] = Array(repeating: "cloud.sun", count: 50)
    
    
    
    


    init(weatherAPI:WeatherAPICity) {
        self.city = weatherAPI.name
        self.lat = weatherAPI.coord.lat
        self.lon = weatherAPI.coord.lon
        self.tempMax = Int(weatherAPI.main.temp_max)
        self.tempMin = Int(weatherAPI.main.temp_min)
        self.humidity = weatherAPI.main.humidity
        self.wind_speed = weatherAPI.wind.speed
        self.wind_deg = weatherAPI.wind.deg
      
    }
    
    
    init(weatherAPI:WeatherAPICoord) {
        
        self.city = "coordResponse"
        self.lat = weatherAPI.lat
        self.lon = weatherAPI.lon
        let tmp=weatherAPI.daily[0]
        self.tempMax = Int(tmp.temp.max)
        self.tempMin = Int(tmp.temp.min)
        self.humidity = weatherAPI.current.humidity
        self.wind_speed = Int(weatherAPI.current.wind_speed)
        self.wind_deg = weatherAPI.current.wind_deg
        
        let Cnt=weatherAPI.daily.count
        for i in 0..<min(Cnt,dailyMaxTemp.count)
        {
            self.dailyMaxTemp[i] = Int(weatherAPI.daily[i].temp.max)
            self.dailyMinTemp[i] = Int(weatherAPI.daily[i].temp.min)
            self.dailyIcon[i] = weatherAPI.daily[i].weather[0].main
        }
        
        let cnt=weatherAPI.hourly.count
        for i in 0..<min(cnt,hourlyTemp.count)
        {
            self.hourlyTemp[i] = Int(weatherAPI.hourly[i].temp)
            self.hourlyIcon[i] = weatherAPI.hourly[i].weather[0].main
        }
        
       // self.dailyWeather = weatherAPI.daily
       // self.hourlyWeather = weatherAPI.hourly
    }
        
    static func empty() -> MyWeatherFormat
    {
        return MyWeatherFormat(city: "Zaporizhia", temp_max: 11, temp_min: 10, humidity: 10, wind_speed: 4, wind_deg: 43)
    }
    
    
    init(city:String, temp_max:Int, temp_min:Int, humidity:Int, wind_speed:Int, wind_deg:Int) {
        self.city = city
        self.lat = 47.8167
        self.lon = 35.1833
        self.tempMax = temp_max
        self.tempMin = temp_min
        self.humidity = humidity
        self.wind_speed = wind_speed
        self.wind_deg = wind_deg
       
    }
    
}



