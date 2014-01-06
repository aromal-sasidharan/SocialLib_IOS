//
//  NSData+SBJson.m
//  Party Whale
//
//  Created by dbgmacmini2 dbg on 18/07/12.
//  Copyright (c) 2012 DBG. All rights reserved.
//

#import "NSData+SBJson.h"

@implementation NSData(FBSBJSON)

- (NSDictionary*)getDictionary
{
    
    @try {
        FBSBJSON* sbJson = [[FBSBJSON alloc]init];
        NSString* dataString = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
        //    NSLog(@"Datas\n%@\n",dataString);
        return [sbJson objectWithString:dataString];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception %@",exception);
          return nil;
    }
    @finally {
      
    }

        
    

}
@end
