//
//  LocationWeatherFactory.m
//  WeatherForecast
//
//  Created by Kefas on 20.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import "LocationWeatherFactory.h"

@implementation LocationWeatherFactory

+ (LocationWeather*)createWeatherModelsFromJson:(NSDictionary*)json{
    
    NSDictionary *city = json[@"city"];
    LocationWeather *model = [LocationWeather new];
    model.locationName = city[@"name"];
    model.latitude = city[@"coord"][@"lat"];
    model.longitude = city[@"coord"][@"lon"];
    
    NSArray *locationJsons = json[@"list"];
    NSMutableArray *items = [NSMutableArray new];
    for (NSDictionary *locationJson in locationJsons) {
        WeatherItem *item = [self getLocationWeatherFromJson:locationJson];
        [items addObject:item];
    }
    
    model.weatherItems = items;
    
    return model;
}

+ (WeatherItem*)getLocationWeatherFromJson:(NSDictionary*)json{
    WeatherItem *locationWeather = [WeatherItem new];
    NSDictionary *main = json[@"main"];
    NSDictionary *weather = json[@"weather"][0];
    NSDictionary *wind = json[@"wind"];
    locationWeather.clouds = json[@"clouds"][@"all"];
    locationWeather.humidity = main[@"humidity"];
    locationWeather.pressure = main[@"pressure"];
    locationWeather.temp = main[@"temp"];
    locationWeather.temp_max = main[@"temp_max"];
    locationWeather.temp_min = main[@"temp_min"];
    locationWeather.wind_deg = wind[@"deg"];
    locationWeather.wind_speeds = wind[@"speed"];
    locationWeather.desc = weather[@"description"];
    locationWeather.icon = weather[@"icon"];
    
    return locationWeather;
}

@end
