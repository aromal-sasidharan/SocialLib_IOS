//
//  TwitterDirectMessageRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterBaseRequest.h"

@interface TwitterDirectMessageRequest : TwitterBaseRequest

-(id)init;
-(void)addMessage:(NSString*)message;
-(void)addScreeName:(NSString*)screeName;

@end
