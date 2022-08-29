//
//  YHYContainers.h
//  YHYBlockAndContainers
//
//  Created by ByteDance on 2022/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHYContainers : NSObject

@property (nonatomic, copy) NSArray *myArray;
@property (nonatomic, copy) NSDictionary *myDictionary;
@property (nonatomic, copy) NSSet *mySet;
@property (nonatomic, strong) NSMutableArray *myMutableArray;
@property (nonatomic, strong) NSMutableDictionary *myMutableDictionary;
@property (nonatomic, strong) NSMutableSet *myMutableSet;

@end

NS_ASSUME_NONNULL_END
