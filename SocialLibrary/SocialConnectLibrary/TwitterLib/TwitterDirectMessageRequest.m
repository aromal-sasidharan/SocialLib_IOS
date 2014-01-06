//
//  TwitterDirectMessageRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterDirectMessageRequest.h"
#import "TwitterConstants.h"
@implementation TwitterDirectMessageRequest
-(id)init
{
    self = [super initWithUrl:TWITTER_DIRECT_MESSAGE_URL];
    [self setMethodToPost];
    self.type = @"TwitterDirectMessageRequest";
    return self;
}
-(void)addMessage:(NSString*)message
{
    [self addParamWithKey:@"text" andValue:message];
}

-(void)addScreeName:(NSString*)screeName
{
    [self addParamWithKey:@"screen_name" andValue:screeName];
}
@end
