//
//  DCZPageCollection.m
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZPageCollection.h"
#import "DCZDataModel.h"

@interface DCZPageCollection ()

@property (nonatomic) NSMutableArray *privatePages;

@end

@implementation DCZPageCollection

+ (instancetype)sharedPages {
    static DCZPageCollection *sharedPages = nil;
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

- (NSArray *)allPages {
    return self.privatePages;
}

- (DCZDataModel *)createPage {
    DCZDataModel *page = [[DCZDataModel alloc] init];
    [self.privatePages addObject:page];
    return page;
}

@end
