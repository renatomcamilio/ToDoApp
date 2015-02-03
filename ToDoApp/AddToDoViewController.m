//
//  AddToDoViewController.m
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "AddToDoViewController.h"

@interface AddToDoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *toDoTitleField;
@property (weak, nonatomic) IBOutlet UITextField *toDoDetailsField;

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (IBAction)doneWasPressed:(id)sender {
    ToDo *newToDoItem = [ToDo toDoWithTitle:self.toDoTitleField.text
                                 andDetails:self.toDoDetailsField.text
                                andPriority:5
                               andCompleted:NO];
    
    [self.delegate addToDoItem:newToDoItem];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
