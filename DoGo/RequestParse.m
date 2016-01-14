//
//  RequestParse.m
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "RequestParse.h"

@implementation RequestParse


+(bool)addToRequestsTable:(long)dogOwnerId dogWalkerId:(long)dogWalkerId requestStatus:(enum RequestStatus)requestStatus {
    PFObject* parseObject = [PFObject objectWithClassName:REQUESTS_TABLE];
    parseObject[DOG_OWNER_ID] = [NSNumber numberWithLong:dogOwnerId];
    parseObject[DOG_WALKER_ID] = [NSNumber numberWithLong:dogWalkerId];
    parseObject[REQUEST_STATUS] = [self convertToString:requestStatus];
    
    return [parseObject save];
}


+(NSArray*)getOwnersIdsConnectedToWalker:(long)dogWalkerId {
    PFQuery* query = [PFQuery queryWithClassName:REQUESTS_TABLE];
    [[query whereKey:DOG_WALKER_ID equalTo:[NSNumber numberWithLong:dogWalkerId]] whereKey:REQUEST_STATUS equalTo:[self convertToString:Accepted]];
    
    [self convertToString:Accepted];
    NSMutableArray* ids = [[NSMutableArray alloc] init];
    
    NSArray* result = [query findObjects];
    for (PFObject* parseObject in result) {
        [ids addObject:[NSNumber numberWithLong:[parseObject[DOG_OWNER_ID] longLongValue]]];
    }
    
    return ids;
}

+(NSArray*)getWalkersIdsConnectedToOwner:(long)dogOwnerId {
    PFQuery* query = [PFQuery queryWithClassName:REQUESTS_TABLE];
    [[query whereKey:DOG_OWNER_ID equalTo:[NSNumber numberWithLong:dogOwnerId]] whereKey:REQUEST_STATUS equalTo:[self convertToString:Accepted]];
    
    [self convertToString:Accepted];
    NSMutableArray* ids = [[NSMutableArray alloc] init];
    
    NSArray* result = [query findObjects];
    for (PFObject* parseObject in result) {
        [ids addObject:[NSNumber numberWithLong:[parseObject[DOG_OWNER_ID] longLongValue]]];
    }
    
    return ids;
}

//+(NSArray*)getWalkersIdsConnectedToOwner:(long)dogOwnerId {
//    PFQuery* query = [PFQuery queryWithClassName:REQUESTS_TABLE];
//    [[query whereKey:DOG_OWNER_ID equalTo:[NSNumber numberWithLong:dogOwnerId]] whereKey:REQUEST_STATUS equalTo:[self convertToString:Accepted]];
//    
//    [self convertToString:Accepted];
//    NSMutableArray* ids = [[NSMutableArray alloc] init];
//    
//    NSArray* result = [query findObjects];
//    for (PFObject* parseObject in result) {
//        [ids addObject:[NSNumber numberWithLong:[parseObject[DOG_OWNER_ID] longLongValue]]];
//    }
//    
//    return ids;
//}


+(bool)updateRequest:(long)dogOwnerId dogWalkerId:(long)dogWalkerId requestStatus:(enum RequestStatus)requestStatus{
    //    PFQuery* query = [PFQuery queryWithClassName:DOGS_TABLE];
    //    [query whereKey:USER_ID equalTo:[NSNumber numberWithLong:userId]];
    //
    //    PFObject* parseObject = [query getFirstObject];
    //    if (parseObject) {
    //        parseObject[AGE] = [NSNumber numberWithLong:dog.age];
    //        parseObject[PIC_REF] = dog.picRef;
    //
    //        return [parseObject save];
    //
    //    }
    
    return NO;
}


+(NSString*)convertToString:(enum RequestStatus)requestStatus{
    NSString* result = nil;

    switch (requestStatus) {
        case Waiting:
            result = @"Small";
            break;
        case Accepted:
            result = @"Medium";
            break;
        case Declined:
            result = @"Large";
            break;
    }
    return result;
}
//
//+(enum DogSize)dogSizeFromString:(NSString*)str{
//    NSDictionary<NSString*,NSNumber*>* dogSizes = @{ @"Small":@(Small), @"Medium":@(Medium), @"Large":@(Large) };
//
//    return dogSizes[str];
//}

@end
