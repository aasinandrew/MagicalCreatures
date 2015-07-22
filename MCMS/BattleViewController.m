//
//  BattleViewController.m
//  MCMS
//
//  Created by Jaehee Chung on 7/21/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *creatureLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *creatureLabelTwo;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageOne;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageTwo;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBattle];
    self.button.enabled = NO;
    self.button.hidden = YES;
    [self winner];
    
}

-(void)setUpBattle {
    MagicalCreature *creature = [self.battleCreatures objectAtIndex:self.indexPath.row];
    self.creatureLabelOne.text = creature.name;
    self.creatureImageOne.image = [UIImage imageNamed:creature.imageName];
    [self.battleCreatures removeObjectAtIndex:self.indexPath.row];
    
    int rand = arc4random_uniform( (int) self.battleCreatures.count );
    creature = [self.battleCreatures objectAtIndex:rand];
    
    self.creatureLabelTwo.text = creature.name;
    self.creatureImageTwo.image = [UIImage imageNamed:creature.imageName];
    
    
}

-(void)winner {
    int rand = arc4random_uniform(2);
    NSString *string;
    if (rand == 0) {
        string = self.creatureLabelOne.text;
    }
    else {
        string = self.creatureLabelTwo.text;
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Winner" message:[NSString stringWithFormat:@"Winner is %@", string] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *goHome = [UIAlertAction actionWithTitle:@"Go Home" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self performSegueWithIdentifier:@"ExitToHome" sender:self];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:goHome];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
