//
//  Event.m
//  KidCalendar
//
//  Created by Daniel Santoro on 28/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import "Event.h"

@implementation Event
{
    NSString * imageFile;
    NSInteger * idType;
    NSString *imageID;
    NSString *imageLabel;
}

- (NSString *) getName{
    return imageID;
    
}

- (NSString *) getImage{
    
    return imageFile;
    
}

- (NSString *)getLabel{
    return imageLabel;
    
}


- (id)initWithFile:(NSString*)lName andID:(NSString*)lID andLabel:(NSString *)lLabel{
    self = [super init];
    if (self){
        imageFile = lName;
        imageID = lID;
        imageLabel = lLabel;
        
    }
    
    return self;
}

@end
