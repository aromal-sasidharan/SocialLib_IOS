//
//  FacebookPhotoUpload.m
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 04/02/13.
//  Copyright (c) 2013 digitalbranddgroup. All rights reserved.
//

#import "FacebookPhotoUpload.h"

@implementation FacebookPhotoUpload
@synthesize facebookRequest,facebookResutantDelegate;
-(id)init
{
    
    self = [super initWithGraphPath:@"photos.upload"];
    self.type = @"FacebookPhotoUpload";
    return self;
}
-(void)executeRequest
{
    facebookRequest = [[FBRequest alloc]initWithSession:FBSession.activeSession restMethod:self.graphPath parameters:self.postParams HTTPMethod:self.postMethod];
    [facebookRequest startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        
        
        if([self.facebookResutantDelegate respondsToSelector:@selector(errorReceived:)])
        {
            [self.facebookResutantDelegate errorReceived:error];
        }
        
        if ([self.facebookResutantDelegate respondsToSelector:@selector(resultsReceived:fromRequestType:)]){
            [self.facebookResutantDelegate resultsReceived:result fromRequestType:(NSString*)self.type];
        }
        
    }];
}
-(void)setPhoto:(UIImage*)image
{
    [self.postParams setObject:image forKey:@"picture"];
}
-(void)setMessage:(NSString*)message
{
    [self.postParams setObject:message forKey:@"message"];
}
@end
