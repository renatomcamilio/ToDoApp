//
//  Task.m
//  ToDoApp
//
//  Created by Renato Camilio on 2/3/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "Task.h"


@implementation Task

@dynamic title;
@dynamic details;
@dynamic priority;
@dynamic completed;

- (BOOL)isCompleted {
    [self willAccessValueForKey:@"completed"];
    BOOL completed = [self completed];
    [self didAccessValueForKey:@"completed"];
    
    return completed;
}

@end
