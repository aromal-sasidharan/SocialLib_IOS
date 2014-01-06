//
//  FacebookAppRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//





extern NSString* const FACEBOOK_DIALOG_APPREQUEST;
@interface FacebookAppRequest : NSObject
{
    NSMutableDictionary* requestData;
    NSMutableDictionary* params;
    NSMutableArray* friends;
}
@property(strong,nonatomic)NSString* dialogName;
-(NSMutableDictionary*)getPostParams;
-(void)addMessage:(NSString*)message;
-(void)addDataWithName:(NSString*)name andValue:(NSString*)value;
-(void)addFriendId:(NSString*)aFacebookFriendId;
- (id)init;
@end
