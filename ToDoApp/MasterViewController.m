//
//  MasterViewController.m
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDoTableViewCell.h"
#import "ToDo.h"

@interface MasterViewController ()

@property NSMutableArray *objects;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    ToDo *todo1 = [ToDo toDoWithTitle:@"Buy Milk" andDetails:@"When coming home, tonight @ 8h00 pm." andPriority:10 andCompleted:YES];
    ToDo *todo2 = [ToDo toDoWithTitle:@"LHL Chess Game" andDetails:@"Make a move, take a shoot and post on Instagram!" andPriority:1 andCompleted:NO];
    
    self.objects = [NSMutableArray arrayWithArray:@[todo1, todo2]];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *toDoItem = self.objects[indexPath.row];
        [[segue destinationViewController] setToDoItem:toDoItem];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDo *toDo = self.objects[indexPath.row];
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    [cell setupCell:toDo];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
