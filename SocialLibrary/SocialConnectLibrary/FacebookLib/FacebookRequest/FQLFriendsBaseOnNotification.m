//
//  FQLFriendsBaseOnNotification.m
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 29/01/13.
//  Copyright (c) 2013 digitalbranddgroup. All rights reserved.
//

#import "FQLFriendsBaseOnNotification.h"

@implementation FQLFriendsBaseOnNotification
-(id)init
{
    self =[super init];
    self.type = @"FQLFriendsBaseOnNotification";
    [self setQuery:@"SELECT  id,name from profile where id in (select sender_id FROM notification WHERE recipient_id=me())"];
    return self;
}


@end
