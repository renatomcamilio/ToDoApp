//
//  ToDoListStorage.h
//  ToDoApp
//
//  Created by Renato Camilio on 2/2/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDo.h"
#import "ToDoListStorageDelegate.h"

@interface ToDoListStorage : NSObject <ToDoListStorageDelegate>

+ (ToDoListStorage *)sharedInstance;

@end
