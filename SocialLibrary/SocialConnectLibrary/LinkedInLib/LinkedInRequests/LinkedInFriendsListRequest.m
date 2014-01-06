//
//  LinkedInFriendsListRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 17/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInFriendsListRequest.h"
#import "LinkedInConstants.h"

@implementation LinkedInFriendsListModel
@synthesize _total,values;

+(Class)values_class
{
    return [LinkedInFriendsListModelItem class];
}


@end

@implementation LinkedInFriendsListModelItem

@synthesize id,firstName,lastName,pictureUrl;

@end

@implementation LinkedInFriendsListRequest
-(id)initWithAccessToken:(OAToken *)accesstoken;
{
    
    self  = [super initWithUrl:LINKED_IN_FRIENDS_URL andAccessToken:accesstoken];
       [self setRequestMethodToGet];
    self.type = @"LinkedInFriendsListRequest";
    return self;
}
@end
