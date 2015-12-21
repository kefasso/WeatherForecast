//
//  WeatherCell.m
//  WeatherForecast
//
//  Created by Kefas on 21.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import "WeatherCell.h"
#import "UIImageView+AFNetworking.h"

@implementation WeatherCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setItem:(WeatherItem *)item{
    _item = item;
    [self fillData];
}

-(void)fillData{
    _descLbl.text = _item.desc;
    _dateLbl.text = _item.dateStr;
    
    _tempLbl.text = [self celciusTempFromFahrenheit:_item.temp];
    _tempMaxLbl.text =  [NSString stringWithFormat:@"max %@", [self celciusTempFromFahrenheit:_item.temp_max]];
    _tempMinLbl.text = [NSString stringWithFormat:@"min %@", [self celciusTempFromFahrenheit:_item.temp_min]];
    
    _windLbl.text = [NSString stringWithFormat:@"Wind (speed): %@", _item.wind_speeds];
    _cloudsLbl.text = [NSString stringWithFormat:@"Clouds (%%): %@%%", _item.clouds];
    _humidityLbl.text = [NSString stringWithFormat:@"Humidity (%%): %@%%", _item.humidity];
    
    NSURL *imgURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", _item.icon]];
    [_iconIv setImageWithURL:imgURL];
}

-(NSString*)celciusTempFromFahrenheit:(NSNumber*)fTemp{
    NSString *result;
    result = [NSString stringWithFormat:@"%@%@ F", fTemp, @"\u00B0"];
    
    return result;
}

@end
