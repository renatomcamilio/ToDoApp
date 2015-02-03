//
//  ToDoTableViewCell.m
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "ToDoTableViewCell.h"

@interface ToDoTableViewCell ()

@property (nonatomic, strong) ToDo *toDoItem;
@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoPriorityLabel;
@property (weak, nonatomic) IBOutlet UISwitch *toDoCompletedSwitch;

- (void)didChangeToDoState:(id)sender;
- (NSMutableAttributedString *)attributedStringWithString:(NSString *)text andToDoSwicth:(UISwitch *)toDoSwitch;

@end

@implementation ToDoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.toDoCompletedSwitch addTarget:self action:@selector(didChangeToDoState:) forControlEvents:UIControlEventValueChanged];
}

- (void)didChangeToDoState:(id)sender {
    UISwitch *completedSwitch = (UISwitch *)sender;
    self.toDoTitleLabel.attributedText = [self attributedStringWithString:self.toDoItem.title andToDoSwicth:completedSwitch];
    self.toDoDetailsLabel.attributedText = [self attributedStringWithString:self.toDoItem.details andToDoSwicth:completedSwitch];
    self.toDoPriorityLabel.attributedText = [self attributedStringWithString:[[NSNumber numberWithInteger:self.toDoItem.priority] stringValue] andToDoSwicth:completedSwitch];
    
    self.toDoItem.completed = [completedSwitch isOn];
    
    [[ToDoListStorage sharedInstance] archiveToDoList];
}

- (NSMutableAttributedString *)attributedStringWithString:(NSString *)text andToDoSwicth:(UISwitch *)toDoSwitch {
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    
    if ([toDoSwitch isOn]) {
        [attributedText addAttribute:NSStrikethroughStyleAttributeName
                               value:@2
                               range:NSMakeRange(0, [attributedText length])];
    } else {
        [attributedText removeAttribute:NSStrikethroughStyleAttributeName
                                  range:NSMakeRange(0, [attributedText length])];
    }
    
    return attributedText;
}

- (void)setToDoItem:(ToDo *)toDoItem {
    _toDoItem = toDoItem;
    
    [self setupCell];
}

- (void)setupCell {
    self.toDoTitleLabel.text = _toDoItem.title;
    self.toDoDetailsLabel.text = _toDoItem.details;
    self.toDoPriorityLabel.text = [NSString stringWithFormat:@"Priority: %li", (long)_toDoItem.priority];
    self.toDoCompletedSwitch.on = [_toDoItem isCompleted];
    
    [self didChangeToDoState:self.toDoCompletedSwitch];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
