//
//  DetailViewController.m
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "TaskDetailViewController.h"

@interface TaskDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskPriorityLabel;

@end

@implementation TaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
    backBtn.tintColor = [UIColor darkGrayColor];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    [self configureView];
}

- (void)popSelf {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Managing the detail item

- (void)setTask:(Task *)task {
    if (_task != task) {
        _task = task;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    
    if (self.task) {
        self.taskTitleLabel.text = self.task.title;
        self.taskDetailsLabel.text = self.task.details;
        self.taskPriorityLabel.text = [NSString stringWithFormat:@"Priority: %li", (long)self.task.priority];
    }
}

@end
