//
//  File.swift
//  WeatherApp
//
//  Created by Stephan Lerner on 19.10.16.
//  Copyright © 2016 Stephan. All rights reserved.
//

import Foundation

let WEATHER_URL: String = "http://api.openweathermap.org/data/2.5/weather?q="
let USER_LOCATION: String = "Hamburg,de"
let USER_KEY: String = "&APPID=7be770c973bfdadcdd0e2f0d999f689c"

typealias DownloadComplete = () -> ()
