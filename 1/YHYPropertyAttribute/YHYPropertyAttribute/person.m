//
//  person.m
//  YHYPropertyAttribute
//
//  Created by ByteDance on 2022/8/4.
//

#import "person.h"

@implementation Person

@synthesize newName = _newName;

- (instancetype)initWithName:(NSString *)name {
    if(!self){
        _name = name;
    }
    return self;
}

- (void)setTheNewName:(NSString *)newName {
    _newName = newName;
}

- (NSString *)theNewName {
    if(!_newName)
       _newName = @"defaultString";
   return _newName;
}
@end
