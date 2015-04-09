//
//  ViewController.m
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZTableViewController.h"
#import "DCZURLViewController.h"
#import "DCZDataModel.m"

@interface DCZTableViewController ()

@end

@implementation DCZTableViewController

- (instancetype)init {
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProtoypeCell"
                                                            forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"PrototypeCell"];
    }
    cell.textLabel.text = [[[DCZDataModel sharedPages] pageNames] objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[[DCZDataModel sharedPages] URLs] count];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DCZURLViewController *urlContr = [[DCZURLViewController alloc] init];
    NSMutableArray *pageAddress = [[DCZDataModel sharedPages] URLs];
    NSMutableString *currentAddress = pageAddress[indexPath.row];
    urlContr.currentPage = currentAddress;
    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:urlContr animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Browse Websites";
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

@end
