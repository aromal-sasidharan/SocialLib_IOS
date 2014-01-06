//
//  TwitterConstants.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterConstants.h"

@implementation TwitterConstants



NSString* const TWITTER_API_KEY = @"";
NSString* const TWITTER_API_SECERET_KEY = @"";












///////////////////////////////////////////////  URL //////////////////////////////////////

NSString* const TWITTER_FRIENDS_URL = @"https://api.twitter.com/1.1/friends/ids.json";

NSString* const TWITTER_FOLLWERS_URL = @"https://api.twitter.com/1.1/followers/ids.json";
NSString* const TWITTER_USER_LOOK_UP_URL = @"https://api.twitter.com/1.1/users/lookup.json";
NSString* const TWITTER_DIRECT_MESSAGE_URL = @"https://api.twitter.com/1/direct_messages/new.json";

NSString* const TWITTER_PROFILE_URL = @"https://api.twitter.com/1/account/verify_credentials.json";

NSString* const TWITTER_SHARE_URL = @"https://api.twitter.com/1/statuses/update.json";
NSString* const TWITTER_SHARE_MEDIA_URL = @"https://upload.twitter.com/1/statuses/update_with_media.json";
@end
