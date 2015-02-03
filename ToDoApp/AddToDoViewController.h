//
//  AddToDoViewController.h
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"
#import "ToDoAddItemDelegate.h"

@interface AddToDoViewController : UIViewController

@property (nonatomic, weak) id<ToDoAddItemDelegate> delegate;

@end
