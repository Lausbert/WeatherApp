//
//  File.swift
//  WeatherApp
//
//  Created by Stephan Lerner on 19.10.16.
//  Copyright © 2016 Stephan. All rights reserved.
//

import Foundation
import UIKit

let WEATHER_URL: String = "http://api.openweathermap.org/data/2.5/weather?q="
let USER_LOCATION: String = "Sydney"
let USER_KEY: String = "&APPID=7be770c973bfdadcdd0e2f0d999f689c"
let UNITS_METRIC: String = "&units=metric"
let CLOUDS_RAIN_SNOW_COLOR = UIColor(red: 20/255, green: 23/255, blue: 87/255, alpha: 1)
let SUN_COLOR = UIColor(red: 198/255, green: 66/255, blue: 129/255, alpha: 1)
let THUNDER_COLOR = UIColor(red: 72/255, green: 75/255, blue: 167/255, alpha: 1)

typealias DownloadComplete = () -> ()
