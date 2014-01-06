//
//  LinkedInFriendsListRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 17/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInBaseRequest.h"

#import "Jastor.h"

/*
 "_total": 40,
 "values": [
 {
 "apiStandardProfileRequest": {
 "headers": {
 "_total": 1,
 "values": [{
 "name": "x-li-auth-token",
 "value": "name:jmNi"
 }]
 },
 "url": "http://api.linkedin.com/v1/people/MpUvSR5ttG"
 },
 "firstName": "AAROMAL",
 "headline": "MANAGING DIRECTOR at GLG TECHNOLOGIES (P) LTD",
 "id": "MpUvSR5ttG",
 "industry": "Information Technology and Services",
 "lastName": "BHASKARAN",
 "location": {
 "country": {"code": "in"},
 "name": "Thiruvananthapuram Area, India"
 },
 "pictureUrl": "http://m3.licdn.com/mpr/mprx/0_r7IZBB7weGbAQdspKS4IBzELeC_jEERp-I0FBzDZBXBDva2yyWRNJvMnQ7iGdSVrAudQZtPB5vbZ",
 "siteStandardProfileRequest": {"url": "http://www.linkedin.com/profile?viewProfile=&key=88015377&authToken=jmNi&authType=name&trk=api*a182710*s190871*"}
 },

 */


@interface LinkedInFriendsListModel : Jastor

@property(nonatomic,copy) NSString* _total;
@property(nonatomic,copy) NSArray* values;
@end

@interface LinkedInFriendsListModelItem : Jastor

/*
 
 "firstName": "AAROMAL",
 "headline": "MANAGING DIRECTOR at GLG TECHNOLOGIES (P) LTD",
 "id": "MpUvSR5ttG",
 "industry": "Information Technology and Services",
 "lastName": "BHASKARAN",
 "location": {
 "country": {"code": "in"},
 "name": "Thiruvananthapuram Area, India"

*/

@property(nonatomic,copy) NSString* firstName;
@property(nonatomic,copy) NSString* lastName;
@property(nonatomic,copy) NSString* id;
@property(nonatomic,copy) NSString* pictureUrl;
@end



@interface LinkedInFriendsListRequest : LinkedInBaseRequest
-(id)initWithAccessToken:(OAToken *)accesstoken;
@end
