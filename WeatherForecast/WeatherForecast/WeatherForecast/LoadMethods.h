//
//  LoadMethods.h
//  WeatherForecast
//
//  Created by Kefas on 20.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationWeather.h"

@interface LoadMethods : NSObject

+ (LoadMethods*) defaultMethods;

-(void)getWeatherByLongitude:(NSString*)lon andLatitude:(NSString*)lat to:(void(^)(LocationWeather*))success failure:(void(^)(NSError*))failure;


@end
