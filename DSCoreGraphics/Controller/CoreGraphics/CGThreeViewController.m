//
//  CGThreeViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/2/25.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "CGThreeViewController.h"

@interface CGLayerDelegate : NSObject<CALayerDelegate>

@end

@implementation CGLayerDelegate

- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)ctx {
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0,0,100,100));
    
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    
    CGContextFillPath(ctx);
}
@end


@implementation CGThreeViewController{
    
    CGLayerDelegate *_layerDeleagete;
    
    CALayer         *_layer;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    _layerDeleagete = [[CGLayerDelegate alloc] init];
    
    //1.创建自定义的layer
    _layer=[CALayer layer];
    //2.设置layer的属性
    _layer.backgroundColor= [UIColor blackColor].CGColor;
    _layer.frame=CGRectMake(100, 100, 200, 200);
    
    _layer.delegate = _layerDeleagete;
    [_layer setNeedsDisplay];
    
    //3.添加layer
    [self.view.layer addSublayer:_layer];
}

- (void)dealloc{
    
    _layer.delegate = nil;
}

@end
