//
//  LinkedInBaseRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 17/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInBaseRequest.h"



@implementation LinkedInBaseRequest


{
    
}
@synthesize request;
@synthesize paramDictionary;
@synthesize fetcher;
@synthesize type;
-(id)initWithUrl:(NSString*)urlString andAccessToken:(OAToken*)accesstoken
{
    
    
    self = [super init];
    if(self){
        
    
    self.paramDictionary = [[NSMutableDictionary alloc]init];
    NSURL *url = [NSURL URLWithString:urlString];
    request = [[OAMutableURLRequest alloc] initWithURL:url
                                    consumer:[OAuthLoginView getConsumer]
                                       token:accesstoken
                                    callback:nil
                           signatureProvider:nil];
    
    [request setValue:@"json" forHTTPHeaderField:@"x-li-format"];
   
    [request setHTTPMethod:@"POST"];
        
    }
    
    return self;
}

-(void)setRequestMethodToGet
{
    [request setHTTPMethod:@"GET"];
}
-(void)setRequestMethodToPost
{
    [request setHTTPMethod:@"POST"];
}


-(void)setContentTypeToXML
{
    [request setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
}
-(void)setContentTypeToJSON
{
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
}
-(void)setResponseTypeToXML

{
    [request setValue:@"xml" forHTTPHeaderField:@"x-li-format"];
}

-(void)setResponseTypeToJSON

{
    [request setValue:@"json" forHTTPHeaderField:@"x-li-format"];
}
-(void)executeRequest
{
    
    if([self.paramDictionary count]>0){
     [request setHTTPBodyWithString:[self getJSONString]];
    }
    
    
    fetcher = [[OADataFetcher alloc] init];
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(postUpdateApiCallResult:didFinish:)
                  didFailSelector:@selector(postUpdateApiCallResult:didFail:)];
}
- (void)postUpdateApiCallResult:(OAServiceTicket *)ticket didFinish:(NSData *)data
{
    
    
    NSString *responseBody = [[NSString alloc] initWithData:data
                                                   encoding:NSUTF8StringEncoding];
    if([self.linkedInResultantDelagate respondsToSelector:@selector(linkedInRequestDidRecieveResult:andUTF8String:andType:)])
    {
        [self.linkedInResultantDelagate linkedInRequestDidRecieveResult:data andUTF8String:responseBody andType:self.type];
    }
   
    
}

- (void)postUpdateApiCallResult:(OAServiceTicket *)ticket didFail:(NSData *)error
{
    
       if([self.linkedInResultantDelagate respondsToSelector:@selector(linkedInRequestDidRecieveError:andDescription:andType:)])
   {
       [self.linkedInResultantDelagate linkedInRequestDidRecieveError:error andDescription:[error description] andType:self.type];
   }
}

-(NSString*)getJSONString
{
    return [self.paramDictionary JSONString];
}


-(void)addParamWithKey:(NSString*)key andValue:(NSObject*)value
{
    [ self.paramDictionary setValue:value forKey:key];
}
@end
