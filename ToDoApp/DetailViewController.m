//
//  DetailViewController.m
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoPriorityLabel;

@end

@implementation DetailViewController

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

- (void)setToDoItem:(ToDo *)todoItem {
    if (_toDoItem != todoItem) {
        _toDoItem = todoItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    
    if (self.toDoItem) {
        self.toDoTitleLabel.text = self.toDoItem.title;
        self.toDoDetailsLabel.text = self.toDoItem.details;
        self.toDoPriorityLabel.text = [NSString stringWithFormat:@"Priority: %li", (long)self.toDoItem.priority];
    }
}

@end
