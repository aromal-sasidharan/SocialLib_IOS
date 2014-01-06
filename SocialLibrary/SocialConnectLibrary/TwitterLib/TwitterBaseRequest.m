//
//  TwitterBaseRequest.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterBaseRequest.h"

@implementation TwitterBaseRequest
@synthesize params,url;
@synthesize method;
@synthesize twitterResultantDelegate;
@synthesize type;
-(id)initWithUrl:(NSString*)aUrl
{
    self = [super init];
    self.url = aUrl;
    self.params =[[NSMutableDictionary alloc]init];
    return self;
}

-(void)setEntities

{
    [self addParamWithKey:@"include_entities" andValue:@"1"];
    
}
-(void)setRights

{
    [self addParamWithKey:@"include_entities" andValue:@"1"];
   
}

-(void)addEntities:(NSString*)value

{
    [self addParamWithKey:@"include_entities" andValue:value];
    
}
-(void)addRights:(NSString*)value

{
    [self addParamWithKey:@"include_entities" andValue:value];
    
}

-(void)addCount:(NSString*)value
{
    [params setObject:value forKey:@"count"];
    
  
}
-(void)addCursor:(NSString*)value
{
    [params setObject:value forKey:@"cursor"];
}
-(void)addParamWithKey:(NSString*)key andValue:(NSObject*)value
{
    [ self.params setValue:value forKey:key];
}
-(void)setMethodToPost
{
    self.method = TWRequestMethodPOST;
}

-(void)setMethodToGet
{
    self.method = TWRequestMethodGET;
}

-(void)executeRequest
{
    [self grandAccess];
}
-(void)executeRequestWithAccount:(ACAccount*)account
{
    
    TWRequest *request = [[TWRequest alloc] initWithURL:[NSURL URLWithString:self.url]
                          
                                             parameters:[self getPostParams]
                          
                                          requestMethod:self.method];
    
    [request setAccount:account];
    
    
        
    [request performRequestWithHandler:
     
     ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
         if([self.twitterResultantDelegate respondsToSelector:@selector(twitterRequestDidRecieveResult:WithResponseCode:andUTF8String:andType:)])
         {
             
             NSString *responseBody = [[NSString alloc] initWithData:responseData
                                                            encoding:NSUTF8StringEncoding];
             [self.twitterResultantDelegate twitterRequestDidRecieveResult:responseData  WithResponseCode:[urlResponse statusCode] andUTF8String:responseBody andType:self.type];
         }

         if([self.twitterResultantDelegate respondsToSelector:@selector(twitterRequestDidRecieveResult:andUTF8String:andType:)])
         {
             
             NSString *responseBody = [[NSString alloc] initWithData:responseData
                                                            encoding:NSUTF8StringEncoding];
             [self.twitterResultantDelegate twitterRequestDidRecieveResult:responseData andUTF8String:responseBody andType:self.type];
         }
         
         if([self.twitterResultantDelegate respondsToSelector:@selector(twitterRequestDidRecieveError:andType:)])
         {
             [self.twitterResultantDelegate twitterRequestDidRecieveError:error andType:self.type];
         }
     }];

}

-(void)grandAccess
{
    
    ACAccountStore *store = [[ACAccountStore alloc] init];
    
    ACAccountType *twitterAccountType =
    
    [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    
    
    //  Request permission from the user to access the available Twitter accounts
    
    [store requestAccessToAccountsWithType:twitterAccountType
     
                     withCompletionHandler:^(BOOL granted, NSError *error) {
                         
                         if (!granted) {
                             
                             NSLog(@"user access not granded");
                             
                         }
                         
                         else {
                             NSArray *twitterAccounts =
                             
                             [store accountsWithAccountType:twitterAccountType];
                             
                             
                             
                             if ([twitterAccounts count] > 0) {
                                 
                                 // Use the first account for simplicity
                                 
                                 ACAccount *account = [twitterAccounts objectAtIndex:0];
                                 [self executeRequestWithAccount:account];
                             }
                             // Grab the available accounts
                         }}];
}

-(NSMutableDictionary*) getPostParams
{
    return self.params;
}
@end
