//
//  MessagesDogOwnerViewController.h
//  DoGo
//
//  Created by nofar cohen zedek on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "DogOwner.h"

@interface MessagesDogOwnerViewController : UITableViewController
@property (nonatomic) DogOwner* user;
@end
