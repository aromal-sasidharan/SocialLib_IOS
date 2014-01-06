//
//  FacebookRequest.m
//  FacebookComponents
//
//  Created by dbgmacmini2 dbg on 28/06/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookRequest.h"

@implementation FacebookRequest
@synthesize type;
@synthesize graphPath,facebookResutantDelegate,postParams,facebookRequest,postMethod;
/**
 * Called just before the request is sent to the server.
 */
-(id)initWithGraphPath:(NSString*) aGraphPath
{
    self = [super init];
    if(self)
    {
   
        graphPath = aGraphPath;
            postParams = [[NSMutableDictionary alloc]init];
        self.postMethod = @"GET";
    }
    
    return self;
}
-(void)setMethodToPOST
{
    self.postMethod = @"POST";
}

-(void)setMethodToGET
{
    self.postMethod = @"GET";
}

-(void)executeRequest
{
    facebookRequest = [[FBRequest alloc]initWithSession:FBSession.activeSession graphPath:self.graphPath parameters:self.postParams HTTPMethod:self.postMethod];
    
    NSLog(@"%@",self.postParams);
    [facebookRequest startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        
        
        if([self.facebookResutantDelegate respondsToSelector:@selector(errorReceived:)])
        {
            [self.facebookResutantDelegate errorReceived:error];
        }
        
        if ([self.facebookResutantDelegate respondsToSelector:@selector(resultsReceived:fromRequestType:)]){
            [self.facebookResutantDelegate resultsReceived:result fromRequestType:(NSString*)self.type];
        }
    
    }];
}@end
