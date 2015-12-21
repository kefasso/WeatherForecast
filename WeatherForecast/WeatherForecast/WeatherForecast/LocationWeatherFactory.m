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
    WeatherItem *weatherItem = [WeatherItem new];
    NSDictionary *main = json[@"main"];
    NSDictionary *weather = json[@"weather"][0];
    NSDictionary *wind = json[@"wind"];
    weatherItem.clouds = json[@"clouds"][@"all"];
    weatherItem.humidity = main[@"humidity"];
    weatherItem.pressure = main[@"pressure"];
    weatherItem.temp = main[@"temp"];
    weatherItem.temp_max = main[@"temp_max"];
    weatherItem.temp_min = main[@"temp_min"];
    weatherItem.wind_deg = wind[@"deg"];
    weatherItem.wind_speeds = wind[@"speed"];
    weatherItem.desc = weather[@"description"];
    weatherItem.icon = weather[@"icon"];
    weatherItem.dateStr = json[@"dt_txt"];
    
    return weatherItem;
}

@end
