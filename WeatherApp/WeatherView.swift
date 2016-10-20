//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Stephan Lerner on 20.10.16.
//  Copyright © 2016 Stephan. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var nextDetailView: UIView!

    
    @IBOutlet weak var backgroundStyleImg: UIImageView!
    @IBOutlet weak var weekDayLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    @IBOutlet weak var weatherLocationLbl: UILabel!
    @IBOutlet weak var currentTemperatureLbl: UILabel!
    @IBOutlet weak var temperatureUnitLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var windDirectionLbl: UILabel!
    
    private var weather: Weather!
    
    func updateWeather(weather: Weather) {
        
        self.backgroundStyleImg.image = UIImage(named: "\(weather.backgroundStyle)")
        self.weekDayLbl.text = weather.weekDay.uppercased()
        self.weatherTypeLbl.text = weather.weatherType.uppercased()
        self.weatherLocationLbl.text = weather.weatherLocation.uppercased()
        self.currentTemperatureLbl.text = weather.currentTemperature
        self.humidityLbl.text = "Humidity: \(weather.humidity)"
        self.windSpeedLbl.text = "Wind speed: \(weather.windSpeed)"
        self.windDirectionLbl.text = "Wind direction: \(weather.windDirection)"
        
        switch weather.backgroundStyle {
        case Weather.BackgroundStyle.clouds, Weather.BackgroundStyle.rain, Weather.BackgroundStyle.snow:
            changeLblColor(color: CLOUDS_RAIN_SNOW_COLOR)
        case Weather.BackgroundStyle.sun:
            changeLblColor(color: SUN_COLOR)
        case Weather.BackgroundStyle.thunder:
            changeLblColor(color: THUNDER_COLOR)
        }
    
    }
    
    func changeLblColor(color: UIColor) {
        self.weekDayLbl.textColor = color
        self.weatherTypeLbl.textColor = color
        self.weatherLocationLbl.textColor = color
        self.currentTemperatureLbl.textColor = color
        self.temperatureUnitLbl.textColor = color
        self.humidityLbl.textColor = color
        self.windSpeedLbl.textColor = color
        self.windDirectionLbl.textColor = color
    }
}
