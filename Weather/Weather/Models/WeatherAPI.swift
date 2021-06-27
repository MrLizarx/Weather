//
//  JsonCityModel.swift
//  Weather
//
//  Created by Micle on 22.06.2021.
//

import Foundation

 

struct WeatherAPICity:Decodable {
    let coord:coord
    struct coord:Decodable {
        let lon:Double
        let lat:Double
    }
    
    let weather:[weather]
    struct weather:Decodable {
        let id:Int
        let main:String
        let description:String
        let icon:String
    }
    
    let base:String
    
    let main:main
    struct main:Decodable {
        let temp:Double
        let feels_like:Double
        let temp_min:Double
        let temp_max:Double
        let pressure:Int
        let humidity:Int
        
    
    }
    
    let visibility:Int
    
    let wind:wind
    
    struct wind:Decodable {
        let speed:Int
        let deg:Int
    }
    
    let clouds:clouds
    struct clouds:Decodable {
        let all:Int
    }
    
    let dt:Int
    
    let sys:sys
    struct sys:Decodable {
        let type:Int
        let id:Int
        let country:String
        let sunrise:Int?
        let sunset:Int?
    }
    
    let timezone:Int
    let id:Int
    let name:String
    let cod:Int
    
}




struct WeatherAPICoord:Decodable {
    
    let lat:Double
    let lon:Double
    let timezone:String
    let timezone_offset:Int
    let current:current
    
    struct current:Decodable {
        let dt:Int
        let sunrise:Int?
        let sunset:Int?
        let temp:Double
        let feels_like:Double
        let pressure:Int
        let humidity:Int
        let dew_point:Double
        let uvi:Double
        let clouds:Int
        let visibility:Int
        let wind_speed:Double
        let wind_deg:Int
        let wind_gust:Double?
        let weather:[weather]
        
        struct weather:Decodable {
            let id:Int
            let main:String
            let description:String
            let icon:String
        }
    }
    let hourly:[hourlyWeather]
    let daily:[dailyWeather]
   
}

struct hourlyWeather:Decodable {
    let dt:Int
    let temp:Double
    let feels_like:Double
    let pressure:Int
    let humidity:Int
    let dew_point:Double
    let uvi:Double
    let clouds:Int
    let visibility:Int
    let wind_speed:Double
    let wind_deg:Int
    let wind_gust:Double?
    let weather:[weather]
    struct weather:Decodable {
        let id:Int
        let main:String
        let description:String
        let icon:String
    }
    
    }




struct dailyWeather:Decodable {
    let dt:Int
    let sunrise:Int?
    let sunset:Int?
    let moonrise:Int
    let moonset:Int
    let moon_phase:Double
    let temp:temp
    struct temp:Decodable {
        let day:Double
        let min:Double
        let max:Double
        let night:Double
        let eve:Double
        let morn:Double
    }
    struct feels_like:Decodable {
        let day:Double
        let night:Double
        let eve:Double
        let morn:Double
    }
    
    let pressure:Int
    let humidity:Int
    let dew_point:Double
    let wind_speed:Double
    let wind_deg:Int
    let wind_gust:Double?
    
    let weather:[weather]
    struct weather:Decodable {
        let id:Int
        let main:String
        let description:String
        let icon:String
    }
    
    let clouds:Int
    let pop:Double
    let uvi:Double
}






