//
//  ToDoListStorageDelegate.h
//  ToDoApp
//
//  Created by Renato Camilio on 2/2/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ToDoListStorageDelegate <NSObject>

@required
- (id)unarchiveToDoList;
- (BOOL)archiveToDoList;

@end
