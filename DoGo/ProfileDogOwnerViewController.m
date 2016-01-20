//
//  ProfileDogOwnerViewController.m
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ProfileDogOwnerViewController.h"

@implementation ProfileDogOwnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)setDogOwner:(DogOwner *)dogOwner{
     _dogOwner = dogOwner;
    
    if(self.dogOwner){
        self.dogNameTextBox.text =  self.dogOwner.dog.name;
        self.dogAgeTextBox.text = [NSString stringWithFormat:@"%li", self.dogOwner.dog.age];
        
        if (self.dogOwner.dog.picRef)
        {
            [self.spinner startAnimating];
            
            self.dogPic = [Utilities loadImageFromDevice:self.dogOwner.dog.picRef];
            
            if(self.dogPic == nil)
            {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    self.dogPic = [[Model instance] getImage:self.dogOwner.dog.picRef];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.dogImageView setImage:self.dogPic];
                        [Utilities saveImageOnDevice:self.dogOwner.dog.picRef image:self.dogPic];
                        [self.spinner stopAnimating];
                    });
                });
            }
            else
            {
                [self.dogImageView setImage:self.dogPic];
            }
        }
    }
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.dogOwner.dog.picRef = [NSString stringWithFormat:@"%lu", (unsigned long)self.dogOwner.dog.name.hash];
    self.dogPic = image;
    [self.dogImageView setImage:image];
    [self.pickerLibrary dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)getImageButtonClick:(id)sender {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];

    switch (status)
        {
            case PHAuthorizationStatusAuthorized:
            {
                [self openGallery];
                break;
            }
            case PHAuthorizationStatusNotDetermined:
            {
                [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus authorizationStatus)
                 {
                     if (authorizationStatus == PHAuthorizationStatusAuthorized)
                     {
                          [self openGallery];
                     }
                     else
                     {
                         [self.view makeToast:@"אין הרשאות כניסה לגלריה"];
                     }
                 }];
                break;
            }
            default:
               [self.view makeToast:@"אין הרשאות כניסה לגלריה"];
                break;
        }
                                  
}

-(void)openGallery{
        self.pickerLibrary = [[UIImagePickerController alloc] init];
        self.pickerLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.pickerLibrary.delegate = self;
        [self presentModalViewController:self.pickerLibrary animated:YES];
}
@end
