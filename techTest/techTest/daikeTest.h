//
//  daikeTest.h
//  techTest
//
//  Created by Kenneth Cheng on 10/04/2017.
//  Copyright © 2017 Kenneth Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface daikeTest : NSObject
+(NSArray *)productArray:(NSArray<NSNumber *> *)nums;
+(void)numberFirst:(NSMutableArray<NSNumber *> *)nums;
+(float)simpleRootSquare:(float)x;
+(double)power:(double)x withN:(int)n;
+(NSArray *)gameOfLife:(NSMutableArray<NSMutableArray<NSNumber *> *> *)board;
@end
