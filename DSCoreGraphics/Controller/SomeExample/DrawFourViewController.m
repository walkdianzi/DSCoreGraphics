//
//  DrawFourViewController.m
//  DSCoreGraphics
//
//  Created by 童玉龙 on 16/9/11.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DrawFourViewController.h"

@implementation DrawFourViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200,200), NO, 0);

    CGContextRef context = UIGraphicsGetCurrentContext();

    //DrawingLinesContinuously
    CGContextSetLineWidth(context, 6.0f);
    CGContextSetLineJoin(context, kCGLineJoinRound);    //线条交汇处样式：圆角
    CGContextMoveToPoint(context, 20.0f, 150.0f);
    CGContextAddLineToPoint(context, 20.0f, 80.0f);
    CGContextAddLineToPoint(context, 200.0f, 80.0f);
    CGContextStrokePath(context);

    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();


    /*---------------------------------*/
    UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [imageView setImage:im];
    [self.view addSubview:imageView];
}

@end
