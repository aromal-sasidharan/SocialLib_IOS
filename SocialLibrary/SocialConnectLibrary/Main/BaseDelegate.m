//
//  BaseDelegate.m
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 10/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "BaseDelegate.h"

@implementation BaseDelegate
@synthesize fBLoginViewDelegate;
@synthesize linkedInaccesstoken;
@synthesize oAuthLoginView;
@synthesize linkedInLoginDelegate;
@synthesize facebook,facebookRequestDialogDelegate;
@synthesize isTwitterAccount;
-(id)init
{
    
    self = [super init];
     oAuthLoginView = [[OAuthLoginView alloc] initWithNibName:@"OAuthLoginView" bundle:nil];
    self.linkedInaccesstoken = [[OAToken alloc]initWithUserDefaultsUsingServiceProviderName:@"mystand" prefix:@"mystand.com"];
    return self;
    
}
- (void)openFacebookSession
{
    
    NSArray *permissions = [[NSArray alloc] initWithObjects:
                            //@"user_likes",
                            //@"read_stream",
                            @"publish_stream",
                            @"user_events",
                            @"read_friendlists",
                            @"user_birthday",
                            @"email",
                            @"manage_notifications",
                            nil];
    
    [FBSession openActiveSessionWithPermissions:permissions  allowLoginUI:YES
                              completionHandler:
     ^(FBSession *session,
       FBSessionState state, NSError *error) {
         NSLog(@"state %d", state);
         [self sessionStateChanged:session state:state error:error];
     }];
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen:
            
            NSLog(@"FBSessionStateOpen");
            self.facebook = [[Facebook alloc]
                             initWithAppId:FBSession.activeSession.appID
                             andDelegate:nil];
            
            // Store the Facebook session information
            self.facebook.accessToken = FBSession.activeSession.accessToken;
            self.facebook.expirationDate = FBSession.activeSession.expirationDate;
            if([self.fBLoginViewDelegate respondsToSelector:@selector(facebookLoginSucess:)])
            {
                [self.fBLoginViewDelegate facebookLoginSucess:session];
            }
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            // Once the user has logged in, we want them to
            // be looking at the root view.
            
            [FBSession.activeSession closeAndClearTokenInformation];
            
            if([self.fBLoginViewDelegate respondsToSelector:@selector(facebookLoginFailed)])
            {
                [self.fBLoginViewDelegate facebookLoginFailed];
            }
            break;
        default:
            break;
    }
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@""
                                  message:@"Could not complete the operation"
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}


-(void)logoutFromFacebook
{
    [FBSession.activeSession closeAndClearTokenInformation];
    [self.facebook logout];
    
}
- (BOOL)applications: (UIApplication *)application
             openURL: (NSURL *)url
   sourceApplication: (NSString *)sourceApplication
          annotation: (id)annotation {
    //    NSLog(@"callback %@",[url absoluteString]);
    //    if ([self.googlePlusSignInButton handleURL:url
    //                             sourceApplication:sourceApplication
    //                                    annotation:annotation]) {
    //        return YES;
    //    }
    
    if([FBSession.activeSession handleOpenURL:url])
        
    {
        return YES;
    }
    //    if([self.googlePlusShare handleURL:url sourceApplication:sourceApplication annotation:annotation])
    //    {
    //        return YES;
    //    }
    return NO;
}
-(void)linkedInLogin:(UIViewController*)controller

{
    
    
    if(self.linkedInaccesstoken.key==nil)
    {
       
        ;
        
        // register to be told when the login is finished
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(loginViewDidFinish:)
                                                     name:@"loginViewDidFinish"
                                                   object:oAuthLoginView];
        
        [controller presentModalViewController:oAuthLoginView animated:YES];
    }
    else
    {
        NSLog(@"linked accesstoken %@",self.linkedInaccesstoken.key);
        
        if([self.linkedInLoginDelegate respondsToSelector:@selector(linkedInLoginSuccess)])
        {
            [self.linkedInLoginDelegate linkedInLoginSuccess];
        }
    }
    
    
}
-(void) loginViewDidFinish:(NSNotification*)notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // We're going to do these calls serially just for easy code reading.
    // They can be done asynchronously
    // Get the profile, then the network updates
    [oAuthLoginView.accessToken storeInUserDefaultsWithServiceProviderName:@"mystand" prefix:@"mystand.com"];
    self.linkedInaccesstoken = [[OAToken alloc]initWithUserDefaultsUsingServiceProviderName:@"mystand" prefix:@"mystand.com"];
    NSLog(@"accesstoken recived %@",oAuthLoginView.accessToken.key);
    if([self.linkedInLoginDelegate respondsToSelector:@selector(linkedInLoginSuccess)])
    {
        [self.linkedInLoginDelegate linkedInLoginSuccess];
    }
    
	//[self profileApiCall];
}
-(void)openDialogWith:(FacebookAppRequest*)facebookAppRequest andDelegate:(id<FacebookRequestDialogDelegate>) aFacebookRequestDialogDelegate
{
    self.facebookRequestDialogDelegate = aFacebookRequestDialogDelegate;
    [self.facebook dialog:facebookAppRequest.dialogName andParams:[facebookAppRequest getPostParams] andDelegate:self];
}

- (void)dialogCompleteWithUrl:(NSURL *)url
{
    NSLog(@"dialogCompleteWithUrl");
    if([self.facebookRequestDialogDelegate respondsToSelector:@selector(facebookDialogClosedWithUrl:)])
    {
        [self.facebookRequestDialogDelegate facebookDialogClosedWithUrl:[BaseDelegate parseURLParams:[url query]]];
    }
    
    //    NSDictionary *params = [AppDelegate parseURLParams:[url query]];
    //    NSString *requestID = [params valueForKey:@"request"];
    //    NSLog(@"param %@",params);
    //    [self onNotify:requestID];
}

/**
 * Called when the dialog get canceled by the user.
 */
- (void)dialogDidNotCompleteWithUrl:(NSURL *)url
{
    NSLog(@"dialogDidNotCompleteWithUrl");
}

/**
 * Called when the dialog is cancelled and is about to be dismissed.
 */
- (void)dialogDidNotComplete:(FBDialog *)dialog
{
    NSLog(@"dialogDidNotComplete");
}

/**
 * Called when dialog failed to load due to an error.
 */
- (void)dialog:(FBDialog*)dialog didFailWithError:(NSError *)error
{
    NSLog(@"error%@",error);
}

+ (NSDictionary*)parseURLParams:(NSString *)query {
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =
        [[kv objectAtIndex:1]
         stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *key = [[kv objectAtIndex:0]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [params setObject:val forKey:key];
    }
    return params;
}

-(void)logoutFromLinkedIn
{
    
    
    [self.oAuthLoginView logoutLinkedInWithDelegate:self andAccessToken:self.linkedInaccesstoken];
    self.linkedInaccesstoken = nil;
    
    
}
-(void)linkedInLogOutSuccess
{
    NSLog(@"loged out");
    
}
-(void)linkedInLogOutFailed
{
    NSLog(@"loged out failed");
}

-(void)grandAccessToTwitterWithDelegate:(id<TwitterLoginDelegate>)twitterLoginDelegate
{
    
    ACAccountStore *store = [[ACAccountStore alloc] init];
    
    ACAccountType *twitterAccountType =
    
    [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    
    NSArray *twitterAccounts =
    
    [store accountsWithAccountType:twitterAccountType];
    
    
    
    if ([twitterAccounts count] <= 0) {
        
        // Use the first account for simplicity
        if([twitterLoginDelegate respondsToSelector:@selector(twitterAccountNotConfigured)])
        {
            
            [twitterLoginDelegate twitterAccountNotConfigured];
        }

        
        return;
        
    }
    isTwitterAccount = false;
    
    NSLog(@"Here");
    
    [store requestAccessToAccountsWithType:twitterAccountType
     
                     withCompletionHandler:^(BOOL granted, NSError *error) {
                             NSLog(@"Here iam");
                         if (!granted) {
                                NSLog(@"Here iam not granted");
                             self.isTwitterAccount = FALSE;
                            if([twitterLoginDelegate respondsToSelector:@selector(twitterAccountNotConfigured)])
                            {
                                
                                [twitterLoginDelegate twitterAccountNotConfigured];
                            }
                             
                         }
                         
                         else {
                             NSLog(@"Here iam  granted");

                              self.isTwitterAccount = TRUE;
                               self.isTwitterAccount = YES;
                             NSArray *twitterAccounts =
                             
                             [store accountsWithAccountType:twitterAccountType];
                             
                             
                             
                             if ([twitterAccounts count] > 0) {
                                  NSLog(@"Accounts found");
                                 // Use the first account for simplicity
                                 if([twitterLoginDelegate respondsToSelector:@selector(twitterLoginSuccess)])
                                 {
                                     
                                     [twitterLoginDelegate twitterLoginSuccess];
                                 }

                                 
                                 
                             }
                             else
                             {
                                 NSLog(@"Accounts not found");

                             }
                             // Grab the available accounts
                         }}];
    
    

}

-(BOOL)isLoginedToLinkedIn
{
    if(self.linkedInaccesstoken!=nil&&self.linkedInaccesstoken.key!=nil&&[self.linkedInaccesstoken.key length]>0)
    return TRUE;
    else
        return FALSE;
}
-(BOOL)isLoginedToFacebook
{
    return FBSession.activeSession.isOpen;
}


@end
