//
//  YHYSortAlgorithm.h
//  SortAlgorithm
//
//  Created by ByteDance on 2022/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHYSortAlgorithm : NSObject

+ (void)selectSort:(NSMutableArray *)array;
+ (void)quickSort:(NSMutableArray *)array leftIndex:(NSInteger)left rightIndex:(NSInteger)right;
+ (void)heapSort:(NSMutableArray *)array;

@end

NS_ASSUME_NONNULL_END
