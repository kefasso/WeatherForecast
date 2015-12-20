//
//  WeatherListController.h
//  WeatherForecast
//
//  Created by Kefas on 20.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationWeather.h"

@interface WeatherListController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) LocationWeather *locationWeather;

@end
