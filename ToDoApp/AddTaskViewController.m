//
//  AddToDoViewController.m
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@property (weak, nonatomic) IBOutlet UITextField *taskTitleField;
@property (weak, nonatomic) IBOutlet UITextField *taskDetailsField;

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (IBAction)doneWasPressed:(id)sender {
    CoreDataStack *coreDataStack = [CoreDataStack sharedInstance];
    Task *taskEntity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Task class]) inManagedObjectContext:coreDataStack.managedObjectContext];
    
    taskEntity.title = self.taskTitleField.text;
    taskEntity.details = self.taskDetailsField.text;
    taskEntity.priority = 5;
    taskEntity.completed = NO;
    
    [coreDataStack saveContext];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
