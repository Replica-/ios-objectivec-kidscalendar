//
//  Assets.h
//  KidCalendar
//
//  Created by Daniel Santoro on 28/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

static NSMutableArray *assetsList;

@interface Assets : NSObject
{
 
    
}

+ (Event*) lookupAsset:(NSString*)lAssetName;
+ (NSInteger) countAssets;
+ (Event*) lookupAssetByIndex:(NSInteger)lAssetIndex;
+ (void) loadImage:(NSString *)lString withID:(NSString*)lID andDescription:(NSString *)lDesc;
    

@end
