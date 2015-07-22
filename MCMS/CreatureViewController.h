//
//  CreatureViewController.h
//  MCMS
//
//  Created by Jaehee Chung on 7/21/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface CreatureViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property MagicalCreature *creature;
@property NSMutableArray *creaturesArray;
@property NSIndexPath *indexPath;

@end
