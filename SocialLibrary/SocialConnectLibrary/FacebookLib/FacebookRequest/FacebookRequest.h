#import <Foundation/Foundation.h>
#import "FBConnect.h"
#import "FBRequest.h"

#import "FBSession.h"
@class FacebookRequest;

@protocol FacebookResutantDelegate <NSObject>
@required
-(void)resultsReceived:(id)result fromRequestType:(NSString*)type;
@optional
-(void)errorReceived:(NSError*)error;



@end

@interface FacebookRequest : NSObject
@property NSString* graphPath;

@property(nonatomic,strong)NSString* type;
@property(nonatomic) id<FacebookResutantDelegate> facebookResutantDelegate;
@property(nonatomic,strong)NSMutableDictionary* postParams;
@property(nonatomic,strong)FBRequest* facebookRequest;

@property(nonatomic,strong)NSString* postMethod;
-(id)initWithGraphPath:(NSString*) aGraphPath;


-(void)setMethodToPOST;
-(void)setMethodToGET;

-(void)executeRequest;
@end
