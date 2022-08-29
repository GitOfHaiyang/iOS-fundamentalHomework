//
//  YHYSortAlgorithm.m
//  SortAlgorithm
//
//  Created by ByteDance on 2022/8/8.
//

#import "YHYSortAlgorithm.h"

@implementation YHYSortAlgorithm

+ (void)selectSort:(NSMutableArray *)array {
    for (int i = 0; i < array.count - 1; i ++) {
        for (int j = i; j < array.count - 1; j ++) {
            if ([array[i] intValue] > [array[j + 1] intValue]) {
                NSNumber *temp = array[i];
                array[i] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}

+ (void)quickSort:(NSMutableArray *)array leftIndex:(NSInteger)left rightIndex:(NSInteger)right {
    if(left + 1 >= right)
        return;
    NSInteger first = left;
    NSInteger last = right - 1;
    NSInteger pivot = [array[left] integerValue];
    while(first < last){
        while(first < last && pivot <= [array[last] integerValue])
            last--;
        array[first] = array[last];
        while(first < last && [array[first] integerValue] <= pivot)
            first++;
        array[last] = array[first];
    }
    array[first] = @(pivot);
    [self quickSort:array leftIndex:left rightIndex:first];
    [self quickSort:array leftIndex:first + 1 rightIndex:right];
}

+ (void)heapSort:(NSMutableArray *)array {
    for (int i = (int)array.count / 2 - 1; i >= 0; i--) {
        [self maxHeapify:array start:i end:(int)array.count - 1];
    }
    for (int i = (int)array.count - 1; i > 0; i--) {
        [array exchangeObjectAtIndex:0 withObjectAtIndex:i];
        [self maxHeapify:array start:0 end:i - 1];
    }
}

//最大堆调整
+ (void)maxHeapify:(NSMutableArray *)array start:(int)start end:(int)end {
    int dad = start;
    int son = dad * 2 + 1;
    while (son <= end) {
        if (son + 1 <= end && [array[son] intValue] < [array[son + 1] intValue]) {
            son++;
        }
        if ([array[dad] intValue] > [array[son] intValue]) {
            return;
        }else {
            [array exchangeObjectAtIndex:son withObjectAtIndex:dad];
            dad = son;
            son = dad * 2 + 1;
        }
    }
}
@end
