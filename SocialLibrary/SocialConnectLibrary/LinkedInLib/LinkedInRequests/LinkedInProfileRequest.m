//
//  LinkedInProfileRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 01/11/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInProfileRequest.h"



@implementation LinkedInProfileModel

@synthesize firstName;
@synthesize id;
@synthesize lastName;
@synthesize publicProfileUrl;
@end


@implementation LinkedInProfileRequest
-(id)initWithAccessToken:(OAToken *)accesstoken 
{
    
    self  = [super initWithUrl:LINKED_IN_PROFILE_URL andAccessToken:accesstoken];
    [self setRequestMethodToGet];
    [self setContentTypeToXML];
     self.type = @"LinkedInProfileRequest";
    return self;
}
@end
