//
//  UIKitOneViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/2/22.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "UIKitOneViewController.h"

@interface TestOneView : UIView

@end

@implementation TestOneView

- (void)drawRect:(CGRect)rect{
    //当前上下文及画布为当前view
    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
    
    [[UIColor blueColor] setFill];
    
    [p fill];
}

@end

@implementation UIKitOneViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    TestOneView *view = [[TestOneView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:view];
}

@end
