//
//  Weather.swift
//  DemoWeather
//
//  Created by dohien on 02/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import Foundation

class Weather {
    var name: String
    var temp_c: Double
    var icon: String
    
    init?(dictionary: DICT) {
        guard let location = dictionary["location"] as? DICT  else { return nil }
        guard let name = location["name"] as? String else { return nil }
        guard let current = dictionary["current"] as? DICT else { return nil }
        guard let temp_c = current["temp_c"] as? Double else { return nil}
        guard let condition = current["condition"] as? DICT else { return nil }
        guard let icon = condition["icon"] as? String else { return nil }
        self.name = name
        self.icon = icon
        self.temp_c = temp_c
    }
}
