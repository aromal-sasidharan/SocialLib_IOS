//
//  LinkedInMessageFriendRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 19/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInMessageFriendRequest.h"
#import "LinkedInConstants.h"
@implementation LinkedInMessageFriendRequest
-(id)initWithAccessToken:(OAToken *)accesstoken;
{
    
    self  = [super initWithUrl:LINKED_IN_MAILBOX_URL andAccessToken:accesstoken];
    [self setRequestMethodToPost];
    [self setContentTypeToXML];
    connections = [[NSMutableArray alloc]init];
       self.type = @"LinkedInMessageFriendRequest";
    return self;
}

-(void)addSubject:(NSString*)subject
{
    [self addParamWithKey:@"subject" andValue:subject];
}


-(void)addMessage:(NSString*)message
{
    [self addParamWithKey:@"body" andValue:message];
}

-(void)addRecipentLinkedInId:(NSString*)linkedInId
{
    NSString* people = [NSString stringWithFormat:@"/people/%@",linkedInId];
    ;

    [connections addObject:[NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:people forKey:@"_path"] forKey:@"person"]];
    
    NSDictionary* recipients = [[NSDictionary alloc]initWithObjectsAndKeys:connections,@"values", nil];
    [self addParamWithKey:@"recipients" andValue:recipients];
}
@end
