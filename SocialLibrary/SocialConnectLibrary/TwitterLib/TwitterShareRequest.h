//
//  TwitterShareRequest.h
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 16/11/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterBaseRequest.h"

@interface TwitterShareRequest : TwitterBaseRequest
-(void)addStatus:(NSString*)status;
@end
