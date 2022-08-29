//
//  main.m
//  YHYBlockAndContainers
//
//  Created by ByteDance on 2022/8/5.
//

#import "YHYBlockDemo.h"
#import "YHYContainers.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#pragma mark - block用法
        //值捕获 & 引用捕获
        YHYBlockDemo *block1 = [[YHYBlockDemo alloc]init];
        NSLog(@"Block的变量捕获方式:");
        [block1 changleValue1];
        [block1 changleValue2];
        
        //在类中定义block类型的属性，实现加法
        block1.addBlock(2, 3);
        
        //局部定义block，实现减法
        void(^reductionBlock)(int, int) = ^(int a, int b){
            int res = a - b;
            NSLog(@"局部声明一个block, 减法结果：%d", res);
        };
        reductionBlock(3, 2);
        
        //block作为入参,数组遍历，获取数组中大于2的数
        __block NSInteger count = 0;
        NSArray<NSNumber *> *array = @[@0, @1, @2, @3, @4, @5];
        NSRange range = NSMakeRange(0, array.count);
        [array enumerateObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:range]
                                 options:NSEnumerationReverse
                              usingBlock:^(NSNumber * _Nonnull number, NSUInteger idx, BOOL * _Nonnull stop) {
            if (number.integerValue >= 2) {
                ++count;
            }
        }];
        NSLog(@"数组中大于2的个数：%ld个", count); // count:4
        
        //block用于GCD
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2ull * NSEC_PER_SEC));
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_after(time, mainQueue, ^{
            NSLog(@"waited at least five seconds");
        });
        
#pragma mark - 容器类NSArray/Set/Dictionary使用
        NSLog(@"----------------- 分割线----------------------");
        YHYContainers *myContainers = [[YHYContainers alloc] init];

        //1. Array 创建，是否包含某个元素，获取数量，访问某个元素
        myContainers.myArray = @[@"a", @"b", @"c"];
        if([myContainers.myArray containsObject:@"a"]){
            NSLog(@"Array元素个数:%ld, 最后一个元素为:%@", myContainers.myArray.count, myContainers.myArray[2]);
        }

        //2. MutableArray 创建，增加，改变，删除，拼接字符串，结合block进行遍历
        myContainers.myMutableArray = [NSMutableArray array];
        NSLog(@"%@", [myContainers.myMutableArray class]);
        for(int i = 0; i < 10; i++){
            [myContainers.myMutableArray addObject:[NSNumber numberWithInt:i]];
        }
        [myContainers.myMutableArray insertObject:@"insert_element" atIndex:0];
        [myContainers.myMutableArray exchangeObjectAtIndex:0 withObjectAtIndex:1];
        NSLog(@"MutableArrary元素：%@", myContainers.myMutableArray);
        [myContainers.myMutableArray removeObjectAtIndex:1];
        NSString *joinedString = [myContainers.myMutableArray componentsJoinedByString:@","];
        NSLog(@"拼接后字符串：%@", joinedString);
        //结合block遍历MutalbeArray，实现特定元素操作
        __weak typeof(myContainers) weakMyContainers = myContainers;
        [myContainers.myMutableArray enumerateObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, myContainers.myMutableArray.count)]
                                 options:NSEnumerationReverse
                              usingBlock:^(NSNumber * _Nonnull number, NSUInteger idx, BOOL * _Nonnull stop) {
            __strong typeof(weakMyContainers) strongMyContainers = weakMyContainers;
            if ((int)idx >= 3) {
                [strongMyContainers.myMutableArray removeObjectAtIndex:idx];
            }
        }];
        NSLog(@"使用block遍历只保留前3个元素：%@", myContainers.myMutableArray);
        
        //3. Set
        myContainers.mySet = [NSSet setWithObjects:myContainers.myArray, myContainers.myMutableArray, nil];
        NSLog(@"NSSet:获取元素个数：%lu，是否包含某个元素：%hhd， 获取所有元素：%@",
              (unsigned long)[myContainers.mySet count],
              [myContainers.mySet containsObject:myContainers.myArray],
              [myContainers.mySet allObjects]);
        //4. MutableSet 创建 添加 判断是否存在相同元素 求交集
        myContainers.myMutableSet = [[NSMutableSet alloc] initWithObjects:@"one", @"two", @"three", nil];
        [myContainers.myMutableSet addObjectsFromArray:myContainers.myArray]; //注意是无序的
        NSMutableSet *setForAdd = [[NSMutableSet alloc] initWithObjects:@"four", @"one", nil];
        NSLog(@"myMutableSet is %@", myContainers.myMutableSet);
        BOOL hasSameElements = [myContainers.myMutableSet intersectsSet:setForAdd]; //是否存在相同元素
        if(hasSameElements){
            [myContainers.myMutableSet intersectSet:setForAdd]; //求交集
            NSLog(@"求交集后，myMutableSet is %@", myContainers.myMutableSet);
        }
        
        //5. Dictionary 创建，block遍历，读取plist
        myContainers.myDictionary = @{@"k1":@"v1", @"k2":@"v2", @"k3":@"v3"};
        //根据key取value
        NSString *str = [myContainers.myDictionary objectForKey:@"k2"];
        NSLog(@"k2对应的value：%@", str);
        //用block遍历dictionary
        [myContainers.myDictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"%@ --> %@", key, obj);
        }];
        //读取文件存入dictionary
        NSDictionary *readDict = [[NSDictionary alloc] initWithContentsOfFile:@"/Users/bytedance/Library/Containers/com.apple.BKAgentService/Data/Documents/iBooks/Books/Books.plist"];
        NSLog(@"readDictionary from plist file: %@", readDict);
        
        //6. MutableDictionary 创建 修改
        myContainers.myMutableDictionary = [@{@"k1":@"v1", @"k2":@"v2", @"k3":@"v3"} mutableCopy];
        [myContainers.myMutableDictionary setObject:@"v4" forKey:@"k4"];
        [myContainers.myMutableDictionary setObject:@"v1-modified" forKey:@"k1"];
        [myContainers.myMutableDictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"%@ --> %@", key, obj);
        }];
    }
    return 0;
}
