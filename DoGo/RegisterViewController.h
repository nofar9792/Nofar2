//
//  RegisterViewController.h
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTexBox;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (nonatomic) NSString* usernameValue;

@end
