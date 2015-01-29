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

@end
