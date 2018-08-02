//
//  ViewController.swift
//  DemoWeather
//
//  Created by dohien on 01/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var temp_cLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        urlString()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: Notification.Name.init("update"), object: nil)
        DataService.shared.getDataFromAPI()
    }
    @objc func updateUI() {
        if let weather = DataService.shared.weather {
            nameCityLabel.text = weather.name
            temp_cLabel.text = String(weather.temp_c)
        }
    }
    func urlString() {
//        let urlString = URL(string:"https://api.apixu.com/v1/current.json?key=a9a98a4dc3f047d3a9265355180108&q=Paris")
//        if let usableUrl = urlString {
//            let request = URLRequest(url: usableUrl)
//            let task = URLSession.shared.dataTask(with: request, completionHandler: {
//                (data, response, error) in
//                if let data = data {
//                    if let stringData = String(data: data, encoding: String.Encoding.utf8) {
//                        print(stringData)
//                    }
//                }
//                //                if (error != nil) {
//                //                    print(error)
//                //                }
//            })
//            task.resume()
//        }
//    }
    //        let urlString =  "https://api.apixu.com/v1/current.json?key=a9a98a4dc3f047d3a9265355180108&q=Paris"
    //        let url = URL(string: urlString)
    //        DispatchQueue.global().async {
    //            let urlData = NSData(contentsOf: url!)
    //            DispatchQueue.main.async {
    //                let task = URLSession.shared.dataTask(with: url!)
    //                print(task)
    //            }
    
//            let url = URL(string: "https://api.apixu.com/v1/current.json?key=a9a98a4dc3f047d3a9265355180108&q=Paris")
//            let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
//                if error != nil {
//                    print(error!)
//                }else {
//                    if let urlContent = data {
//                        do {
//                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//                            print(jsonResult)
//
//                        } catch {
//                            print("Json processing Failed")
//                        }
//                    }
//                }
//            }
//            task.resume()
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
