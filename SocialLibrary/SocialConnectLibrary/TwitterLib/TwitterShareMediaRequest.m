//
//  TwitterShareMediaRequest.m
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 06/01/14.
//  Copyright (c) 2014 digitalbranddgroup. All rights reserved.
//

#import "TwitterShareMediaRequest.h"

@implementation TwitterShareMediaRequest
@synthesize type,twitterResultantDelegate;
-(id)init
{
    self = [super initWithURL:[NSURL URLWithString:TWITTER_SHARE_MEDIA_URL] parameters:NULL requestMethod:TWRequestMethodPOST];
    
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

-(void)executeRequest
{
    [self grandAccess];
}
-(void)executeRequestWithAccount:(ACAccount*)account
{
    

    
    [self setAccount:account];
    
    
    
    [self performRequestWithHandler:
     
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
