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
@property (weak, nonatomic) IBOutlet UIImageView *completedCheckboxImageView;

- (void)didChangeToDoState;
- (NSMutableAttributedString *)attributedStringWithString:(NSString *)text;

@end

@implementation ToDoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.completedCheckboxImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didChangeToDoState)];
    [self.completedCheckboxImageView addGestureRecognizer:tapGesture];
}

- (void)didChangeToDoState {
    self.toDoItem.completed =  !self.toDoItem.completed;
    
    [self updateToDoText];
    [self updateCheckboxImage];
    
    [[ToDoListStorage sharedInstance] archiveToDoList];
}

- (void)updateToDoText {
    self.toDoTitleLabel.attributedText = [self attributedStringWithString:self.toDoItem.title];
    self.toDoDetailsLabel.attributedText = [self attributedStringWithString:self.toDoItem.details];
    self.toDoPriorityLabel.attributedText = [self attributedStringWithString:[[NSNumber numberWithInteger:self.toDoItem.priority] stringValue]];
}

- (NSMutableAttributedString *)attributedStringWithString:(NSString *)text {
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    
    if ([self.toDoItem isCompleted]) {
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

- (void)updateCheckboxImage {
    NSString *checkboxImageName = ([self.toDoItem isCompleted]) ? @"checkbox-on" : @"checkbox-off";
    self.completedCheckboxImageView.image = [UIImage imageNamed:checkboxImageName];
}

- (void)setupCell {
    self.toDoTitleLabel.text = _toDoItem.title;
    self.toDoDetailsLabel.text = _toDoItem.details;
    self.toDoPriorityLabel.text = [NSString stringWithFormat:@"Priority: %li", (long)_toDoItem.priority];
    
    [self updateCheckboxImage];
    
    [self updateToDoText];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
