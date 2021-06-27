//
//  CityModel.swift
//  Weather
//
//  Created by Micle on 27.06.2021.
//

import Foundation

struct City:Identifiable {
    var id:Int
    var name:String
}

var cityList = [
    City(id: 687700, name:"Zaporizhia"),
    City(id: 706483, name:"Kharkiv"),
    City(id: 709930, name:"Dnipro"),
    City(id: 707471, name:"Ivano-Frankivsk"),
    City(id: 702550, name:"Lviv")
    
    
]
