//
//  ViewController.m
//  WeatherForecast
//
//  Created by Kefas on 20.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import "ViewController.h"
#import "LoadMethods.h"
#import "LocationWeather.h"
#import "WeatherListController.h"

@interface ViewController () 
@property(strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
}

// Location Manager Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayAlertFor:(CLAuthorizationStatus)status{
    NSString *message = @"To check weather for your location you must turn on 'While Using The App' in the Location Services Settings";
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Info"
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                             [[UIApplication sharedApplication] openURL:settingsURL];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)checkForLocalization:(id)sender {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status == kCLAuthorizationStatusDenied) {
        [self displayAlertFor:status];
    }
    else if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSString *lat = [NSString stringWithFormat:@"%f", _locationManager.location.coordinate.latitude];
        NSString *lon = [NSString stringWithFormat:@"%f", _locationManager.location.coordinate.longitude];
        [[LoadMethods defaultMethods] getWeatherByLongitude:lon andLatitude:lat to:^(LocationWeather *dic){
            WeatherListController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WeatherListController"];
            vc.locationWeather = dic;
            UINavigationController *nc = self.navigationController;
            [nc pushViewController:vc animated:YES];
            
        }failure:^(NSError *error){
            
        }];
        
    }
    
}

- (IBAction)aboutClicked:(id)sender {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WebViewController"];
    [self presentViewController:vc animated:YES completion:nil];

    
}

@end
