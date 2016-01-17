//
//  RegisterViewController.m
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "RegisterViewController.h"


@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // scroller
    [scroller setScrollEnabled: YES];
    [scroller setContentSize:CGSizeMake(320, 1000)];
    
    self.isOwner = NO;
    [self changeSubView];
}

- (IBAction)signUpClick:(id)sender
{
    if (!self.isOwner)
    {
        ProfileDogWalkerViewController* profileDogWalkerVC = (ProfileDogWalkerViewController*)self.childVC;
        
        DogWalker* dogWalker = [[DogWalker alloc]init];
        
        dogWalker.age = [profileDogWalkerVC.ageTextBox.text longLongValue];
        dogWalker.priceForHour = [profileDogWalkerVC.priceForHourTextBox.text intValue];
        dogWalker.isComfortableOnMorning = profileDogWalkerVC.isComfortableOnMorning;
        dogWalker.isComfortableOnAfternoon = profileDogWalkerVC.isComfortableOnAfternoon;
        dogWalker.isComfortableOnEvening = profileDogWalkerVC.isComfortableOnEvening;
        
        self.user = dogWalker;
    }
    else
    {
        ProfileDogOwnerViewController* profileDogOwnerVC = (ProfileDogOwnerViewController*)self.childVC;
        DogOwner* dogOwner = [[DogOwner alloc]init];
        
        dogOwner.dog.name = profileDogOwnerVC.dogNameTextBox.text;
        dogOwner.dog.age = [profileDogOwnerVC.dogAgeTextBox.text longLongValue];
        
        if(profileDogOwnerVC.dogPic){
            dogOwner.dog.picRef = dogOwner.dog.name;
        }
        
         self.user = dogOwner;
    }
    
    self.user.firstName = self.firstNameTextBox.text;
    self.user.lastName = self.lastNameTextBox.text;
    self.user.userName = self.usernameTexBox.text;
    self.user.phoneNumber = self.phoneNumberTextBox.text;
    self.user.city = self.cityTextBox.text;
    self.user.address = self.addressTextBox.text;
    
    
    void(^afterSignUp)(long) = ^(long userId){
        [self.spinner stopAnimating];
        
        self.user.userId = userId;
      
        if (self.isOwner)
        {
            [self performSegueWithIdentifier:@"toDogWalkerScreen" sender:self];
        }
        else
        {
            [self performSegueWithIdentifier:@"toDogOwmerSceen" sender:self];
        }
    };
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self.spinner startAnimating];
        long userId ;
        
        @try {
            if (self.isOwner)
            {
                userId =[[Model instance] addDogOwner:self.user.userName password:self.passwordTextBox.text firstName:self.user.firstName lastName:self.user.lastName phoneNumber:self.user.phoneNumber address:self.user.address city:self.user.city dog:((DogOwner*)self.user).dog];
            }
            else
            {
                userId = [[Model instance] addDogWalker:self.user.userName password:self.passwordTextBox.text  firstName:self.user.firstName lastName:self.user.lastName phoneNumber:self.user.phoneNumber address:self.user.address city:self.user.city age:((DogWalker*)self.user).age priceForHour:((DogWalker*)self.user).priceForHour isComfortableOnMorning:((DogWalker*)self.user).isComfortableOnMorning isComfortableOnAfternoon:((DogWalker*)self.user).isComfortableOnAfternoon isComfortableOnEvening:((DogWalker*)self.user).isComfortableOnEvening];
            }
            
        }
        @catch (NSException * e) {
            if([e.name isEqualToString:@"invalidUsername"]){
                 [self.view makeToast:@"שם המשתמש תפוס. נסה שם אחר"];
            }else{
                [self.view makeToast:@"אירעה שגיאה בעת ההרשמה. נסה שנית"];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            afterSignUp(userId);
        });
    });
}

- (IBAction)userTypeChange:(id)sender {
    self.isOwner = !self.isOwner;
    [self changeSubView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDogWalkerScreen"]){
        DogWalkerTabsViewController* tabsVC = segue.destinationViewController;
        tabsVC.dogWalker = (DogWalker*)self.user;
    }else{
        DogOwnerTabsViewController* tabsVC = segue.destinationViewController;
        tabsVC.dogOwner = (DogOwner*)self.user;
    }
}

-(void)changeSubView{
    if (!self.isOwner)
    {
        // Creating the child view controller
        ProfileDogWalkerViewController* profileDogWalkerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"profileDogWalkerViewController"];
        
        // Connect between the parent VC to the Child VC
        [self addChildViewController:profileDogWalkerVC];
        
        // Set child's view size
        CGRect frame = self.userTypeSubView.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        profileDogWalkerVC.view.frame = frame;
        
        self.childVC = profileDogWalkerVC;
      
        [self.userTypeSubView addSubview:profileDogWalkerVC.view];
        
    }
    else
    {
        // Creating the child view controller
        ProfileDogOwnerViewController* profileDogOwnerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"profileDogOwnerViewController"];
        
        // Connect between the parent VC to the Child VC
        [self addChildViewController:profileDogOwnerVC];
        
        // Set child's view size
        CGRect frame = self.userTypeSubView.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        profileDogOwnerVC.view.frame = frame;
        
        self.childVC = profileDogOwnerVC;
        
        [self.userTypeSubView addSubview:profileDogOwnerVC.view];
    }
}
@end
