//
//  CarModel.h
//  Task 10-3
//
//  Created by 🍋 on 2017/1/7.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarModel : NSObject
@property(nonatomic,copy)NSString * annotationPicture;
@property(nonatomic,copy)NSString * carPicture;
@property(nonatomic,copy)NSString * content;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)carModelWithDict:(NSDictionary*)dict;

@end
