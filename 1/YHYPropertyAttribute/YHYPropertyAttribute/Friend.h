//
//  Friend.h
//  YHYPropertyAttribute
//
//  Created by ByteDance on 2022/8/4.
//

#import "person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Friend : Person <personDelegate>

@property (nonatomic, strong) Person *myFriend;

- (void)walkDog;

@end

NS_ASSUME_NONNULL_END
