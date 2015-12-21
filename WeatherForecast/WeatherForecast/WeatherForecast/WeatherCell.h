//
//  WeatherCell.h
//  WeatherForecast
//
//  Created by Kefas on 21.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherItem.h"

@interface WeatherCell : UITableViewCell

@property (strong, nonatomic) WeatherItem *item;

@property (weak, nonatomic) IBOutlet UIImageView *iconIv;

@property (weak, nonatomic) IBOutlet UILabel *descLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;

@property (weak, nonatomic) IBOutlet UILabel *tempLbl;
@property (weak, nonatomic) IBOutlet UILabel *tempMinLbl;
@property (weak, nonatomic) IBOutlet UILabel *tempMaxLbl;

@property (weak, nonatomic) IBOutlet UILabel *windLbl;
@property (weak, nonatomic) IBOutlet UILabel *humidityLbl;
@property (weak, nonatomic) IBOutlet UILabel *cloudsLbl;

@end
