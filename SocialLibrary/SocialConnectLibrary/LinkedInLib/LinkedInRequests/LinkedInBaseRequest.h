//
//  LinkedInBaseRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 17/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JSONKit.h"
#import "OAConsumer.h"
#import "OAMutableURLRequest.h"
#import "OADataFetcher.h"
#import "OAuthLoginView.h"


@protocol LinkedInResultantDelagate <NSObject>


-(void)linkedInRequestDidRecieveResult:(NSData*)data andUTF8String:(NSString*)utf8String andType:(NSString*)type;
-(void)linkedInRequestDidRecieveError:(NSData*)data andDescription:(NSString*)description andType:(NSString*)type;
@end


@interface LinkedInBaseRequest : NSObject
@property(strong,nonatomic) OAMutableURLRequest *request;

@property(strong,nonatomic) NSMutableDictionary *paramDictionary;

@property(strong,nonatomic) OADataFetcher *fetcher;
@property(strong,nonatomic) NSString *type;
@property(strong,nonatomic) id<LinkedInResultantDelagate> linkedInResultantDelagate;


-(id)initWithUrl:(NSString*)urlString andAccessToken:(OAToken*)accesstoken;
-(void)setRequestMethodToGet;
-(void)setRequestMethodToPost;

-(void)setContentTypeToXML;
-(void)setContentTypeToJSON;
-(void)executeRequest;
-(void)addParamWithKey:(NSString*)key andValue:(NSObject*)value;
-(NSString*)getJSONString;
@end
