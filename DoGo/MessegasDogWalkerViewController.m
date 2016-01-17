//
//  MessegasDogWalkerViewController.m
//  DoGo
//
//  Created by nofar cohen zedek on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "MessegasDogWalkerViewController.h"

@interface MessegasDogWalkerViewController ()
{
    NSArray* data;
}

@end

@implementation MessegasDogWalkerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    messageDogWalkerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageWalkerCell" forIndexPath:indexPath];
    DogOwner* owner = [data objectAtIndex:indexPath.row];
    
    [self initCell:cell owner:owner];
    
    return cell;
    
}

-(void)initCell: (messageDogWalkerCell*)cell owner:(DogOwner*)owner
{
    NSMutableString *fullName = [[NSMutableString alloc]initWithString:owner.firstName];
    [fullName appendString:@" "];
    [fullName appendString:owner.lastName];
    
    cell.owner = owner;
    cell.user = self.user;
    cell.dogOwnerNameLabel.text = fullName;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

-(void)loadData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        data =[[Model instance] getRequestForDogWalker:self.user.userId ];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(data.count == 0){
            }
            [self.tableView reloadData];
        });
    });
}

@end
