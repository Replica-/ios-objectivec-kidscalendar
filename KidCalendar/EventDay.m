//
//  EventDay.m
//  KidCalendar
//
//  Created by Daniel Santoro on 28/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import "EventDay.h"

@implementation EventDay

- (id)initWithEvent:(NSDate *)eData andSecond:(int)eType{
    if (self = [super init]){
        eventDate = eData;//[[NSDate alloc] initWithTimeIntervalSinceNow:(24*60*60)];
        eventType = eType;
    }
    return self;
}

-(id) init{
    self = [super init];
    if (self){
      
        
    }
    return self;
}


@end
