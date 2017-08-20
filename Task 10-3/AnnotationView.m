//
//  AnnotationView.m
//  Task 10-3
//
//  Created by 🍋 on 2017/1/7.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import "AnnotationView.h"
#import "CarModel.h"

@implementation AnnotationView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSString * path = [[NSBundle mainBundle] pathForResource:@"car.plist" ofType:nil];
    self.array = [NSArray arrayWithContentsOfFile:path];
    [self annotationView:self.value];
}

- (void)annotationView:(int)value {
    CarModel * car = [CarModel carModelWithDict:self.array[value]];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",car.annotationPicture]];
    imageView.image = image;
    [self addSubview:imageView];
}

- (NSArray *)arrary {
    if (!_array) {
        _array = [[NSArray alloc]init];
    }
    return _array;
}

@end
