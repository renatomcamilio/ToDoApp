//
//  ToDoTableViewCell.m
//  ToDoApp
//
//  Created by Renato Camilio on 1/28/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "TaskTableViewCell.h"
#import "CoreDataStack.h"

@interface TaskTableViewCell ()

@property (nonatomic, strong) Task *task;
@property (weak, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskPriorityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *completedCheckboxImageView;

- (void)taskStatusHasChanged;
- (NSMutableAttributedString *)attributedStringWithString:(NSString *)text;

@end

@implementation TaskTableViewCell

- (void)setTask:(Task *)task {
    _task = task;
    
    [self setupCell];
}

- (void)awakeFromNib {
    self.completedCheckboxImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taskStatusHasChanged)];
    [self.completedCheckboxImageView addGestureRecognizer:tapGesture];
}

#pragma mark - Update Task status

- (void)taskStatusHasChanged {
    self.task.completed =  !self.task.completed;
    
    [self updateTaskTextLabels];
    [self updateCheckboxImage];
    
    [[CoreDataStack sharedInstance] saveContext];
}

#pragma mark - View appearance

- (void)updateTaskTextLabels {
    self.taskTitleLabel.attributedText = [self attributedStringWithString:self.task.title];
    self.taskDetailsLabel.attributedText = [self attributedStringWithString:self.task.details];
    self.taskPriorityLabel.attributedText = [self attributedStringWithString:[[NSNumber numberWithInteger:self.task.priority] stringValue]];
}

- (NSMutableAttributedString *)attributedStringWithString:(NSString *)text {
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    
    if ([self.task isCompleted]) {
        [attributedText addAttribute:NSStrikethroughStyleAttributeName
                               value:@2
                               range:NSMakeRange(0, [attributedText length])];
    } else {
        [attributedText removeAttribute:NSStrikethroughStyleAttributeName
                                  range:NSMakeRange(0, [attributedText length])];
    }
    
    return attributedText;
}

- (void)updateCheckboxImage {
    NSString *checkboxImageName = ([self.task isCompleted]) ? @"checkbox-on" : @"checkbox-off";
    self.completedCheckboxImageView.image = [UIImage imageNamed:checkboxImageName];
}

#pragma mark - Initial Setup

- (void)setupCell {
    self.taskTitleLabel.text = _task.title;
    self.taskDetailsLabel.text = _task.details;
    self.taskPriorityLabel.text = [NSString stringWithFormat:@"Priority: %li", (long)_task.priority];
    
    [self updateCheckboxImage];
    
    [self updateTaskTextLabels];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
