//
//  FacebookFriendsRequest.h
//  FacebookComponents
//
//  Created by dbgmacmini2 dbg on 28/06/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookRequest.h"
#import "Jastor.h"
@interface  FacebookFriendsModel  :Jastor


@property(nonatomic,copy) NSArray* data;

@end


@interface  FacebookFriendsModelItem  :Jastor


@property(nonatomic,copy) NSString* id;
@property(nonatomic,copy) NSString* name;
@end

@interface FacebookFriendsRequest : FacebookRequest

-(id)initWithLimit:(int)limit andOffset:(int)offset;

    



@end
