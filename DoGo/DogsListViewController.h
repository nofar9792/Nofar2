//
//  DogsListViewController.h
//  DoGo
//
//  Created by nofar cohen zedek on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DogWalker.h"
#import "Model.h"
#import "DogInDogsListCell.h"
#import "Dog.h"

@interface DogsListViewController : UITableViewController
@property (nonatomic) DogWalker *user;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end
