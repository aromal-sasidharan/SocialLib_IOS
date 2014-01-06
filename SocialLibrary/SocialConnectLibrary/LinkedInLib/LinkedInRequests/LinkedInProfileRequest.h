//
//  LinkedInProfileRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 01/11/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "LinkedInBaseRequest.h"
#import "LinkedInConstants.h"
#import "Jastor.h"
/*
2012-11-05 17:39:56.088 SocialLibraryTesting[2045:11303] {
    "firstName": "aromal",
    "headline": "Software Engineer at Digital Brand Group, Inc.",
    "lastName": "sasidharan",
    "siteStandardProfileRequest": {"url": "http://www.linkedin.com/profile?viewProfile=&key=116288724&authToken=0G46&authType=name&trk=api*a182710*s190871*"}
}

2012-11-05 22:29:28.068 SocialLibraryTesting[2725:19a03] {
    firstName = aromal;
    id = "RfEfSfL_Kw";
    lastName = sasidharan;
    publicProfileUrl = "http://www.linkedin.com/pub/aromal-sasidharan/32/b40/870";
}

*/
@interface LinkedInProfileModel :Jastor

@property(nonatomic,copy) NSString* firstName;
@property(nonatomic,copy) NSString* id;
@property(nonatomic,copy) NSString* lastName;
@property(nonatomic,copy) NSString* publicProfileUrl;


@end

@interface LinkedInProfileRequest : LinkedInBaseRequest
-(id)initWithAccessToken:(OAToken *)accesstoken;

@end
