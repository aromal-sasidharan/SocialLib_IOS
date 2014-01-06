//
//  TwitterShareMediaRequest.m
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 06/01/14.
//  Copyright (c) 2014 digitalbranddgroup. All rights reserved.
//

#import "TwitterShareMediaRequest.h"

@implementation TwitterShareMediaRequest
-(id)init
{
    self = [super initWithUrl:TWITTER_SHARE_MEDIA_URL];
    [self setMethodToGet];
    self.type = @"TwitterShareMediaRequest";
    return self;
}

-(void)addImageData:(NSData*)data
{

    //add image
    [self addMultiPartData:data withName:@"media" type:@"multipart/form-data"];
}
-(void)addStatus:(NSString*)status
{
    [self addMultiPartData:[status dataUsingEncoding:NSUTF8StringEncoding] withName:@"status" type:@"multipart/form-data"];
}
@end
