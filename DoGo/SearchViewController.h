//
//  SearchViewController.h
//  DoGo
//
//  Created by nofar cohen zedek on 1/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
# import "DogWalkerCell.h"
# import "Model.h"

@interface SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *minimalAgeTextBox;
@property (weak, nonatomic) IBOutlet UITextField *maxPriceTextBox;
@property (weak, nonatomic) IBOutlet UITextField *cityTextBox;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *walkersListArray;
@property (nonatomic) long walkerMinimalAge;
@property (nonatomic) NSInteger walkerMaxPrice;
@property (nonatomic) NSString *walkerCity;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

- (IBAction)searchClick:(id)sender;

@end
