//
//  ToDoTableViewCell.h
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface ToDoTableViewCell : UITableViewCell

- (void)setupCell:(ToDo *)toDoItem;

@end
