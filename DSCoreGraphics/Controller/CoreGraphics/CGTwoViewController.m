//
//  CGTwoViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/2/25.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "CGTwoViewController.h"

@interface CGTwoLayer : CALayer

@end

@implementation CGTwoLayer

- (void)drawInContext:(CGContextRef)ctx{
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0,0,100,100));
    
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    
    CGContextFillPath(ctx);
}

@end


@implementation CGTwoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    //1.创建自定义的layer
    CGTwoLayer *layer=[CGTwoLayer layer];
    //2.设置layer的属性
    layer.backgroundColor= [UIColor blackColor].CGColor;
    layer.frame=CGRectMake(100, 100, 200, 200);
    
    [layer setNeedsDisplay];
    //3.添加layer
    [self.view.layer addSublayer:layer];
}

@end
