//
//  Assets.m
//  KidCalendar
//
//  Created by Daniel Santoro on 28/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import "Assets.h"
#import "Event.h"

@implementation Assets
{
   
}

+(void)initialize{
    assetsList = [[NSMutableArray alloc] init];
    
}
- (id)init
{
    self = [super init];
    if (self) {
    
    }
    return self;
}

/*
 Count ASsets
 
 
 */

+ (NSInteger) countAssets{
    return [assetsList count];
    
}

/*
 Lookup asset
 */
+ (Event*) lookupAsset:(NSString*) lAssetName{
    for (Event* currentEvent in assetsList){
        if (lAssetName == [currentEvent getName]){
            return currentEvent;
        }
        
    }
    
    return NULL;
}

/*
 Lookup asset by Index number
 */
+ (Event*) lookupAssetByIndex:(NSInteger)lAssetIndex{
   
    return [assetsList objectAtIndex:lAssetIndex];
}

/*
 Load the assets into the array
 */
+ (void) loadImage:(NSString *)lString withID:(NSString*)lid andDescription:(NSString *)lDesc {
    
    Event *newEvent = [[Event alloc]initWithFile:lString andID:lid andLabel:lDesc];
   // if (assetsList==NULL) {
     //   assetsList = [[NSMutableArray alloc]init];
        
    //}
        [assetsList addObject:newEvent];
   
    }

@end
