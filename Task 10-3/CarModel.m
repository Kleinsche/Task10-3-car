//
//  CarModel.m
//  Task 10-3
//
//  Created by 🍋 on 2017/1/7.
//  Copyright © 2017年 🍋. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

-(instancetype)initWithDict:(NSDictionary*)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)carModelWithDict:(NSDictionary*)dict{
    return [[CarModel alloc]initWithDict:dict];
}

@end
