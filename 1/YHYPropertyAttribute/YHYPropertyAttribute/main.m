//
//  main.m
//  YHYPropertyAttribute
//
//  Created by ByteDance on 2022/8/4.
//

#import <Foundation/Foundation.h>
#import "person.h"
#import "Friend.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        Person *person1 = [Person new];
        //测试一：strong v.s. copy
        NSMutableString *nameString = [NSMutableString stringWithFormat:@"test"];
        person1.nameStrong = nameString;
        person1.nameCopy = nameString;
        NSLog(@"原始nameString的地址：%p",nameString);
        NSLog(@"strongName的地址：%p",person1.nameStrong);
        NSLog(@"copyName的地址：%p",person1.nameCopy);
        
        //测试二：弱引用防止循环引用
        Friend *firend1 = [Friend new];
        Dog *dog1 = [Dog new];
        person1.dog = dog1;   // person1 ————> dog
        person1.delegate = firend1; //person1 ----> firend1，如果delegate是强引用，就会导致循环引用
        firend1.myFriend = person1; // person1 <———— firend1

        //测试三：setter，getter重命名
        Person *person2 = [Person new];
        NSLog(@"重命名的getter方法得到结果：%@", person2.newName);
        [person2 setTheNewName:@"modifiedString"];
        NSLog(@"重命名的setter方法得到结果：%@", person2.newName);
        
    }
    return 0;
}
