//
//  FacebookFriendsRequest.m
//  FacebookComponents
//
//  Created by dbgmacmini2 dbg on 28/06/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookFriendsRequest.h"
#import "FacebookPathsConstants.h"

@implementation FacebookFriendsModel

@synthesize data;
+(Class)data_class
{
    return [FacebookFriendsModelItem class];
}


@end


@implementation FacebookFriendsModelItem

@synthesize id,name;

@end

@implementation FacebookFriendsRequest
-(id)init
{
    self = [super initWithGraphPath:[FacebookPathsConstants GRAPHPATH_MY_FRIENDS]];
    self.type = @"FacebookFriendsRequest";
    [self setMethodToGET];
    return self;
}

-(id)initWithLimit:(int)limit andOffset:(int)offset
{
    NSString* path = [NSString stringWithFormat:@"%@?limit=%d&offset=%d",[FacebookPathsConstants GRAPHPATH_MY_FRIENDS],limit,offset];
    self = [super initWithGraphPath:path];
    self.type = @"FacebookFriendsRequest";
    
        [self setMethodToGET];
    return self;
}
@end
