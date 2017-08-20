//
//  AnnotationView.h
//  Task 10-3
//
//  Created by 🍋 on 2017/1/7.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface AnnotationView : MKAnnotationView
@property (nonatomic,strong) NSArray * array;
@property (nonatomic,assign) int value;

- (void)annotationView:(int)value;

@end
