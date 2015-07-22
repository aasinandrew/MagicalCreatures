//
//  CreatureViewController.m
//  MCMS
//
//  Created by Jaehee Chung on 7/21/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import "CreatureViewController.h"
#import "BattleViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@property (weak, nonatomic) IBOutlet UILabel *creatureDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (weak, nonatomic) IBOutlet UITableView *accessoryTableView;
@property (weak, nonatomic) IBOutlet UITextField *editDetailTextField;


@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.creatureNameLabel.text = self.creature.name;
    self.creatureDetailLabel.text = self.creature.detail;
    self.creatureImageView.image = [UIImage imageNamed:self.creature.imageName];
    self.editTextField.hidden = YES;
    self.editDetailTextField.hidden = YES;
}


- (IBAction)onEditButtonPressed:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"Edit"]) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.editTextField.hidden = NO;
        self.creatureNameLabel.hidden = YES;
        self.editDetailTextField.hidden = NO;
        self.creatureDetailLabel.hidden = YES;
      
    }
    else {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.editTextField.hidden = YES;
        self.creatureNameLabel.hidden = NO;
        self.editDetailTextField.hidden = YES;
        self.creatureDetailLabel.hidden = NO;
        NSCharacterSet *spaces = [NSCharacterSet whitespaceCharacterSet];
        NSString *text = [self.editTextField.text stringByTrimmingCharactersInSet:spaces];
        NSString *detailsText = [self.editDetailTextField.text stringByTrimmingCharactersInSet:spaces];
        if (text.length == 0 && detailsText.length == 0) {
            return;
        } else if (text.length == 0 && detailsText.length > 0) {
            self.creatureDetailLabel.text = detailsText;
        } else if (text.length > 0 && detailsText.length == 0) {
            self.creatureNameLabel.text = text;
        } else {
            self.creatureNameLabel.text = text;
            self.creatureDetailLabel.text = detailsText;
        }
        [self.editDetailTextField resignFirstResponder];
        [self.editTextField resignFirstResponder];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creature.accessories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccessoryCell"];
    cell.textLabel.text = [self.creature.accessories objectAtIndex:indexPath.row];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BattleViewController *vc = segue.destinationViewController;
    vc.indexPath = self.indexPath;
    vc.battleCreatures = self.creaturesArray;
}



@end
