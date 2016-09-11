//
//  DrawSixViewController.m
//  DSCoreGraphics
//
//  Created by 童玉龙 on 16/9/11.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DrawSixViewController.h"

@implementation DrawSixViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200,200), NO, 0);

    CGContextRef context = UIGraphicsGetCurrentContext();


    CGRect strokeRect = CGRectMake(0, 85, 200, 60);

    //DrawingRect
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSArray *colors = @[(__bridge id)[UIColor colorWithRed:0.3 green:0.0 blue:0.0 alpha:0.2].CGColor,
                        (__bridge id)[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.8].CGColor];
    const CGFloat locations[] = {0.0, 1.0};

    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);

    CGPoint startPoint = CGPointMake(CGRectGetMinX(strokeRect), CGRectGetMinY(strokeRect)); //矩形最小x,y
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(strokeRect), CGRectGetMaxY(strokeRect));   //矩形最大x,y

    CGContextSaveGState(context);
    CGContextAddRect(context, strokeRect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0); //开始绘制
    CGContextRestoreGState(context);

    //释放资源
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);


    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();


    /*---------------------------------*/
    UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 250, 200)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView setImage:im];
    [self.view addSubview:imageView];
}

@end
