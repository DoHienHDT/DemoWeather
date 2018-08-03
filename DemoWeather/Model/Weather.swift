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
    var country: String
    var wind_mph: Double
    var date_epoch: TimeInterval
    var maxtemp_c: Double
    var text: String
    var iconDay: String
    init?(dictionary: DICT) {
        guard let location = dictionary["location"] as? DICT  else { return nil }
        guard let name = location["name"] as? String else { return nil }
        guard let country = location["country"] as? String else {return nil}
        guard let current = dictionary["current"] as? DICT else { return nil }
        guard let temp_c = current["temp_c"] as? Double else { return nil}
        guard let wind_mph = current["wind_mph"] as? Double else { return nil }
        guard let condition = current["condition"] as? DICT else { return nil }
        guard let icon = condition["icon"] as? String else { return nil }
        guard let forecast = dictionary["forecast"] as? DICT else { return nil }
        guard let forecastday = forecast["forecastday"] as? [DICT] else { return nil }
        let zero = forecastday[0]
        guard let date_epoch = zero["date_epoch"] as? TimeInterval else { return nil }
        guard let day = zero["day"] as? DICT else { return nil }
        guard let maxtemp_c = day["maxtemp_c"] as? Double else { return nil }
        guard let conditionDay = day["condition"] as? DICT else { return nil }
        guard let text = conditionDay["text"] as? String else { return nil }
        guard let iconDay = conditionDay["icon"] as? String else { return nil }
        
        self.name = name
        self.icon = "http:" + icon
        self.temp_c = temp_c
        self.country = country
        self.wind_mph = wind_mph
        self.date_epoch = date_epoch
        self.maxtemp_c = maxtemp_c
        self.text = text
        self.iconDay = "http:" + iconDay
    }
}
