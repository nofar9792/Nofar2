//
//  SearchViewController.h
//  DoGo
//
//  Created by nofar cohen zedek on 1/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
# import "DogWalkerCell.h"

@interface SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *minimalAgeTextBox;
@property (weak, nonatomic) IBOutlet UITextField *maxPriceTextBox;
@property (weak, nonatomic) IBOutlet UITextField *cityTextBox;
@property (weak, nonatomic) IBOutlet UITableView *walkersListTableView;

@property (nonatomic) NSArray *walkersListArray;

- (IBAction)searchClick:(id)sender;

@end
