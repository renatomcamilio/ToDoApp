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
@property (weak, nonatomic) IBOutlet UILabel *taskPriorityLabel;
@property (weak, nonatomic) IBOutlet UIStepper *taskPriorityStepper;

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

#pragma mark - Task creation

- (void)createTask {
    CoreDataStack *coreDataStack = [CoreDataStack sharedInstance];
    Task *taskEntity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Task class]) inManagedObjectContext:coreDataStack.managedObjectContext];
    
    taskEntity.title = self.taskTitleField.text;
    taskEntity.details = self.taskDetailsField.text;
    taskEntity.priority = self.taskPriorityStepper.value;
    taskEntity.completed = NO;
    
    [coreDataStack saveContext];
}

#pragma mark - User interaction events

- (IBAction)taskPriorityValueChanged:(id)sender {
    self.taskPriorityLabel.text = [NSString stringWithFormat:@"Priority: %i", (int)self.taskPriorityStepper.value];
}

- (IBAction)doneWasPressed:(id)sender {
    [self createTask];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
