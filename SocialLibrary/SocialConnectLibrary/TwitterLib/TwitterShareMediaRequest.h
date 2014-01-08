//
//  TwitterShareMediaRequest.h
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 06/01/14.
//  Copyright (c) 2014 digitalbranddgroup. All rights reserved.
//

#import "TwitterBaseRequest.h"
#import "TwitterConstants.h"
@interface TwitterShareMediaRequest : TWRequest
-(id)init;
@property(strong,nonatomic) NSString* type;
@property(strong,nonatomic)NSMutableDictionary* params;
@property(strong,nonatomic)id<TwitterResultantDelegate> twitterResultantDelegate;;
-(void)addImageData:(NSData*)data;
-(void)addStatus:(NSString*)status;
@end
