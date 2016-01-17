//
//  DogsListViewController.m
//  DoGo
//
//  Created by nofar cohen zedek on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DogsListViewController.h"

@interface DogsListViewController ()
{
    NSArray* data;
    
}
@end

@implementation DogsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DogInDogsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dogCell" forIndexPath:indexPath];
    DogOwner* owner = [data objectAtIndex:indexPath.row];
    [self initCell:cell owner:owner];
    
    return cell;
    
}

-(void)initCell: (DogInDogsListCell*)cell owner:(DogOwner*)owner
{
    NSMutableString *fullName = [[NSMutableString alloc]initWithString:owner.firstName];
    [fullName appendString:@" "];
    [fullName appendString:owner.lastName];
    
    cell.walker = self.user;
    cell.owner = owner;
    cell.ownerNameLabel.text = fullName;
    cell.dogNameLabel.text = owner.dog.name;
    cell.addressLabel.text = owner.address;
    cell.phoneNumberLabel.text = owner.phoneNumber;
}

-(void) loadData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray* allConnectedDogOwners =[[Model instance] getOwnersConnectToWalker:self.user.userId];
        NSMutableArray* relevantDogs = [[NSMutableArray alloc] init];
        
        for (DogOwner* owner in allConnectedDogOwners)
        {
            [relevantDogs addObject:owner];
        }
        
        data = relevantDogs;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(data.count == 0){
            }
            [self.tableView reloadData];
        });
    });
}

@end
