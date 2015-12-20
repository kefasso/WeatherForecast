//
//  LocationWeatherFactory.h
//  WeatherForecast
//
//  Created by Kefas on 20.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationWeather.h"
#import "WeatherItem.h"

@class LocationWeather;

@interface LocationWeatherFactory : NSObject

+ (LocationWeather*)createWeatherModelsFromJson:(NSDictionary*)json;


@end
