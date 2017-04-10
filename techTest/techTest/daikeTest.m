//
//  daikeTest.m
//  techTest
//
//  Created by Kenneth Cheng on 10/04/2017.
//  Copyright © 2017 Kenneth Cheng. All rights reserved.
//

#import "daikeTest.h"

@implementation daikeTest

/*
 1. Product array
 
 Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 Solve it without division and in O(n).
 
 For example, given [1,2,3,4], return [24,12,8,6].
 */
+(NSArray *)productArray:(NSArray<NSNumber *> *)nums{
    
    if(nums.count <=1){
        NSLog(@"number of array must over 1!");
        return nil;
    }
    
    NSMutableArray *output = [NSMutableArray arrayWithCapacity:nums.count];
    output[0] = @(1);
    for (int i = 1 ; i<nums.count; i++) {
        output[i] = @([output[i-1] intValue] * [nums[i-1] intValue]);
    }
    
    int tmpProduct = 1;
    for(int i= nums.count -2; i>=0;i--){
        
        tmpProduct *= [nums[i+1] intValue];
        output[i] = @([output[i] intValue] *tmpProduct);
    }
    
    NSLog(@"%@",output);
    return output.copy;
}

/*
 2. Number first
 
 Given an array nums, write a function to move all non-zero numbers to the head of it while maintaining the relative order of the non-zero numbers.
 
 For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
 Note: You must do this in-place without making a copy of the array. Minimize the total number of operations.
 */
+(void)numberFirst:(NSMutableArray<NSNumber *> *)nums{
    
    int index =0;
    for(int i= 0;i<nums.count;i++){
        
        if([nums[i] intValue] != 0){
            nums[index] = nums[i];
            index++;
        }
    }
    
    for(int j = index;j<nums.count;j++){
        nums[j] = @(0);
    }
    
    NSLog(@"%@",nums);
}

/*
 3. Game of Life
 
 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."
 
 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):
 
 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction. Write a function to compute the next state (after one update) of the board given its current state.
 Follow up:
 
 Could you solve it in-place? Remember that the board needs to be updated at the same time: You cannot update some cells first and then use their updated values to update other cells.
 In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches the border of the array. How would you address these problems?
 */

enum {
    //0000
    LiveStateDeadToDead,
    //0001
    LiveStateLiveToDead,
    //0010
    LiveStateDeadToLive,
    //0011
    LiveStateLiveToLive
}LiveState;

+(NSArray *)gameOfLife:(NSMutableArray<NSMutableArray<NSNumber *> *> *)board{

    if(board[0] == nil)
        return nil;
    
    int height = board[0].count;
    int width = board.count;
    
    if(height == 0 || width == 0 ||board == nil)
        return nil;
    
    for (int i =0; i<width; i++) {
        for (int j = 0; j<height; j++) {
            int aroundNumber = [self getLiveNumber:board withRow:i column:j];
            if([board[i][j] intValue] == 1 &&(aroundNumber == 2 || aroundNumber == 3)){
                board[i][j] = @(3);
            }else if ([board[i][j] intValue] == 0 && aroundNumber == 3)
                board[i][j] = @(2);
        }
    }
    
    for (int i = 0; i < height; ++i) {
        for (int j = 0; j < width; ++j) {
            int updateValue = [board[i][j] intValue];
            updateValue = updateValue >> 1;
            board[i][j] = @(updateValue);
        }
    }
    
    return board;
}

+(int)getLiveNumber:(NSMutableArray<NSMutableArray<NSNumber *> *> *)board withRow:(int)x column:(int)y{

    int number = 0;
    int height = board[0].count;
    int width = board.count;
    
    for (int i =MAX(x-1, 0); i<MIN(x+1, width); i++) {
        for (int j = MAX(y-1, 0); j<MIN(y+1, height); j++) {
            number +=[board[i][j] intValue] & 1;
        }
    }
    
    number -=[board[x][y] intValue] & 1;
    
    return number;
}

/*
 4. Simple root square
 
 Implement int sqrt(int x).
 
 Compute and return the square root of x.
 */

+(float)simpleRootSquare:(float)x{

    //quick3
    float xhalf = 0.5f*x;
    int i = *(int*)&x;
    i = 0x5f375a86- (i>>1);
    x = *(float*)&i;
    x = x*(1.5f-xhalf*x*x);

    return 1/x;
}

/*
 5. Power
 
 Implement pow(x, n).
 */
+(double)power:(double)x withN:(int)n{
    if (n == 0)
        return 1.0;
    
    double half = [daikeTest power:x withN:n/2];
    if (n%2 == 0)
    {
        return half*half;
    }
    else if (n>0)
    {
        return half*half*x;
    }
    else
    {
        return half/x*half;
    }
}
@end
