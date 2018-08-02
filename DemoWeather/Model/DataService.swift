//
//  DataService.swift
//  DemoWeather
//
//  Created by dohien on 02/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import Foundation
typealias DICT = Dictionary<AnyHashable,Any>

class DataService {
    static let shared: DataService = DataService()
    var weather: Weather?
    
    func getDataFromAPI() {
        guard let url = URL(string: "https://api.apixu.com/v1/current.json?key=a9a98a4dc3f047d3a9265355180108&q=Paris") else {return}
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
}
