//
//  TwitterFriendsRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterFriendsRequest.h"
#import "TwitterConstants.h"
@implementation TwitterFriendsRequest
-(id)init
{
    self = [super initWithUrl:TWITTER_FRIENDS_URL];
    [self setMethodToGet];
    self.type = @"TwitterFriendsRequest";
    return self;
}
@end
