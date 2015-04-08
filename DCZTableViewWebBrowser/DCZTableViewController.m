//
//  ViewController.m
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZTableViewController.h"
#import "DCZURLViewController.h"
#import "DCZDataModel.h"

@interface DCZTableViewController ()

@end

@implementation DCZTableViewController
- (IBAction)openWikipedia:(id)sender {
    DCZURLViewController *URLview = [self.storyboard instantiateViewControllerWithIdentifier:@"DCZURLViewController"];
    [self.navigationController pushViewController:URLview animated:YES];
}

- (IBAction)openLynda:(id)sender {
    DCZURLViewController *URLview = [self.storyboard instantiateViewControllerWithIdentifier:@"DCZURLViewController"];
    [self.navigationController pushViewController:URLview animated:YES];
}

- (IBAction)openLinked:(id)sender {
    DCZURLViewController *URLview = [self.storyboard instantiateViewControllerWithIdentifier:@"DCZURLViewController"];
    [self.navigationController pushViewController:URLview animated:YES];
}

- (IBAction)openGithub:(id)sender {
    DCZURLViewController *URLview = [self.storyboard instantiateViewControllerWithIdentifier:@"DCZURLViewController"];
    [self.navigationController pushViewController:URLview animated:YES];
}

- (IBAction)openW3:(id)sender {
    DCZURLViewController *URLview = [self.storyboard instantiateViewControllerWithIdentifier:@"DCZURLViewController"];
    [self.navigationController pushViewController:URLview animated:YES];
}

- (instancetype)init {
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [[[DCZDataModel sharedPages] pageNamesList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // Set up the resuable table cell object
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];

    // If one does not already exist, create an instance of UITableViewCell with default appearance
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    // Set the text on the cell with the description of the item that is at the nth index of items,
    // where n = row this cell will appear in on the tableview
    NSArray *pages = [[DCZDataModel sharedPages] pageNamesList];
    DCZDataModel *page = pages[indexPath.row];
    cell.textLabel.text = [page description];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DCZURLViewController *urlContr = [[DCZURLViewController alloc] init];
    
    NSMutableArray *address = [[DCZDataModel sharedPages] pageNamesList];
    NSMutableString *currentAddress = address[indexPath.row];
    urlContr.currentPage = currentAddress;
    
    //Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:urlContr
                                         animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Websites";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
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
