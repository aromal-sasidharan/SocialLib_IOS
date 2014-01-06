//
//  TwitterFollwersRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterFollwersRequest.h"
#import "TwitterConstants.h"

@implementation TwitterFollowerModel

@synthesize next_cursor;
@synthesize next_cursor_str;
@synthesize previous_cursor;
@synthesize previous_cursor_str;
@synthesize ids;
+(Class)ids_class
{
    return [NSString class];
}
@end

@implementation TwitterFollwersRequest
-(id)init
{
    self = [super initWithUrl:TWITTER_FOLLWERS_URL];
    [self setMethodToGet];
    self.type = @"TwitterFollwersRequest";
    return self;
}
@end
