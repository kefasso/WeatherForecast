//
//  LocationWeather.h
//  WeatherForecast
//
//  Created by Kefas on 20.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationWeather : NSObject

@property (nonatomic, strong) NSString *locationName;

@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSNumber *latitude;

@property (nonatomic, strong) NSArray *weatherItems;

@end
