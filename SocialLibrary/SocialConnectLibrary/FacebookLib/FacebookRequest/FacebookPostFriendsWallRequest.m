//
//  FacebookPostFriendsWallRequest.m
//  FacebookComponents
//
//  Created by dbgmacmini2 dbg on 28/06/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookPostFriendsWallRequest.h"
#import "FacebookPathsConstants.h"
@implementation FacebookPostFriendsWallRequest
@dynamic postParams;
-(id)initWithUserId:(NSString*)userId
{
    NSString* feedPath =  [FacebookPathsConstants GRAPHPATH_FRIENDS_FEEDPATH];
    feedPath = [NSString stringWithFormat:feedPath,userId];
    
    self = [super initWithGraphPath:feedPath];    
    self.type = @"FacebookPostFriendsWallRequest";
    return self;
    

    
}
-(void)addName:(NSString*)name
{
    [self.postParams setObject:name forKey:@"name"];
}

-(void)addCaption:(NSString*)caption
{
    [self.postParams setObject:caption forKey:@"caption"];
} 


-(void)addDescription:(NSString*)description
{
    [self.postParams setObject:description forKey:@"description"];
} 

-(void)addMessage:(NSString*)message
{
    [self.postParams setObject:message forKey:@"message"];
} 
-(void)addLink:(NSString*)link
{
    [self.postParams setObject:link forKey:@"link"];
} 

-(void)addPictureLink:(NSString*)pictureLink
{
    [self.postParams setObject:pictureLink forKey:@"picture"];
} 


@end
