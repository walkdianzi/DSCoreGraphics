//
//  DrawThreeViewController.m
//  DSCoreGraphics
//
//  Created by 童玉龙 on 16/9/11.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DrawThreeViewController.h"

@implementation DrawThreeViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200,200), NO, 0);
    
    
    //DrawingLine
    [[UIColor brownColor] set];       //设置上下文使用的颜色
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0f);
    CGContextMoveToPoint(context, 0.0f, 150.0f);  // 画笔移动到某点
    CGContextAddLineToPoint(context, 200.0f, 150.0f);
    CGContextStrokePath(context);       //执行绘制
    
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    /*---------------------------------*/
    UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [imageView setImage:im];
    [self.view addSubview:imageView];
}

@end
