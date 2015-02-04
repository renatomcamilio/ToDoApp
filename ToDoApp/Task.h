//
//  Task.h
//  ToDoApp
//
//  Created by Renato Camilio on 2/3/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Task : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * details;
@property (nonatomic) int16_t priority;
@property (nonatomic) BOOL completed;

- (BOOL)isCompleted;

@end
