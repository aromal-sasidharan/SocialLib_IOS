//
//  MutipleRequestHandler.m
//  FacebookUtilities
//
//  Created by dbgmacmini2 dbg on 13/07/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "MutipleRequestHandler.h"
#import "FBSBJSON.h"
@implementation MutipleRequestHandler
@synthesize paramObjects;
-(id)init{
    self = [super initWithGraphPath:@"/"];
  
    params = [[NSMutableDictionary alloc]init];
    paramObjects = [[NSMutableArray alloc]init];
    self.type = @"MutipleRequestHandler";
    return self;
}


-(void)addRelativeUrlToParameter:(NSString*)url
{
    NSDictionary* friend = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"GET",@"method",url,@"relative_url", nil];
    [self.paramObjects addObject:friend];
}
-(NSMutableDictionary*)getParams

{
    FBSBJSON *json = [[FBSBJSON alloc] init];
    NSError* aError=nil;
    
    
    NSString *jsonString = [json stringWithObject:paramObjects error:&aError];
    if(aError==nil){
        
        
        params = [NSMutableDictionary dictionaryWithObject:jsonString forKey:@"batch"];
        
    }
    else {
        NSLog(@"Error in Constructin json \n %@",aError);
    }
    return params;
}

@end
