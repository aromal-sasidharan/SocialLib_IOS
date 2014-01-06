//
//  FacebookUserDetailRequest.m
//  FacebookComponents
//
//  Created by dbgmacmini2 dbg on 28/06/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookUserDetailRequest.h"
#import "FacebookPathsConstants.h"

@implementation FacebookUserDetailModel

@synthesize first_name,id,last_name,link,name,username;

@end
@implementation FacebookUserDetailRequest
-(id)init
{
    self = [super initWithGraphPath:[FacebookPathsConstants GRAPHPATH_MY_DETAILS]];
    self.type = @"FacebookUserDetailRequest";
    return self;
}
-(id)initWithUserId:(NSString*)userId
{
    self = [super initWithGraphPath:userId];
    return self;
}


@end


