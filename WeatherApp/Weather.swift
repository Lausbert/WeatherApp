//
//  Weather.swift
//  WeatherApp
//
//  Created by Stephan Lerner on 19.10.16.
//  Copyright © 2016 Stephan. All rights reserved.
//

import Foundation

class Weather {
    
    private var _backgroundStyle: String!
    private var _weekDay: String!
    private var _weatherType: String!
    private var _weatherLocation: String!
    private var _currentTemperature: String!
    private var _minimumTemperature: String!
    private var _maximumTemperature: String!
    private var _humidity: String!
    private var _windSpeed: String!
    private var _windDirection: String!
    
    var backgroundStyle: String {
        if _backgroundStyle == nil {
            _backgroundStyle = "default"
        }
        return _backgroundStyle
    }
    
    var weekDay: String {
        if _weekDay == nil {
            _weekDay = ""
        }
        return _weekDay
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var weatherLocatiom: String {
        if _weatherLocation == nil {
            _weatherLocation = ""
        }
        return _weatherLocation
    }
    
    var currentTemperature: String {
        if _currentTemperature == nil {
            _currentTemperature = ""
        }
        return _currentTemperature
    }
    
    var minimumTemperature: String {
        if _minimumTemperature == nil {
            _minimumTemperature = ""
        }
        return _minimumTemperature
    }
    
    var maximumTemperature: String {
        if _maximumTemperature == nil {
            _maximumTemperature = ""
        }
        return _maximumTemperature
    }
    
    var humidity: String {
        if _humidity == nil {
            _humidity = ""
        }
        return _humidity
    }
    
    var windSpeed: String {
        if _windSpeed == nil {
            _windSpeed = ""
        }
        return _windSpeed
    }
    
    var windDirection: String {
        if _windDirection == nil {
            _windDirection = ""
        }
        return _windDirection
    }
    
    init(weatherLocation: String) {
        self._weatherLocation = weatherLocation
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        print("test")
    }
}
