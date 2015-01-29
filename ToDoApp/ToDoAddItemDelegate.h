//
//  ToDoAddItemDelegate.h
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ToDoAddItemDelegate <NSObject>

@required
- (void)addToDoItem:(ToDo *)toDo;

@end
