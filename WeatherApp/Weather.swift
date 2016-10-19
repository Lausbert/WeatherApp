//
//  Weather.swift
//  WeatherApp
//
//  Created by Stephan Lerner on 19.10.16.
//  Copyright © 2016 Stephan. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _backgroundStyle: BackgroundStyle!
    private var _weekDay: String!
    private var _weatherType: String!
    private var _weatherLocation: String!
    private var _currentTemperature: String!
    private var _humidity: String!
    private var _windSpeed: String!
    private var _windDirection: WindDirection!
    
    enum BackgroundStyle {
        case clouds
        case rain
        case snow
        case sun
        case thunder
    }
    
    enum WindDirection {
        case N
        case NNE
        case NE
        case ENE
        case E
        case ESE
        case SE
        case SSE
        case S
        case SSW
        case SW
        case WSW
        case W
        case WNW
        case NW
        case NNW
    }
    
    var backgroundStyle: BackgroundStyle {
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
    
    var windDirection: WindDirection {
        return _windDirection
    }
    
    init(weatherLocation: String) {
        self._weatherLocation = weatherLocation
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        let url = URL(string: "\(WEATHER_URL)\(_weatherLocation!)\(USER_KEY)\(UNITS_METRIC)")!
        
        Alamofire.request(url).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let dictWeather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = dictWeather[0]["main"] as? String {
                        switch main {
                            case "Thunderstorm":
                                self._backgroundStyle = BackgroundStyle.thunder
                            case "Drizzle":
                                self._backgroundStyle = BackgroundStyle.rain
                            case "Rain":
                                self._backgroundStyle = BackgroundStyle.rain
                            case "Snow":
                                self._backgroundStyle = BackgroundStyle.snow
                            case "Atmosphere":
                                self._backgroundStyle = BackgroundStyle.clouds
                            case "Clear":
                                self._backgroundStyle = BackgroundStyle.sun
                            case "Clouds":
                                self._backgroundStyle = BackgroundStyle.clouds
                            case "Extreme":
                                self._backgroundStyle = BackgroundStyle.thunder
                        default:
                            self._backgroundStyle = BackgroundStyle.sun
                        }
                        
                    }
                    
                    if let descr = dictWeather[0]["description"] as? String {
                        self._weatherType = descr
                    }
                    
                }
                
                if let time = dict["dt"] as? Double {
                    
                    let date = Date(timeIntervalSince1970: time)
                    let dayFormatter = DateFormatter()
                    dayFormatter.dateFormat = "EEEE"
                    self._weekDay = dayFormatter.string(from: date)
                    
                }
                
                if let main = dict["main"] as? Dictionary<String, Double> {
                    
                    if let currTemp = main["temp"] {
                        self._currentTemperature = "\(Int(round(currTemp)))"
                    }
                    
                    if let hum = main["humidity"] {
                        self._humidity = "\(Int(hum))"
                    }
                    
                }
                
                if let wind = dict["wind"] as? Dictionary<String, Double> {
                    
                    if let speed = wind["speed"] {
                        self._windSpeed = "\(speed)"
                    }
                    
                    if let direc = wind["deg"] {
                        switch (direc) {
                        case 348.75...360:
                            self._windDirection = WindDirection.N
                        case 0..<11.25:
                            self._windDirection = WindDirection.N
                        case 11.25..<33.75:
                            self._windDirection = WindDirection.NNE
                        case 33.75..<56.25:
                            self._windDirection = WindDirection.NE
                        case 56.25..<78.75:
                            self._windDirection = WindDirection.ENE
                        case 78.75..<101.25:
                            self._windDirection = WindDirection.E
                        case 101.25..<123.75:
                            self._windDirection = WindDirection.ESE
                        case 123.75..<146.25:
                            self._windDirection = WindDirection.SE
                        case 146.25..<168.75:
                            self._windDirection = WindDirection.SSE
                        case 168.75..<191.25:
                            self._windDirection = WindDirection.S
                        case 191.25..<213.75:
                            self._windDirection = WindDirection.SSW
                        case 213.75..<236.25:
                            self._windDirection = WindDirection.SW
                        case 236.25..<258.75:
                            self._windDirection = WindDirection.WSW
                        case 258.75..<281.25:
                            self._windDirection = WindDirection.W
                        case 281.25..<303.75:
                            self._windDirection = WindDirection.WNW
                        case 303.75..<326.25:
                            self._windDirection = WindDirection.NW
                        case 326.25..<348.75:
                            self._windDirection = WindDirection.NNW
                        default:
                            self._windDirection = WindDirection.N
                        }
                    }
                }
            }
            completed()
        }
    }
}
