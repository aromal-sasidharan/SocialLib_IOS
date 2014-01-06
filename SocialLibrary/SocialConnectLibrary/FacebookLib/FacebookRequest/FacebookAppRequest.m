//
//  FacebookAppRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "FacebookAppRequest.h"
#import "FBSBJSON.h"
NSString* const FACEBOOK_DIALOG_APPREQUEST = @"apprequests";

@implementation FacebookAppRequest
@synthesize dialogName;

- (id)init
{
    self = [super init];
    if (self) {
        params = [[NSMutableDictionary alloc]init];
        requestData = [[NSMutableDictionary alloc]init];
        friends = [[NSMutableArray alloc]init];
        dialogName = FACEBOOK_DIALOG_APPREQUEST;
    }
    return self;
}
-(void)addMessage:(NSString*)message
{
    [params setObject:message forKey:@"message"];
}
-(void)addDataWithName:(NSString*)name andValue:(NSString*)value
{
    [requestData setValue:value forKey:name];
}
-(void)addFriendId:(NSString*)aFacebookFriendId
{
    [friends addObject:aFacebookFriendId];
}
-(NSMutableDictionary*)getPostParams
{
    
    FBSBJSON *jsonWriter = [FBSBJSON new];
    if([requestData count]>0){
    NSString *requestDataString = [jsonWriter stringWithObject:requestData];
    [params setObject:requestDataString forKey:@"data"];
    }
    if([friends count]>0){
    NSString* commaSeperatedFreinds = [friends componentsJoinedByString:@","];
    [params setValue:commaSeperatedFreinds forKey:@"to"];
    }
    return params;

}
@end
