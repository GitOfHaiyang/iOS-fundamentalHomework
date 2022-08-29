//
//  main.m
//  SortAlgorithm
//
//  Created by ByteDance on 2022/8/8.
//

#import "YHYSortAlgorithm.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSMutableArray *myArray0 = [@[@3,@4,@10,@7,@1] mutableCopy];
        NSMutableArray *myArray1 = [myArray0 mutableCopy];
        NSMutableArray *myArray2 = [myArray0 mutableCopy];
        NSMutableArray *myArray3 = [myArray0 mutableCopy];
        
        [YHYSortAlgorithm quickSort:myArray1 leftIndex:0 rightIndex:myArray1.count];
        [YHYSortAlgorithm selectSort:myArray2];
        [YHYSortAlgorithm heapSort:myArray3];
        if([myArray1 isEqualToArray:myArray2] && [myArray1 isEqualToArray:myArray3])
            NSLog(@"排序前：%@, 排序后：%@", myArray0, myArray1);
    }
    return 0;
}
