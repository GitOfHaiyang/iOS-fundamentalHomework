//
//  YHYBlockDemo.h
//  YHYBlockAndContainers
//
//  Created by ByteDance on 2022/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^AddBlock)(int, int);
@interface YHYBlockDemo : NSObject

@property (nonatomic, copy) AddBlock addBlock;

//值捕获
- (void)changleValue1;
//引用捕获
- (void)changleValue2;
@end

NS_ASSUME_NONNULL_END
