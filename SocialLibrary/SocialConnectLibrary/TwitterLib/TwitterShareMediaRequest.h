//
//  TwitterShareMediaRequest.h
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 06/01/14.
//  Copyright (c) 2014 digitalbranddgroup. All rights reserved.
//

#import "TwitterBaseRequest.h"
#import "TwitterConstants.h"
@interface TwitterShareMediaRequest : TwitterBaseRequest
-(id)init;
-(void)addImageData:(NSData*)data;
-(void)addStatus:(NSString*)status;
@end
