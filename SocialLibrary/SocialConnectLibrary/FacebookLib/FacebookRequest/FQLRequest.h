//
//  FQLRequest.h
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 29/01/13.
//  Copyright (c) 2013 digitalbranddgroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookRequest.h"
@interface FQLRequest : FacebookRequest
-(void)setQuery:(NSString*)query;
@end
