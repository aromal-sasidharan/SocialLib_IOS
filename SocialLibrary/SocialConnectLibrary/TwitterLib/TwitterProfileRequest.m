//
//  TwitterProfileRequest.m
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 06/11/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterProfileRequest.h"
#import "TwitterConstants.h"


@implementation TwitterProfileModel

@synthesize id;
@synthesize name;
@synthesize profile_image_url;
@synthesize screen_name;
@end

@implementation TwitterProfileRequest
-(id)init
{
    self = [super initWithUrl:TWITTER_PROFILE_URL];
    [self setMethodToGet];
    self.type = @"TwitterProfileRequest";
    return self;
}
@end
