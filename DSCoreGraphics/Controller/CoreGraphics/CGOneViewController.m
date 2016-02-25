//
//  CGOneViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/2/25.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "CGOneViewController.h"

@interface CGOneView : UIView

@end

@implementation CGOneView

- (void)drawRect:(CGRect)rect{
    //当前上下文及画布为当前view
    CGContextRef con = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(con, CGRectMake(0,0,100,100));
    
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    
    CGContextFillPath(con);
}

@end


@implementation CGOneViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    CGOneView *view = [[CGOneView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:view];
}

@end
