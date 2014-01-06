//
//  FacebookGraphAppRequest.m
//  MyStand
//
//  Created by Deepu Viswanath on 27/05/13.
//  Copyright (c) 2013 Digital Brand Group Inc. All rights reserved.
//

#import "FacebookGraphAppRequest.h"

@implementation FacebookGraphAppRequest
-(id)init
{
//    NSString* feedPath =  @"apprequests";
  
    
    self = [super initWithGraphPath:@"me/apprequests"];
    self.type = @"FacebookGraphAppRequest";
    friends = [[NSMutableArray alloc]init];
    requestData = [[NSMutableDictionary alloc]init];
    return self;
    
    
    
}
-(void)setAccesstoken:(NSString*)accesstoken
{
   [self.postParams setObject:accesstoken forKey:@"access_token"];
}
-(void)addMessage:(NSString*)message
{
    [self.postParams setValue:message forKey:@"message"];
}
-(void)addDataWithName:(NSString*)name andValue:(NSString*)value
{
    [requestData setValue:value forKey:name];
}
-(void)addFriendId:(NSString*)aFacebookFriendId
{
    [friends addObject:aFacebookFriendId];
}
-(void)executeRequest
{
    [self setPostParams];

    [super executeRequest];
}
-(void)setPostParams
{
    
    FBSBJSON *jsonWriter = [FBSBJSON new];
    if([requestData count]>0){
        NSString *requestDataString = [jsonWriter stringWithObject:requestData];
        [self.postParams setObject:requestDataString forKey:@"data"];
    }
    if([friends count]>0){
        NSString* commaSeperatedFreinds = [friends componentsJoinedByString:@","];
        [self.postParams setValue:commaSeperatedFreinds forKey:@"to"];
    }

    
}

@end
