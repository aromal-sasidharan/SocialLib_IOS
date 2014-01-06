//
//  TwitterProfileRequest.h
//  SocialConnectLibrary
//
//  Created by dbgmacmini2 dbg on 06/11/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterBaseRequest.h"
#import "Jastor.h"
/*
 
 
 "contributors_enabled" = 0;
 "created_at" = "Thu Sep 20 06:27:55 +0000 2012";
 "default_profile" = 1;
 "default_profile_image" = 0;
 description = "";
 "favourites_count" = 0;
 "follow_request_sent" = 0;
 "followers_count" = 2;
 following = 0;
 "friends_count" = 4;
 "geo_enabled" = 0;
 id = 834917840;
 "id_str" = 834917840;
 "is_translator" = 0;
 lang = en;
 "listed_count" = 0;
 location = "";
 name = "aromal sasidharan";
 notifications = 0;
 "profile_background_color" = C0DEED;
 "profile_background_image_url" = "http://a0.twimg.com/images/themes/theme1/bg.png";
 "profile_background_image_url_https" = "https://si0.twimg.com/images/themes/theme1/bg.png";
 "profile_background_tile" = 0;
 "profile_image_url" = "http://a0.twimg.com/profile_images/2629315985/306174b5781d9140da8d02029733b53a_normal.jpeg";
 "profile_image_url_https" = "https://si0.twimg.com/profile_images/2629315985/306174b5781d9140da8d02029733b53a_normal.jpeg";
 "profile_link_color" = 0084B4;
 "profile_sidebar_border_color" = C0DEED;
 "profile_sidebar_fill_color" = DDEEF6;
 "profile_text_color" = 333333;
 "profile_use_background_image" = 1;
 protected = 0;
 "screen_name" = "aromal_anchal";
 status =     {
 contributors = "<null>";
 coordinates = "<null>";
 "created_at" = "Wed Oct 24 07:47:44 +0000 2012";
 favorited = 0;
 geo = "<null>";
 id = 261011074680229888;
 "id_str" = 261011074680229888;
 "in_reply_to_screen_name" = "<null>";
 "in_reply_to_status_id" = "<null>";
 "in_reply_to_status_id_str" = "<null>";
 "in_reply_to_user_id" = "<null>";
 "in_reply_to_user_id_str" = "<null>";
 place = "<null>";
 "retweet_count" = 0;
 retweeted = 0;
 source = "<a href=\"http://www.digitalbrandgroup.com\" rel=\"nofollow\">TweetAppDBG1</a>";
 text = "Already Updated. 2012-10-24 07:47:42 +0000";
 truncated = 0;
 };
 "statuses_count" = 26;
 "time_zone" = "<null>";
 url = "<null>";
 "utc_offset" = "<null>";
 verified = 0;
 
 
 
 */

@interface TwitterProfileModel : Jastor
@property(nonatomic,copy)NSString* screen_name;
@property(nonatomic,copy)NSString* id;
@property(nonatomic,copy)NSString* profile_image_url;
@property(nonatomic,copy)NSString* name;
@end

@interface TwitterProfileRequest : TwitterBaseRequest
-(id)init;
@end
