//
//  LinkedInConstants.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 17/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInConstants.h"

@implementation LinkedInConstants
















///////////////////////////////////////////////  URL //////////////////////////////////////
NSString* const LINKED_IN_SHARE_URL = @"http://api.linkedin.com/v1/people/~/shares";
NSString* const LINKED_IN_FRIENDS_URL = @"http://api.linkedin.com/v1/people/~/connections";

NSString* const LINKED_IN_MAILBOX_URL = @"http://api.linkedin.com/v1/people/~/mailbox";
NSString* const LINKED_IN_PROFILE_URL = @"http://api.linkedin.com/v1/people/~:(first-name,last-name,id,picture-url,public-profile-url)";

NSString* const LINKED_IN_FULL_PROFILE_URL = @"	http://api.linkedin.com/v1/people/url=%@";
NSString* const LINKED_IN_REQUEST_TOKEN_URL = @"https://api.linkedin.com/uas/oauth/requestToken";
NSString* const LINKED_IN_ACCESS_TOKEN_URL = @"https://api.linkedin.com/uas/oauth/accessToken";
NSString* const LINKED_IN_USER_AUTHORIZE_URL = @"https://www.linkedin.com/uas/oauth/authorize";
NSString* const LINKED_IN_CALL_BACK_URL = @"hdlinked://linkedin/oauth";

NSString* const LINKED_IN_API_CALL_URL =@"http://api.linkedin.com/";



@end
