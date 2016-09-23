//
//  RootViewController.m
//  DSCategories
//
//  Created by dasheng on 15/12/17.
//  Copyright © 2015年 dasheng. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController(){
    
    NSDictionary *_itemsName;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"绘图";
    _items = @{
               
               @"UIKit":@[
                               @"UIKitOne",
                               @"UIKitTwo",
                               @"UIKitThree",
                               @"UIKitFour",
                               ],
               @"Core Graphics":@[
                                @"CGOne",
                                @"CGTwo",
                                @"CGThree",
                                @"CGFour"
                              ],
               @"一些绘图的例子":@[
                                @"DrawOne",
                                @"DrawTwo",
                                @"DrawThree",
                                @"DrawFour",
                                @"DrawFive",
                                @"DrawSix",
                                @"DrawSeven",
                                @"DrawEight"
                                ]
             };
    
    _itemsName = @{
                   
                   @"UIKit":@[
                                @"drawRect:",
                                @"InContext(drawInContext:)",
                                @"InContext(drawLayer: inContext:)",
                                @"UIGraphicsBeginImageContextWithOptions",
                           ],
                   
                   @"Core Graphics":@[
                                @"drawRect:",
                                @"InContext(drawInContext:)",
                                @"InContext(drawLayer: inContext:)",
                                @"UIGraphicsBeginImageContextWithOptions",
                           ],
                   @"一些绘图的例子":@[
                                @"绘制文字",
                                @"绘制图片",
                                @"画线",
                                @"连续绘制线条，并设置交界样式",
                                @"绘制矩形",
                                @"绘制线性渐变效果",
                                @"drawRect绘制进度条progress",
                                @"CAShapeLayer与UIBezierPath进度条"
                           ]
                   };
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_items allKeys] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_items allKeys][section];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_items objectForKey:[_items allKeys][section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text =  [_itemsName objectForKey:[_itemsName allKeys][indexPath.section]][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name =  [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    NSString *className = [name stringByAppendingString:@"ViewController"];
    Class class = NSClassFromString(className);
    UIViewController *controller = [[class alloc] init];
    controller.title = name;
    [self.navigationController pushViewController:controller animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
