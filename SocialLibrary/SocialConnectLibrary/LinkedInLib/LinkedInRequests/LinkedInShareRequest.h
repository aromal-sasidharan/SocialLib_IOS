//
//  LinkedInShareRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 17/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInBaseRequest.h"

@interface LinkedInShareRequest : LinkedInBaseRequest
{
    NSMutableDictionary* content;
}
-(id)initWithAccessToken:(OAToken *)accesstoken;



-(void)addComment:(NSString*)comment;

-(void)addDescription:(NSString*)description;
-(void)addImageUrl:(NSString*)imageUrl;

-(void)addTitle:(NSString*)title;
-(void)addUrl:(NSString*)url;
@end
