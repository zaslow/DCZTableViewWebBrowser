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
        
        // Initialize & fill page names array
        _pageNames = [[NSMutableArray alloc] init];
        [_pageNames addObject:@"Wikipedia"];
        [_pageNames addObject:@"Lynda.com"];
        [_pageNames addObject:@"LinkedIn"];
        [_pageNames addObject:@"GitHub"];
        [_pageNames addObject:@"W3Schools"];
        
        // Initialize & fill URL array
        _URLs = [[NSMutableArray alloc] init];
        [_URLs addObject:@"http://www.wikipedia.org"];
        [_URLs addObject:@"http://www.lynda.com"];
        [_URLs addObject:@"http://www.linkedin.com"];
        [_URLs addObject:@"http://www.github.com"];
        [_URLs addObject:@"http://www.w3schools.com"];
    }
    
    return self;
}

@end
