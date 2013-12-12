//
//  Event.h
//  KidCalendar
//
//  Created by Daniel Santoro on 28/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

- (id)initWithFile:(NSString*)lName andID:(NSString*)lID andLabel:(NSString*) lLabel;
- (NSString*) getName;
- (NSString *) getImage;
- (NSString*) getLabel;
@end
