//
//  WeatherListController.m
//  WeatherForecast
//
//  Created by Kefas on 20.12.2015.
//  Copyright © 2015 QL-Solutions. All rights reserved.
//

#import "WeatherListController.h"
#import "WeatherCell.h"
#import "LoadMethods.h"

#define kWeatherItemCell @"WeatherCell"

@interface WeatherListController ()
@property (weak, nonatomic) IBOutlet UITableView *tView;

@end

@implementation WeatherListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:kWeatherItemCell bundle:[NSBundle mainBundle]];
    [_tView registerNib:nib forCellReuseIdentifier:kWeatherItemCell];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [_tView addSubview:refreshControl];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
        
    } else if (section == 1){
        return _locationWeather.weatherItems.count;
    }
    
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell;
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    
    if (section == 0) {
        NSString *simpleIdentifier = @"SimpleTabItem";
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleIdentifier];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ (5 days)", _locationWeather.locationName];
    } else if (section == 1){
        WeatherCell *wc = [tableView dequeueReusableCellWithIdentifier:kWeatherItemCell forIndexPath:indexPath];
        wc.item = _locationWeather.weatherItems[row];
        cell = wc;
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        return 44;
        
    } else if (indexPath.section == 1) {
        return 150;
        
    } else {
        return 44.0;
    }
    
}

- (void)refresh:(UIRefreshControl*)refreshControl {
    NSString *lat = [NSString stringWithFormat:@"%@", _locationWeather.latitude];
    NSString *lon = [NSString stringWithFormat:@"%@", _locationWeather.longitude];
    [[LoadMethods defaultMethods] getWeatherByLongitude:lon andLatitude:lat to:^(LocationWeather *dic){
        _locationWeather = dic;
        [_tView reloadData];
        
        [refreshControl endRefreshing];
        
    }failure:^(NSError *error){
        [refreshControl endRefreshing];
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
