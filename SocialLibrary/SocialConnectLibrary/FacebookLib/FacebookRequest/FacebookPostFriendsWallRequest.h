//
//  FacebookPostFriendsWallRequest.h
//  FacebookComponents
//
//  Created by dbgmacmini2 dbg on 28/06/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookRequest.h"

@interface FacebookPostFriendsWallRequest : FacebookRequest
-(id)initWithUserId:(NSString*)userId;

-(void)addName:(NSString*)name;
-(void)addCaption:(NSString*)caption;

-(void)addDescription:(NSString*)description;
-(void)addMessage:(NSString*)message;
-(void)addLink:(NSString*)link;
-(void)addPictureLink:(NSString*)pictureLink;

@end
