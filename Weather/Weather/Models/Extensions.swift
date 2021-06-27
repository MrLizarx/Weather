//
//  DataModel.swift
//  Weather
//
//  Created by Micle on 22.06.2021.
//

import Foundation

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from:self)
    }
}

extension String {
    func getHourString (hour: Int) -> String {
        
        var hourString = ""
        if(hour < 12) {hourString = "\(hour)" + " AM"}
        else {hourString = "\(hour)" + " PM"}
        
        return hourString
    }

    func getIconName() ->String {
        switch self {
        case "Drizzle": return "cloud.drizzle.fill"
        case "Thunderstorm" : return "cloud.bolt.rain.fill"
        case "Rain": return "cloud.rain.fill"
        case "Snow": return "cloud.snow"
        case "Clear": return "sun.max.fill"
        case "Clouds":return "cloud"
        default:
            return "cloud"
        }
       
    }

}







