//
//  ToDo.m
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

+ (ToDo *)toDoWithTitle:(NSString *)title andDetails:(NSString *)details andPriority:(NSInteger)priority andCompleted:(BOOL)completed {
    ToDo *toDoItem = [[ToDo alloc] init];
    
    toDoItem.title = title;
    toDoItem.details = details;
    toDoItem.priority = priority;
    toDoItem.completed = completed;
    
    return toDoItem;
}

#pragma mark NSCoding

static NSString *const kForKeyTitle = @"Title";
static NSString *const kForKeyDetails = @"Details";
static NSString *const kForKeyPriority = @"Priority";
static NSString *const kForKeyCompleted = @"Completed";

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:kForKeyTitle];
    [aCoder encodeObject:self.details forKey:kForKeyDetails];
    [aCoder encodeInteger:self.priority forKey:kForKeyPriority];
    [aCoder encodeBool:self.completed forKey:kForKeyCompleted];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    NSString *title = [aDecoder decodeObjectForKey:kForKeyTitle];
    NSString *details = [aDecoder decodeObjectForKey:kForKeyDetails];
    NSInteger priority = [aDecoder decodeIntegerForKey:kForKeyPriority];
    BOOL completed = [aDecoder decodeBoolForKey:kForKeyCompleted];
    
    return [[self class] toDoWithTitle:title andDetails:details andPriority:priority andCompleted:completed];
}

@end
