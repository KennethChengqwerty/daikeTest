//
//  techTestTests.m
//  techTestTests
//
//  Created by Kenneth Cheng on 10/04/2017.
//  Copyright © 2017 Kenneth Cheng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "daikeTest.h"

@interface techTestTests : XCTestCase

@end

@implementation techTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray<NSNumber *> *tmpArray = [daikeTest productArray:@[@(1),@(2),@(3),@(4)]];
    
    NSLog(@"%@",tmpArray);
    XCTAssertEqual(tmpArray[0].intValue,24,@"错误");
    XCTAssertEqual(tmpArray[1].intValue,12,@"错误");
    XCTAssertEqual(tmpArray[2].intValue,8,@"错误");
    XCTAssertEqual(tmpArray[3].intValue,6,@"错误");
    
    NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithObjects:@(1),@(0),@(3),@(4), nil];
    [daikeTest numberFirst:array];
    
    XCTAssertEqual(array[0].intValue,1,@"错误");
    XCTAssertEqual(array[1].intValue,3,@"错误");
    XCTAssertEqual(array[2].intValue,4,@"错误");
    XCTAssertEqual(array[3].intValue,0,@"错误");
    
    float tmp = [daikeTest simpleRootSquare:2];
    XCTAssertEqualWithAccuracy(tmp, 1.414, 0.001);
    
    double pow = [daikeTest power:2 withN:3];
    XCTAssertEqual(pow, 8,@"cuowu");
    
    int width = 99;
    int height = 99;
    NSMutableArray *boardArray = [NSMutableArray arrayWithCapacity:width];
    for (int i = 0; i<width; i++) {
        NSMutableArray *boardArray2 = [NSMutableArray arrayWithCapacity:height];
        boardArray[i] = boardArray2;
        for (int j = 0; j<height; j++) {
            int random = arc4random_uniform(2);
            boardArray2[j] = @(random);
        }
    }
    
    NSArray *boardResult = [daikeTest gameOfLife:boardArray];
    NSLog(@"%@",boardResult);
    XCTAssertNotNil(boardResult);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
