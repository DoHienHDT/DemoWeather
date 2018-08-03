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
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var wind_mphLabel: UILabel!
    @IBOutlet weak var maxtemp_cLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var photoImageIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        urlS
        // Do any additional setup after loading the view, typically from a nib.
//        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: Notification.Name.init("update"), object: nil)
//        DataService.shared.getDataFromAPI()
        DataService.shared.getDataFromAPIByClosure { [unowned self] (forecastDay) in
            self.nameCityLabel.text = forecastDay.name
            self.temp_cLabel.text = String(forecastDay.temp_c)
            self.maxtemp_cLabel.text = String(forecastDay.maxtemp_c)
        }
    }
//    @objc func updateUI() {
//        if let weather = DataService.shared.weather {
//            nameCityLabel.text = weather.name
//            temp_cLabel.text = String(weather.temp_c)
//            countryLabel.text = weather.country
//            wind_mphLabel.text = String(weather.wind_mph)
//            maxtemp_cLabel.text = String(weather.maxtemp_c)
//            textLabel.text = weather.text
//            photoImage.imageUrlString(urlString: weather.icon)
//            photoImageIcon.imageUrlString(urlString: weather.iconDay)
//        }
//    }
    
//    func imageUrlString( with urlString: String) {
//        guard let url = URL(string: urlString) else {return}
//        DispatchQueue.global().async {
//            if let data = try?  Data(contentsOf: url) {
//                DispatchQueue.main.async {
//                    let image = UIImage(data: data)
//                    self.photoImage.image = image
//                }
//            }
//        }
//    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //        dispatchWorkItem?.cancel()
        // Dispose of any resources that can be recreated.
    }
    
}

