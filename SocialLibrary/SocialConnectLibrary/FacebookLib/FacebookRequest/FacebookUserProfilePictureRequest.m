//
//  FacebookUserProfilePictureRequest.m
//  FacebookComponents
//
//  Created by dbgmacmini2 dbg on 29/06/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookUserProfilePictureRequest.h"
#import "FacebookPathsConstants.h"
@implementation FacebookUserProfilePictureRequest

-(id)init
{
    
    self = [super initWithGraphPath:[FacebookPathsConstants GRAPHPATH_MY_PROFILE_PICTURE]];
    self.type = @"FacebookUserProfilePictureRequest";
    return self;
}
-(id)initWithUserId:(NSString*)userId
{
    NSString* path = [NSString stringWithFormat:[FacebookPathsConstants GRAPHPATH_FRIENDS_PROFILE_PICTURE],userId];
    self = [super initWithGraphPath:path];
    return self;
}

@end
