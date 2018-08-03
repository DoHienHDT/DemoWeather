//
//  DataService.swift
//  DemoWeather
//
//  Created by dohien on 02/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit
typealias DICT = Dictionary<AnyHashable,Any>

class DataService {
    static let shared: DataService = DataService()
    var weather: Weather?
    
    func getDataFromAPI() {
        guard let url = URL(string: "https://api.apixu.com/v1/forecast.json?key=a9a98a4dc3f047d3a9265355180108&q=Paris") else {return}
        let task = URLSession.shared.dataTask(with: url){ (data, _, error) in
            if error != nil {
                print(error!)
            } else {
                if let urlContent = data {
                    print(urlContent)
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: .mutableContainers)
                        if let dataWeather = jsonResult as? DICT {
                            self.weather = Weather(dictionary: dataWeather)
                        }
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: Notification.Name.init("update"), object: nil)
                        }
                    } catch {
                        print("Json processing Failed")
                    }
                }
            }
        }
        task.resume()
}
    func getDataFromAPIByClosure(completion: @escaping (Forecast) -> Void) {
        guard let url = URL(string: "https://api.apixu.com/v1/forecast.json?key=a9a98a4dc3f047d3a9265355180108&q=Paris") else {return}
        URLSession.shared.dataTask(with: url){ (data, _, error) in
            if error != nil {
                print(error!)
            } else {
                if let urlContent = data {
                    print(urlContent)
                    do {
                        guard let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: .mutableContainers) as? DICT else {return}
                        let forecastDay = Forecast(dictionary: jsonResult)
                        DispatchQueue.main.async {
                            completion(forecastDay)
                        }
                    } catch {
                        print("Json processing Failed")
                    }
                }
            }
        }.resume()
    }
    
}

