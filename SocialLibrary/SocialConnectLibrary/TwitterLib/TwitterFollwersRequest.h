//
//  TwitterFollwersRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterBaseRequest.h"
#import "Jastor.h"
/*
 
 
 
 {
 ids =     (
 19850847,
 296144964
 );
 "next_cursor" = 0;
 "next_cursor_str" = 0;
 "previous_cursor" = 0;
 "previous_cursor_str" = 0;
 }

 
 
 */


@interface TwitterFollowerModel:Jastor

@property(copy,nonatomic) NSString* next_cursor;
@property(copy,nonatomic) NSString* next_cursor_str;
@property(copy,nonatomic) NSString* previous_cursor;
@property(copy,nonatomic) NSString* previous_cursor_str;
@property(copy,nonatomic) NSArray* ids;

@end




@interface TwitterFollwersRequest : TwitterBaseRequest
-(id)init;
@end
