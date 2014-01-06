//
//  FacebookPhotoUpload.h
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 04/02/13.
//  Copyright (c) 2013 digitalbranddgroup. All rights reserved.
//

#import "FacebookRequest.h"

@interface FacebookPhotoUpload : FacebookRequest
-(id)init;
-(void)executeRequest;
-(void)setPhoto:(UIImage*)image;
-(void)setMessage:(NSString*)message;
@end
