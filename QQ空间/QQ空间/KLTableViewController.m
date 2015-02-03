//
//  KLTableViewController.m
//  QQ空间
//
//  Created by kouliang on 15/2/3.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "KLTableViewController.h"

@interface KLTableViewController ()

@end

@implementation KLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KLRandomColor;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd", self.title, indexPath.row];
    cell.detailTextLabel.text = @"123";
    
    return cell;
}
@end
