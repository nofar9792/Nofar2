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
    self.errorLabel.text = @"";
    [self loadData];
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
   
    [self initCell:cell trip:trip];
    
    return cell;
}

-(void)initCell: (TripCell*)cell trip:(Trip*)trip{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"HH:mm"];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    cell.trip = trip;
    cell.dateLabel.text = [dateFormatter stringFromDate:trip.startOfWalking];
    cell.beginTimeLabel.text = [timeFormatter stringFromDate:trip.startOfWalking];
    cell.endTimeLabel.text = [timeFormatter stringFromDate:trip.endOfWalking];
    
    cell.isPaidCheckBox.enabled = YES;
    if(trip.isPaid){
        [cell.isPaidCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
        cell.isPaidCheckBox.enabled = NO;
    }else{
        [cell.isPaidCheckBox setImage:[UIImage imageNamed:@"empty.png"] forState:UIControlStateNormal];
    }
    
    if([self.user isKindOfClass:[DogWalker class]]){
        
        cell.dogNameLabel.text = trip.dogOwner.dog.name;
        cell.dogOwnerNameLabel.text = trip.dogOwner.firstName;
        cell.dogWalkerNameLabel.text = self.user.firstName;
    }else{
        cell.dogNameLabel.text = ((DogOwner*)self.user).dog.name;
        cell.dogOwnerNameLabel.text = self.user.firstName;
        cell.dogWalkerNameLabel.text = trip.dogWalker.firstName;
        cell.isPaidCheckBox.enabled = NO;
    }
    
}
            
-(void)loadData{
    [self.spinner startAnimating];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if([self.user isKindOfClass:[DogWalker class]]){
            
            data = [[Model instance] getTripsByDogWalkerId:self.user.userId];
        }else{
            data = [[Model instance] getTripsByDogOwnerId:self.user.userId];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(data.count == 0){
                self.errorLabel.text = @"אין תוצאות להצגה";
            }
            [self.tableView reloadData];
            [self.spinner stopAnimating];
        });
    });
}
@end
