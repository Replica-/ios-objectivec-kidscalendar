//
//  EventDay.h
//  KidCalendar
//
//  Created by Daniel Santoro on 28/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDay : NSObject
{
    NSDate *eventDate;
    int eventType;
    
    
}


-(id) initWithEvent:(NSDate*)eData  andSecond:(int)eType;
@end
