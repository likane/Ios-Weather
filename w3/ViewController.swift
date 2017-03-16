//
//  ViewController.swift
//  w3
//
//  Created by Louis Kane on 7/20/16.
//  Copyright © 2016 Louis Kane. All rights reserved.
//

import UIKit
import ForecastIO
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate {



    
    // labels
    
    @IBOutlet var cityLabel: UILabel!
    
    @IBOutlet var tempratureLabel: UILabel!
    
    @IBOutlet var rainLabel: UILabel!
    
    @IBOutlet var windLabel: UILabel!
    
    @IBOutlet var humidityLabel: UILabel!
    
    @IBOutlet var backgroundColor: UIImageView!
    
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // SPINNING THINKING WHEEL
        
        // USER GPS IN LAT/LON
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Check if the user allowed authorization
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse)
        {
            print(locationManager.location)
            
        } else {
            print("location not authorized")
        }
        
       // API - API TO LAT/LON COORDINATES
        let client = APIClient(apiKey: "8f9e969b5c09dcc6a6d55831506b430d")
        
        if let myLatitude = locationManager.location?.coordinate.latitude {
            print(myLatitude)
        } else {
            print("error getting lattitude")
        }
        if let myLongitude = locationManager.location?.coordinate.longitude {
            print(myLongitude)
        } else {
            print ("error getting longitude")
        }
        
        
        client.units = .Auto
        
        client.getForecast(latitude: myLatitude, longitude: myLongitude) { (currentForcast, error) -> Void in
            if let currentTemperature = currentForcast!.currently?.temperature {
                self.tempratureLabel.text = String(currentTemperature)
                
                let backgroundTemp = currentForcast!.currently?.temperature
                
                
                
                //update background image per temp
                if backgroundTemp <= 9  {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-GREY.png")
                    
                } else if backgroundTemp >= 10 && backgroundTemp <= 19 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-DARKPURP.png")
                    
                } else if backgroundTemp >= 20 && backgroundTemp <= 29 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-DARKBLUE.png")
                    
                } else if backgroundTemp >= 30 && backgroundTemp <= 39 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-DGREEN.png")
                    
                } else if backgroundTemp >= 40 && backgroundTemp <= 49 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-MIDPURP.png")
                    
                } else if backgroundTemp >= 50 && backgroundTemp <= 59 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-MIDBLUE.png")
                    
                } else if backgroundTemp >= 60 && backgroundTemp <= 69 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-LIGHTPURP.png")
                    
                } else if backgroundTemp >= 70 && backgroundTemp <= 75 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-LIGHTBLUE.png")
                    
                } else if backgroundTemp >= 76 && backgroundTemp <= 78 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-LGREEN.png")
                    
                } else if backgroundTemp >= 79 && backgroundTemp <= 81 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6_YELLOW.png")
                    
                } else if backgroundTemp >= 82  && backgroundTemp <= 87 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6_ORANGE.png")
                    
                } else if backgroundTemp >= 88  && backgroundTemp <= 98 {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-LIGHTRED.png")
                    
                } else {
                    
                    self.backgroundColor.image = UIImage(named: "Gradient1_Iphone6-DARKRED.png")
                }

                
            } else {
                print("error")
            
            

            }
    
        
        
        //update minor labels
        if let currentRain = currentForcast!.currently?.precipProbability {
        
        self.rainLabel.text = String(currentRain)
            }
        
        if let currentHumidity = currentForcast!.currently?.humidity {
        
        self.humidityLabel.text = String(currentHumidity)
            }
        
        if let currentWind = currentForcast!.currently?.windSpeed {
        
        self.windLabel.text = String(currentWind)
            }
        
            //update cityLabel
           /* var location = CLLocation(latitude: myLatitude, longitude: myLongitude) //changed!!!
            print(location)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                print(location)
                
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                
                if placemarks!.count > 0 {
                    let pm = placemarks![0] 
                    self.cityLabel.text = "\(pm.locality)"
                }
                else {
                    print("Problem with the data received from geocoder")
                }
            })*/
        
        // Do any additional setup after loading the view, typically
    }
        
        

       
        

        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
}
    

};