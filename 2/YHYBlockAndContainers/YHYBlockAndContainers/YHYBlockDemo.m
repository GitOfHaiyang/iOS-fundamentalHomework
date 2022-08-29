//
//  YHYBlockDemo.m
//  YHYBlockAndContainers
//
//  Created by ByteDance on 2022/8/5.
//

#import "YHYBlockDemo.h"

@implementation YHYBlockDemo

- (instancetype)init {
    self = [super init];
    _addBlock = ^(int a, int b){
        int tmp = a + b;
        NSLog(@"使用类声明一个block类型的属性, 加法结果：%d", tmp);
    };
    return self;
}

- (void)changleValue1 {
    NSLog(@"值捕获：");
    NSString *value = @"1";
    void (^myblock)(void) = ^{
        NSLog(@"value = %@", value);
    };
    value = @"2";
    myblock();
    NSLog(@"value = %@", value);
}

- (void)changleValue2 {
    NSLog(@"引用捕获：");
    __block NSString *value = @"1"; //__block关键字允许被修饰变量在block内被修改
    void (^myblock)(void) = ^{
        NSLog(@"value = %@", value);
        value = @"3";
    };
    value = @"2";
    myblock();
    NSLog(@"value = %@", value);
}



@end
