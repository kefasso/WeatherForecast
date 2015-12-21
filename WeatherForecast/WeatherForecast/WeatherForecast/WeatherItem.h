//
//  WeatherItem.h
//  WeatherForecast
//
//  Created by Kefas on 20.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherItem : NSObject

@property (nonatomic, strong) NSNumber *humidity;
@property (nonatomic, strong) NSNumber *pressure;

@property (nonatomic, strong) NSNumber *temp;
@property (nonatomic, strong) NSNumber *temp_max;
@property (nonatomic, strong) NSNumber *temp_min;

@property (nonatomic, strong) NSString *icon;

@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *dateStr;

@property (nonatomic, strong) NSNumber *wind_deg;
@property (nonatomic, strong) NSNumber *wind_speeds;

@property (nonatomic, strong) NSNumber *clouds;

@end
