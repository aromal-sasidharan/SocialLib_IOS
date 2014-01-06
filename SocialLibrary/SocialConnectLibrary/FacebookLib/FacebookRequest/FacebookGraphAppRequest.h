//
//  FacebookGraphAppRequest.h
//  MyStand
//
//  Created by Deepu Viswanath on 27/05/13.
//  Copyright (c) 2013 Digital Brand Group Inc. All rights reserved.
//

#import "FacebookRequest.h"

@interface FacebookGraphAppRequest : FacebookRequest

{
    NSMutableDictionary* requestData;
  
    NSMutableArray* friends;
}
-(id)init;

-(void)addMessage:(NSString*)message;
-(void)addDataWithName:(NSString*)name andValue:(NSString*)value;
-(void)addFriendId:(NSString*)aFacebookFriendId;
-(void)executeRequest;
-(void)setAccesstoken:(NSString*)accesstoken;
-(void)setPostParams;
@end
