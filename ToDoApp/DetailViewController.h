//
//  DetailViewController.h
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Task *task;

@end

