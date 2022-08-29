//
//  person.h
//  YHYPropertyAttribute
//
//  Created by ByteDance on 2022/8/4.
//

#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@protocol personDelegate <NSObject>

- (void)walkDog;

@end

@interface Person : NSObject

@property (nonatomic, strong) Dog *dog;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, weak) id<personDelegate> delegate;
@property (nonatomic, assign) float height;

@property (nonatomic, strong) NSString *nameStrong;
@property (nonatomic, copy) NSString *nameCopy;

@property (nonatomic, copy, readwrite, getter=theNewName, setter=setTheNewName:) NSString *newName;
//@property (nonatomic, copy, readwrite) NSString *nameNew;

- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
