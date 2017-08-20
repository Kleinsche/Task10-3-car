//
//  DidSelectAnnotationView.h
//  Task 10-3
//
//  Created by 🍋 on 2017/1/9.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DidSelectAnnotationView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *carImage;
@property (strong, nonatomic) IBOutlet UITextView *content;
@property (assign,nonatomic) int value;

@end
