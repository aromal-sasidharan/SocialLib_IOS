//
//  FQLRequest.m
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 29/01/13.
//  Copyright (c) 2013 digitalbranddgroup. All rights reserved.
//

#import "FQLRequest.h"

@implementation FQLRequest
@synthesize facebookRequest,facebookResutantDelegate;
-(id)init
{
    
    self = [super initWithGraphPath:@"fql.query"];
    self.type = @"FQLRequest";
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
-(void)setQuery:(NSString*)query
{
    [self.postParams setObject:query forKey:@"query"];
}
@end
