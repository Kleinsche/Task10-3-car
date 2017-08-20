//
//  DidSelectAnnotationView.m
//  Task 10-3
//
//  Created by 🍋 on 2017/1/9.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import "DidSelectAnnotationView.h"
#import "CarModel.h"

@implementation DidSelectAnnotationView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"car.plist" ofType:nil];
    NSArray * array = [NSArray arrayWithContentsOfFile:path];
    CarModel * car = [CarModel carModelWithDict:array[self.value]];
    self.carImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",car.carPicture]];
    
    self.content.text = [NSString stringWithFormat:@"%@",car.content];
}


@end
