//
//  ToDoListStorage.m
//  ToDoApp
//
//  Created by Renato Camilio on 2/2/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "ToDoListStorage.h"

@interface ToDoListStorage ()

@property (nonatomic, strong) NSMutableArray *toDoList;

@end


@implementation ToDoListStorage

#pragma mark - Archiving & Unarchiving

+ (ToDoListStorage *)sharedInstance {
    static ToDoListStorage *sharedToDoListStorage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedToDoListStorage = [[self alloc] init];
        sharedToDoListStorage.toDoList = [[NSMutableArray alloc] init];
    });
    
    return sharedToDoListStorage;
}

- (NSURL *)toDoListArchiveURL {
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    NSArray *paths = [defaultManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask];
    return [paths lastObject];
}

- (BOOL)archiveToDoList {
    NSFileManager *sharedFM = [NSFileManager defaultManager];
    NSURL *toDoListFileURL = [self toDoListArchiveURL];
    
    if (![sharedFM fileExistsAtPath:toDoListFileURL.path]) {
        NSData *toDoListArchiveData = [NSKeyedArchiver archivedDataWithRootObject:self.toDoList];
        return [sharedFM createFileAtPath:toDoListFileURL.path contents:toDoListArchiveData attributes:nil];
    } else {
        return [NSKeyedArchiver archiveRootObject:self.toDoList toFile:toDoListFileURL.path];
    }
}

- (NSMutableArray *)unarchiveToDoList {
    NSFileManager *sharedFM = [NSFileManager defaultManager];
    if ([sharedFM fileExistsAtPath:[self toDoListArchiveURL].path]) {
        self.toDoList = [NSKeyedUnarchiver unarchiveObjectWithFile:[self toDoListArchiveURL].path];

    }
    
    return self.toDoList;
}

@end
