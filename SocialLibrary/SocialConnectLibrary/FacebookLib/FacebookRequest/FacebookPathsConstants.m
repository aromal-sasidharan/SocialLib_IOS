//
//  FacebookPathsConstants.m
//  FacebookComponents
//
//  Created by dbgmacmini2 dbg on 28/06/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookPathsConstants.h"

@implementation FacebookPathsConstants
static NSString* GraphPathMydetails = @"me";
static NSString* GraphPathMyFriends = @"/me/friends";
static NSString* GraphPathMyProfilePicture = @"me/picture";
static NSString* GraphPathFriendsProfilePicture = @"%@/picture";
static NSString* GraphPathFriendsFeedPath = @"/%@/feed";
static NSString* GraphPathEvents = @"/%@/events";

+(NSString*)GRAPHPATH_MY_DETAILS
{
    return GraphPathMydetails;
}
+(NSString*)GRAPHPATH_FRIENDS_FEEDPATH
{
    return GraphPathFriendsFeedPath;
}
+(NSString*)GRAPHPATH_MY_FRIENDS
{
    return GraphPathMyFriends;
}
+(NSString*)GRAPHPATH_MY_PROFILE_PICTURE
{
    return GraphPathMyProfilePicture;
}
+(NSString*)GRAPHPATH_FRIENDS_PROFILE_PICTURE
{
    return GraphPathFriendsProfilePicture;
}
+(NSString*)GRAPH_PATH_EVENTS
{
    return GraphPathEvents;
}

@end
