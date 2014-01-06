//
//  LinkedInMessageFriendRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 19/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInBaseRequest.h"

@interface LinkedInMessageFriendRequest : LinkedInBaseRequest
{
    NSMutableArray* connections;   
    
}
-(id)initWithAccessToken:(OAToken *)accesstoken;

-(void)addSubject:(NSString*)subject;

-(void)addMessage:(NSString*)message;
-(void)addRecipentLinkedInId:(NSString*)linkedInId;


@end
