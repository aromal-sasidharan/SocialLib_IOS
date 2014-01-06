//
//  TwitterUserLookUpRequest.h
//  SocialConnect
//
//  Created by dbgmacmini2 dbg on 24/10/12.
//  Copyright (c) 2012 digitalbranddgroup. All rights reserved.
//

#import "TwitterBaseRequest.h"
#import "Jastor.h"


/*
 
 
 {
 "contributors_enabled" = 0;
 "created_at" = "Sun Feb 01 08:07:47 +0000 2009";
 "default_profile" = 1;
 "default_profile_image" = 0;
 description = "";
 entities =         {
 description =             {
 urls =                 (
 );
 };
 };
 "favourites_count" = 1;
 "follow_request_sent" = 0;
 "followers_count" = 15;
 following = 0;
 "friends_count" = 19;
 "geo_enabled" = 0;
 id = 19850847;
 "id_str" = 19850847;
 "is_translator" = 0;
 lang = en;
 "listed_count" = 0;
 location = dubai;
 name = sajin;
 notifications = 0;
 "profile_background_color" = C0DEED;
 "profile_background_image_url" = "http://a0.twimg.com/images/themes/theme1/bg.png";
 "profile_background_image_url_https" = "https://si0.twimg.com/images/themes/theme1/bg.png";
 "profile_background_tile" = 0;
 "profile_image_url" = "http://a0.twimg.com/profile_images/74529928/sajin_face_normal.png";
 "profile_image_url_https" = "https://si0.twimg.com/profile_images/74529928/sajin_face_normal.png";
 "profile_link_color" = 0084B4;
 "profile_sidebar_border_color" = C0DEED;
 "profile_sidebar_fill_color" = DDEEF6;
 "profile_text_color" = 333333;
 "profile_use_background_image" = 1;
 protected = 0;
 "screen_name" = tmsajin;
 status =         {
 contributors = "<null>";
 coordinates = "<null>";
 "created_at" = "Wed Oct 24 14:56:09 +0000 2012";
 entities =             {
 hashtags =                 (
 );
 urls =                 (
 );
 "user_mentions" =                 (
 {
 id = 834917840;
 "id_str" = 834917840;
 indices =                         (
 0,
 14
 );
 name = "aromal sasidharan";
 "screen_name" = "aromal_anchal";
 }
 );
 };
 favorited = 0;
 geo = "<null>";
 id = 261118892322201600;
 "id_str" = 261118892322201600;
 "in_reply_to_screen_name" = "aromal_anchal";
 "in_reply_to_status_id" = 261011074680229888;
 "in_reply_to_status_id_str" = 261011074680229888;
 "in_reply_to_user_id" = 834917840;
 "in_reply_to_user_id_str" = 834917840;
 place = "<null>";
 "retweet_count" = 0;
 retweeted = 0;
 source = web;
 text = "@aromal_anchal  hi";
 truncated = 0;
 };
 "statuses_count" = 18;
 "time_zone" = "Abu Dhabi";
 url = "<null>";
 "utc_offset" = 14400;
 verified = 0;
 },
  )

 
 
 if([self.twitterFollwersRequest.type isEqualToString:type]){
 TwitterFollowerModel* twitterFollowerModel = [[TwitterFollowerModel alloc]initWithDictionary:[data getDictionary]];
 self.twitterUserLookUpRequest = [[TwitterUserLookUpRequest alloc]init];
 [self.twitterUserLookUpRequest setFriends:twitterFollowerModel.ids];
 self.twitterUserLookUpRequest.twitterResultantDelegate =self;
 [self.twitterUserLookUpRequest executeRequest];
 
 }
 else if([self.twitterUserLookUpRequest.type isEqualToString:type])
 {
 NSDictionary* values = [NSDictionary dictionaryWithObjectsAndKeys:[data getDictionary],@"values", nil];
 TwitterUserLookModel* twitterUserLookModel = [[TwitterUserLookModel alloc]initWithDictionary:values];
 
 for(TwitterUserLookModelItem* twitterUserLookModelItem in twitterUserLookModel.values)
 {
 NSLog(@"screen name is %@",twitterUserLookModelItem.screen_name);
 }
 }

 
 */


@interface TwitterUserLookModel:Jastor

@property(copy,nonatomic)NSArray* values;

@end

@interface TwitterUserLookModelItem:Jastor

@property(copy,nonatomic)NSString* profile_image_url;
@property(copy,nonatomic)NSString* screen_name;
@property(copy,nonatomic)NSString* id;
@property(copy,nonatomic)NSString* name;
@end




@interface TwitterUserLookUpRequest : TwitterBaseRequest
{
    NSMutableArray* friendsIds;
}
-(NSMutableDictionary *)getPostParams;
-(void)addFriendId:(NSString*)friendId;
-(void)setFriends:(NSArray*)friendIds;
@end
