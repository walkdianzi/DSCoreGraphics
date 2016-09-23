//
//  DrawSevenViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/9/23.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DrawSevenViewController.h"

@interface DrawSevenView : UIView

@property (nonatomic) float progress;//0~1之间的数

@end

@implementation DrawSevenView

- (void)drawRect:(CGRect)rect{
    CGContextRef context=UIGraphicsGetCurrentContext();//获得画图环境
    CGContextSetLineWidth(context, 10.0);//线条粗细
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:101.0/255.0 green:144.0/255.0 blue:220.0/255.0 alpha:1.0] CGColor]);//画笔色
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);//填充色
    CGContextAddArc(context, 100, 100, 40, -M_PI_2, _progress*M_PI*2-M_PI_2, 0);//从最上端开始顺时针画圈
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end


@interface DrawSevenViewController (){
    
    DrawSevenView  *_progessView;
}

@end

@implementation DrawSevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _progessView=[[DrawSevenView alloc] initWithFrame:CGRectMake(100.0, 100.0, 200, 200)];
    [self.view addSubview:_progessView];
    _progessView.progress = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerHandler:) userInfo:nil repeats:YES];
}

-(void)timerHandler:(NSTimer*)timer
{
    if (_progessView.progress < 1) {
        _progessView.progress=_progessView.progress+0.1;
    }
    [_progessView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
