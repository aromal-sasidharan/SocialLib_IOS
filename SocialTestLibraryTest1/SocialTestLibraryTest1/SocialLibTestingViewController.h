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
@interface SocialLibTestingViewController : UIViewController<TwitterLoginDelegate,TwitterResultantDelegate,LinkedInLoginDelegate>

@property(strong,nonatomic) TwitterProfileRequest* twitterProfileRequest;
-(IBAction)loginFacebook:(id)sender;
-(IBAction)loginTwitter:(id)sender;
@end
