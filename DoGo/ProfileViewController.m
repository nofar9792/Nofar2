//
//  ProfileViewController.m
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self fillTextBoxWithUserProperties];
    
    if([self.user isKindOfClass:[DogWalker class]]){
        //Creating the child view controller
        ProfileDogWalkerViewController* profileDogWalkerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"profileDogWalkerViewController"];
        
        // Connect between the parent VC to the Child VC
        [self addChildViewController:profileDogWalkerVC];
        
        // Set child's view size
        CGRect frame = self.userTypeDetailsView.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        profileDogWalkerVC.view.frame = frame;
        
        // Add informatin to the child view
        profileDogWalkerVC.dogWalker = (DogWalker*)self.user;
        
        self.childVC = profileDogWalkerVC;
        
        [self.userTypeDetailsView addSubview:profileDogWalkerVC.view];
    }else{
        // Creating the child view controller
        ProfileDogOwnerViewController* profileDogOwnerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"profileDogOwnerViewController"];
        
        // Connect between the parent VC to the Child VC
        [self addChildViewController:profileDogOwnerVC];
        
        // Set child's view size
        CGRect frame = self.userTypeDetailsView.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        profileDogOwnerVC.view.frame = frame;
        
        // Add informatin to the child view
        profileDogOwnerVC.dogOwner = (DogOwner*)self.user;
        
        self.childVC = profileDogOwnerVC;
        
        [self.userTypeDetailsView addSubview:profileDogOwnerVC.view];
    }
}   

- (IBAction)saveClick:(id)sender {
    self.user.firstName = self.firstNameTextBox.text;
    self.user.lastName = self.lastNameTextBox.text;
    self.user.phoneNumber = self.phoneNumberTextBox.text;
    self.user.city = self.cityTextBox.text;
    self.user.address = self.addressTextBox.text;
    
    if([self.user isKindOfClass:[DogWalker class]]){
        ProfileDogWalkerViewController* profileDogWalkerVC = (ProfileDogWalkerViewController*)self.childVC;
        DogWalker* dogWalker = (DogWalker*) self.user;
        
        dogWalker.age = [profileDogWalkerVC.ageTextBox.text longLongValue];
        dogWalker.priceForHour = [profileDogWalkerVC.priceForHourTextBox.text intValue];
        dogWalker.isComfortableOnMorning = profileDogWalkerVC.isComfortableOnMorning;
        dogWalker.isComfortableOnAfternoon = profileDogWalkerVC.isComfortableOnAfternoon;
        dogWalker.isComfortableOnEvening = profileDogWalkerVC.isComfortableOnEvening;
        
        
    }else{
        ProfileDogOwnerViewController* profileDogOwnerVC = (ProfileDogOwnerViewController*)self.childVC;
        DogOwner* dogOwner = (DogOwner*) self.user;
        
        dogOwner.dog.name = profileDogOwnerVC.dogNameTextBox.text;
        dogOwner.dog.age = [profileDogOwnerVC.dogAgeTextBox.text longLongValue];
        
        if(profileDogOwnerVC.dogPic){
            dogOwner.dog.picRef = dogOwner.dog.name;
        }
        
    }
    
    
    void(^afterSave)(bool) = ^(bool result){
        if(result){
            [self.view makeToast:@"שמירה בוצעה בהצלחה"];
        }else{
            [self.view makeToast:@"אירעה שגיאה בעת השמירה. נסה שנית"];
            
        }
    };
    
    [self.spinner startAnimating];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        bool result = [[Model instance]updateUser:self.user];
        if([self.user isKindOfClass:[DogOwner class]] && ((DogOwner*) self.user).dog.picRef){
            [[Model instance] saveImage:((ProfileDogOwnerViewController*)self.childVC).dogPic imageName:((DogOwner*) self.user).dog.picRef];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            afterSave(result);
            [self.spinner stopAnimating];
        });
    });
}

-(void)fillTextBoxWithUserProperties{
    self.firstNameTextBox.text = self.user.firstName;
    self.lastNameTextBox.text = self.user.lastName;
    self.phoneNumberTextBox.text = self.user.phoneNumber;
    self.cityTextBox.text = self.user.city;
    self.addressTextBox.text = self.user.address;
}
@end
