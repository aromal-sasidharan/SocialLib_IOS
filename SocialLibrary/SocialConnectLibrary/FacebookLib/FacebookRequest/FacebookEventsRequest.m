//
//  FacebookEventsRequest.m
//  FacebookUtilities
//
//  Created by dbgmacmini2 dbg on 24/07/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookEventsRequest.h"
#import "FacebookPathsConstants.h"
@implementation FacebookEventsRequest
-(id)initWithUserId:(NSString*)userId
{
    NSString* path = [NSString stringWithFormat:[FacebookPathsConstants GRAPH_PATH_EVENTS],userId];
    self = [super initWithGraphPath:path];
    self.type = @"FacebookRequest";
    return self;
}

@end
