//
//  TripsViewController.m
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "TripsViewController.h"

@interface TripsViewController (){
    NSArray* data;
}

@end

@implementation TripsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    data = [[Model instance] getTripsByDogWalkerId:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TripCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tripCell" forIndexPath:indexPath];
    
    Trip* trip = [data objectAtIndex:indexPath.row];
    
    cell.dogNameLabel.text = trip.dogOwner.dog.name;
    cell.dogOwnerNameLabel.text = trip.dogOwner.firstName;
    cell.dogWalkerNameLabel.text = trip.dogWalker.firstName;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    //Optionally for time zone conversions
    //[formatter setTimeZone:[NSTimeZone  timeZoneWithName:@"GMT"]];
    
    NSString *dateOfTripString = [dateFormatter stringFromDate:trip.startOfWalking];
    cell.dateLabel.text = dateOfTripString;
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"HH:mm"];
    
    //Optionally for time zone conversions
    //[formatter setTimeZone:[NSTimeZone  timeZoneWithName:@"..."]];
    
    NSString *timeOfStartTripString = [timeFormatter stringFromDate:trip.startOfWalking];
    NSString *timeOfEndTripString = [timeFormatter stringFromDate:trip.endOfWalking];
    
    cell.beginTimeLabel.text = timeOfStartTripString;
    cell.endTimeLabel.text = timeOfEndTripString;
    
    if(trip.isPaid){
        [cell.isPaidCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
    }else{
        [cell.isPaidCheckBox setImage:[UIImage imageNamed:@"empty.png"] forState:UIControlStateNormal];
    }

    
    return cell;
}

@end
