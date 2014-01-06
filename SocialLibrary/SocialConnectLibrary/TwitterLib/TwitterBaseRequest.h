//
//  TwitterBaseRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Twitter/Twitter.h>
#import <Twitter/TWRequest.h>
#import <Accounts/ACAccountStore.h>
#import <Accounts/ACAccountType.h>




@protocol TwitterResultantDelegate <NSObject>
@optional
-(void)twitterRequestDidRecieveResult:(NSData*)data andUTF8String:(NSString*)utf8String andType:(NSString*)type;
-(void)twitterRequestDidRecieveError:(NSError*)error andType:(NSString*)Type;

-(void)twitterRequestDidRecieveResult:(NSData *)data WithResponseCode:(int)responseCode andUTF8String:(NSString *)utf8String andType:(NSString *)type;
@end



@interface TwitterBaseRequest : NSObject
@property(strong,nonatomic) NSString* url;
@property(nonatomic) TWRequestMethod method;
@property(strong,nonatomic)NSMutableDictionary* params;
@property(strong,nonatomic)id<TwitterResultantDelegate> twitterResultantDelegate;
@property(strong,nonatomic) NSString* type;

-(id)initWithUrl:(NSString*)aUrl;
-(void)addParamWithKey:(NSString*)key andValue:(NSObject*)value;
-(void)setMethodToPost;
-(void)setMethodToGet;
-(void)executeRequest;
-(void)executeRequestWithAccount:(ACAccount*)account;
-(NSMutableDictionary*) getPostParams;

-(void)setEntities;
-(void)setRights;
-(void)addEntities:(NSString*)value;
-(void)addRights:(NSString*)value;
-(void)addCount:(NSString*)value;
-(void)addCursor:(NSString*)value;
@end
