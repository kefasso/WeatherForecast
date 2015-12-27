//
//  LoadMethods.m
//  WeatherForecast
//
//  Created by Kefas on 20.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import "LoadMethods.h"

#import "LocationWeatherFactory.h"

#import "AFHTTPRequestOperationManager.h"

#define APPID @"0d37770c3f99ca648da28041b42f39ba"

#define MAIN_URL @"http://api.openweathermap.org/data/2.5/forecast"

@interface LoadMethods(){
    AFHTTPRequestOperationManager *_requestManager;
}

@end

@implementation LoadMethods

+(LoadMethods*)defaultMethods{
    
    static LoadMethods *defMethods = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defMethods = [[self alloc] init];
    });
    return defMethods;
}

- (id)init
{
    _requestManager = [AFHTTPRequestOperationManager manager];
    _requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
    _requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    return self;
}

-(void)getWeatherByLongitude:(NSString*)lon andLatitude:(NSString*)lat to:(void(^)(LocationWeather*))success failure:(void(^)(NSError*))failure{
    NSDictionary *params = @{@"lat":lat, @"lon":lon, @"APPID":APPID};
    
    [_requestManager GET:MAIN_URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        LocationWeather *locationWeathers = [LocationWeatherFactory createWeatherModelsFromJson:responseObject];
        success(locationWeathers);
    }
        failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@", error);
    }];
    
    
}

@end
