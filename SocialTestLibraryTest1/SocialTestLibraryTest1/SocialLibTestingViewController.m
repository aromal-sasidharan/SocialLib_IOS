//
//  SocialLibTestingViewController.m
//  SocialTestLibraryTest1
//
//  Created by dbgmacmini2 dbg on 26/11/12.
//  Copyright (c) 2012 dbgmacmini2 dbg. All rights reserved.
//

#import "SocialLibTestingViewController.h"
#import "SocialLibTestingAppDelegate.h"
#import "NSData+SBJson.h"
@interface SocialLibTestingViewController ()

@end

@implementation SocialLibTestingViewController
@synthesize aTwitterShareRequest,aFacebookAppRequest;
- (void)viewDidLoad
{
    [super viewDidLoad];
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)facebookLoginFailed
{
    
    
    
    
    
}
-(void)facebookLoginSucess:(FBSession *)session
{
    NSLog(@"access token is %@",session.accessToken);
}
-(void)loginFacebook:(id)sender
{
    SocialLibTestingAppDelegate* aSocialLibTestingAppDelegate = (SocialLibTestingAppDelegate*)[[UIApplication sharedApplication]delegate];
    
    aSocialLibTestingAppDelegate.fBLoginViewDelegate = self;
    [aSocialLibTestingAppDelegate openFacebookSession];
}
-(void)loginTwitter:(id)sender
{ SocialLibTestingAppDelegate* aSocialLibTestingAppDelegate = (SocialLibTestingAppDelegate*)[[UIApplication sharedApplication]delegate];
    [aSocialLibTestingAppDelegate grandAccessToTwitterWithDelegate:self];


//    SocialLibTestingAppDelegate* aSocialLibTestingAppDelegate = (SocialLibTestingAppDelegate*)[[UIApplication sharedApplication]delegate];
//    aSocialLibTestingAppDelegate.linkedInLoginDelegate = self;
//    [aSocialLibTestingAppDelegate linkedInLogin:self];

}

- (IBAction)twitterPostSample:(id)sender {
    
    aTwitterShareRequest = [[TwitterShareRequest alloc] init];
    
    [aTwitterShareRequest addStatus:@"Python Logo Here"];
    aTwitterShareRequest.twitterResultantDelegate = self;
    [aTwitterShareRequest executeRequest];
    
}

- (IBAction)sendFbNotification:(id)sender {
    
    aFacebookAppRequest = [[FacebookAppRequest alloc]init];
    [aFacebookAppRequest addMessage:@"hi message"];
    [aFacebookAppRequest addDataWithName:@"data1" andValue:@"value1"];
     [aFacebookAppRequest addDataWithName:@"datan" andValue:@"valuen"];
    [aFacebookAppRequest addFriendId:@"100002655314473"];
    
    SocialLibTestingAppDelegate* aSocialLibTestingAppDelegate = (SocialLibTestingAppDelegate*)[[UIApplication sharedApplication]delegate];
    [aSocialLibTestingAppDelegate openDialogWith:aFacebookAppRequest andDelegate:self];
    
    
}
-(void)twitterRequestDidRecieveError:(NSError *)error andType:(NSString *)Type
{
    NSLog(@"%@",error);
}
-(void)twitterRequestDidRecieveResult:(NSData *)data andUTF8String:(NSString *)utf8String andType:(NSString *)type
{
    
    
   // NSDictionary* dict = [data getDictionary];
    NSLog(@"Data %@",[data getDictionary]);
       
}

-(void)linkedInLoginSuccess
{
    NSLog(@"longin success");
}
-(void)twitterAccountNotConfigured
{
    NSLog(@"not granded");
       
}
-(void)twitterLoginSuccess
{
    NSLog(@"granded");
   self.twitterProfileRequest = [[TwitterProfileRequest alloc]init];
    self.twitterProfileRequest.twitterResultantDelegate = self;
    [self.twitterProfileRequest executeRequest];
}
-(void)facebookDialogClosedWithUrl:(NSDictionary*)params
{
    NSLog(@"params recived %@",params);
}
@end
