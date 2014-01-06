//
//  MutipleRequestHandler.h
//  FacebookUtilities
//
//  Created by dbgmacmini2 dbg on 13/07/12.
//  Copyright (c) 2012 aromalsasidharan@gmail.com. All rights reserved.
//

#import "FacebookRequest.h"


@interface MutipleRequestHandler : FacebookRequest
{
    NSMutableDictionary* params;

    
}
@property (strong, nonatomic) NSMutableArray* paramObjects;

-(void)addRelativeUrlToParameter:(NSString*)url
;
-(NSMutableDictionary*)getParams;
@end
