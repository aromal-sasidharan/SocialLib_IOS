//
//  LinkedInShareRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 17/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInShareRequest.h"
#import "LinkedInConstants.h"
@implementation LinkedInShareRequest
-(id)initWithAccessToken:(OAToken *)accesstoken;
{
    
    content =[[NSMutableDictionary alloc]init];
    self = [super initWithUrl:LINKED_IN_SHARE_URL andAccessToken:accesstoken];
    [self setContentTypeToXML];
    [self setRequestMethodToPost];
    [self addParamWithKey:@"visibility" andValue:    [[NSDictionary alloc]
                                                     initWithObjectsAndKeys:
                                                      @"anyone",@"code",nil]];
     self.type = @"LinkedInShareRequest";

    return self;
}


-(void)addComment:(NSString*)comment
{
    [self addParamWithKey:@"comment" andValue:comment];
}


-(void)addDescription:(NSString*)description
{
    [content setValue:description forKey:@"description"];
}

-(void)addImageUrl:(NSString*)imageUrl
{
    [content setValue:imageUrl forKey:@"submittedImageUrl"];
}


-(void)addTitle:(NSString*)title
{
    [content setValue:title forKey:@"title"];
}

-(void)addUrl:(NSString*)url
{
        [content setValue:url forKey:@"submittedUrl"];
}
-(NSString *)getJSONString
{
    [self addParamWithKey:@"content" andValue:content];
    
    return [super getJSONString];
}
@end
