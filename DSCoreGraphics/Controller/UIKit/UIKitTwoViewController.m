//
//  UIKitTwoViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/2/23.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "UIKitTwoViewController.h"

@interface TestTwoLayer : CALayer

@end

@implementation TestTwoLayer

- (void)drawInContext:(CGContextRef)ctx{
    
    UIGraphicsPushContext(ctx);

    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];

    [[UIColor blueColor] setFill];

    [p fill];

    UIGraphicsPopContext();
}

@end

@implementation UIKitTwoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    //1.创建自定义的layer
    TestTwoLayer *layer=[TestTwoLayer layer];
     //2.设置layer的属性
    layer.backgroundColor= [UIColor blackColor].CGColor;
    layer.frame=CGRectMake(100, 100, 200, 200);

    [layer setNeedsDisplay];
     //3.添加layer
    [self.view.layer addSublayer:layer];
}

@end
