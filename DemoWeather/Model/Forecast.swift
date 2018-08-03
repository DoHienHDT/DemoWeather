//
//  Forecast.swift
//  DemoWeather
//
//  Created by dohien on 03/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import Foundation

class Forecast {
    
    var name: String
    var temp_c: Double
    var maxtemp_c: Double
    
    init(dictionary: DICT) {
        let location = dictionary["location"] as? DICT ?? [:]
        name = location["name"] as? String ?? "-1"
        let current = dictionary["current"] as? DICT ?? [:]
        temp_c = current["temp_c"] as? Double ?? -1
        let forecast = dictionary["forecast"] as? DICT ?? [:]
        let forecastday = forecast["forecastday"] as? [DICT] ?? []
        let day = forecastday[0]["day"] as? DICT ?? [:]
        maxtemp_c = day["maxtemp_c"] as? Double ?? -1
    }
}
