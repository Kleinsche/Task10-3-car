//
//  progressView.h
//  test
//
//  Created by 🍋 on 2017/1/5.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol progressDelegate <NSObject>
@optional
- (void)showView:(int) value;

@end


@interface progressView : UIView

@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UIImageView * buttonView;
@property (nonatomic,assign) int value;

@property (nonatomic,assign) id<progressDelegate>delegate;
#define CircleLength self.bounds.size.height * 3/4
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height



@end
