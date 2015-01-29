//
//  ToDo.h
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *details;
@property (assign) NSInteger priority;
@property (assign, getter=isCompleted) BOOL completed;

+ (ToDo *)toDoWithTitle:(NSString *)title andDetails:(NSString *)details andPriority:(NSInteger)priority andCompleted:(BOOL)completed;

@end
