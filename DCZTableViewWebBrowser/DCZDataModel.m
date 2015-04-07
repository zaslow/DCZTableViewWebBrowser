//
//  DCZDataModel.m
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZDataModel.h"

@interface DCZDataModel ()

@property (nonatomic) NSMutableArray *URLs;
@property (nonatomic) NSMutableArray *pageNames;
@property (nonatomic) NSMutableArray *privatePages;

@end

@implementation DCZDataModel

+ (instancetype)sharedPages {
    static DCZDataModel *sharedPages = nil;
    
    // Do I need to create a sharedPages?
    if (!sharedPages) {
        sharedPages = [[self alloc] initPrivate];
    }
    return sharedPages;
}

// If a programmer calls [[DCZPageCollection alloc] init], let him know the error of his ways
- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[DCZPageCollection sharedPages]"
                                 userInfo:nil];
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _privatePages = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
