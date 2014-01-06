//
//  TwitterUserLookUpRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterUserLookUpRequest.h"
#import "TwitterConstants.h"



@implementation TwitterUserLookModel

@synthesize values;

+(Class)values_class
{
    return [TwitterUserLookModelItem class];
}
@end


@implementation TwitterUserLookModelItem

@synthesize name,profile_image_url,screen_name,id;
@end


@implementation TwitterUserLookUpRequest
-(id)init
{
    self = [super initWithUrl:TWITTER_USER_LOOK_UP_URL];
    [self setMethodToPost];
    friendsIds = [[NSMutableArray alloc]init];
    self.type = @"TwitterUserLookUpRequest";
    return self;
}
-(void)addFriendId:(NSString*)friendId
{
    [friendsIds addObject:friendId];
}
-(void)setFriends:(NSArray*)friendIds
{
    [friendsIds addObjectsFromArray:friendIds];
}
-(NSMutableDictionary *)getPostParams
{
    if([friendsIds count]<=0)
    {
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:@"Must add Friend Ids -(void)addFriendId:(NSString*)friendId " userInfo:nil];
    }
    NSString* commaSeperatedFreinds = [friendsIds componentsJoinedByString:@","];
//    [self addParamWithKey:@"include_entities" andValue:@"1"];
//    [self addParamWithKey:@"include_rts" andValue:@"1"];
    
    [self addParamWithKey:@"user_id" andValue:commaSeperatedFreinds];
    return [super getPostParams];
}
@end
