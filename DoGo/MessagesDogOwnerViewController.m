//
//  MessagesDogOwnerViewController.m
//  DoGo
//
//  Created by nofar cohen zedek on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "MessagesDogOwnerViewController.h"

@interface MessagesDogOwnerViewController ()
{
    NSArray* data;
}

@end

@implementation MessagesDogOwnerViewController

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
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"messageOwnerCell" forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"messageOwnerCell"];
    }
    
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

-(void) loadData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        data =[[Model instance] getRequestOfDogOwner:self.user.userId ];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(data.count == 0){
            }
            [self.tableView reloadData];
        });
    });
}
@end
