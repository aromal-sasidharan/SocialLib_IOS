//
//  TwitterShareRequest.m
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 16/11/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterShareRequest.h"
#import "TwitterConstants.h"
@implementation TwitterShareRequest

-(id)init
{
    self = [super initWithUrl:TWITTER_SHARE_URL];
    [self setMethodToPost];
    self.type = @"TwitterShareRequest";
    return self;
}

-(void)addStatus:(NSString*)status
{
    [self addParamWithKey:@"status" andValue:status];
    
    
    
}


@end
