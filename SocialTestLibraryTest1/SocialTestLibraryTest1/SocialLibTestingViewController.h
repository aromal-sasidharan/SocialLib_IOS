//
//  SocialLibTestingViewController.h
//  SocialTestLibraryTest1
//
//  Created by dbgmacmini2 dbg on 26/11/12.
//  Copyright (c) 2012 dbgmacmini2 dbg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialLibTestingAppDelegate.h"
#import "TwitterProfileRequest.h"
#import "TwitterShareRequest.h"
@interface SocialLibTestingViewController : UIViewController<TwitterLoginDelegate,TwitterResultantDelegate,LinkedInLoginDelegate,FacebookRequestDialogDelegate>

@property(strong,nonatomic) TwitterProfileRequest* twitterProfileRequest;
@property(strong,nonatomic) TwitterShareRequest* aTwitterShareRequest;
@property(strong,nonatomic) FacebookAppRequest* aFacebookAppRequest;
-(IBAction)loginFacebook:(id)sender;
-(IBAction)loginTwitter:(id)sender;
- (IBAction)twitterPostSample:(id)sender;
- (IBAction)sendFbNotification:(id)sender;
@end
