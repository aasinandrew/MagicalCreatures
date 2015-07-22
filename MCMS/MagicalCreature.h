//
//  MagicalCreature.h
//  MCMS
//
//  Created by Jaehee Chung on 7/21/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *detail;
@property NSString *imageName;
@property NSMutableArray *accessories;

-(instancetype)initWithName:(NSString *)name detail:(NSString *)detail imageName:(NSString *)image;

@end
