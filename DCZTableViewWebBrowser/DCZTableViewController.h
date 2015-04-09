//
//  ViewController.h
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCZTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) NSMutableString *currentPage;

@end

