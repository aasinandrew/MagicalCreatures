//
//  MagicalCreature.m
//  MCMS
//
//  Created by Jaehee Chung on 7/21/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name detail:(NSString *)detail imageName:(NSString *)image {
    if (self = [super init]) {
        _name = [name copy];
        _detail = [detail copy];
        _imageName = [image copy];
    }
    return self;
}

@end
