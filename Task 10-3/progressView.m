//
//  progressView.m
//  test
//
//  Created by 🍋 on 2017/1/5.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import "progressView.h"

@implementation progressView



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage * image1 = [UIImage imageNamed:@"滚动条.png"];
    self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    self.imageView.image = image1;
    [self addSubview:self.imageView];
    
    UIImage * image2 = [UIImage imageNamed:@"按钮.png"];
    self.buttonView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CircleLength, CircleLength)];
    self.buttonView.image = image2;
    [self.imageView addSubview:self.buttonView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self buttonMove:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self buttonMove:touches];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
//    NSLog(@"%f",point.x);
//    NSLog(@"%f",self.buttonView.transform.tx);
    [UIView beginAnimations:nil context:nil];
    if (point.x <= (ScreenWidth - CircleLength)/6 + CircleLength/2)
    {
        self.buttonView.transform = CGAffineTransformMakeTranslation(0, 0);
        self.value = 0;
    }else if (point.x <= (ScreenWidth - CircleLength)/2 + CircleLength/2)
    {
        self.buttonView.transform = CGAffineTransformMakeTranslation((ScreenWidth - CircleLength)/3, 0);
        self.value = 1;
    }else if (point.x <= (ScreenWidth - CircleLength) * 5/6 + CircleLength/2)
    {
        self.buttonView.transform = CGAffineTransformMakeTranslation((ScreenWidth - CircleLength)/3 * 2, 0);
        self.value = 2;
    }else
    {
        self.buttonView.transform = CGAffineTransformMakeTranslation(ScreenWidth - CircleLength, 0);
        self.value = 3;
    }
    [UIView commitAnimations];
    
    if ([self.delegate respondsToSelector:@selector(showView:)]) {
        [self.delegate showView:self.value];
    }
}

- (void)buttonMove:(NSSet<UITouch *> *)touches {
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
//    NSLog(@"%f,%f",point.x,point.y);
    self.buttonView.transform = CGAffineTransformMakeTranslation(point.x - 20, 0);

    if (self.buttonView.transform.tx <= 0) {
        self.buttonView.transform = CGAffineTransformMakeTranslation(0, 0);
    }else if (self.buttonView.transform.tx >= [UIScreen mainScreen].bounds.size.width - 40){
        self.buttonView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width - 40, 0);
    }
}

@end
