//
//  ViewController.m
//  MCMS
//
//  Created by Jaehee Chung on 7/21/15.
//  Copyright (c) 2015 Jaehee Chung. All rights reserved.
//

#import "MainViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "BattleViewController.h"

@interface MainViewController () 
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *battleButton;
@property (weak, nonatomic) IBOutlet UITextField *userDescriptionField;
@property NSArray *creatureImages;
@property NSMutableArray *creatureAccessories;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addButton.enabled = NO;
    self.battleButton.enabled = NO;
    [self setUpCreatures];
    [self setImagesAndAccessories];
    
    
}


-(void)setUpCreatures {
    self.creatures = [[NSMutableArray alloc]init];
    MagicalCreature *magicalCreature = [[MagicalCreature alloc] initWithName:@"Arr" detail:@"jawofienwoefn" imageName:@"dragon"];
    
    magicalCreature.accessories = [[NSMutableArray alloc] initWithObjects:@"Soccorball" , @"Pencil", @"eraser", nil];
    
    [self.creatures addObject:magicalCreature];
    magicalCreature = [[MagicalCreature alloc] initWithName:@"Irrwef" detail:@"jawofienwoefn" imageName:@"dragon2"];
    magicalCreature.accessories = [[NSMutableArray alloc] initWithObjects:@"Soccorball" , @"Pencil", @"eraser", nil];
    [self.creatures addObject:magicalCreature];
    magicalCreature = [[MagicalCreature alloc] initWithName:@"Meafefarr" detail:@"jawofienwoefn" imageName:@"dragon3"];
    magicalCreature.accessories = [[NSMutableArray alloc] initWithObjects:@"Soccorball" , @"Pencil", @"eraser", nil];
    [self.creatures addObject:magicalCreature];

    
}

-(void) setImagesAndAccessories{
    self.creatureImages = [NSArray arrayWithObjects:@"monster", @"monster2", @"monster3", nil];
    self.creatureAccessories = [[NSArray arrayWithObjects:@"glass", @"water", @"chair", nil] mutableCopy];
    
}

#pragma mark -tableView methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;
    cell.imageView.image = [UIImage imageNamed:creature.imageName];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.battleButton.enabled = YES;
    
}

#pragma mark -button Methods

- (IBAction)addButtonPressed:(UIButton *)sender {
    MagicalCreature *creature = [MagicalCreature new];
    creature.name = self.userTextField.text;
    creature.detail = self.userDescriptionField.text;
    creature.accessories = self.creatureAccessories;
    
    int rand = arc4random_uniform((int) self.creatureImages.count);
    creature.imageName = [self.creatureImages objectAtIndex:rand];
    [self.creatures addObject:creature];
    
    [self.tableView reloadData];
    self.userTextField.text = @"";
    [self.userTextField resignFirstResponder];
    self.userDescriptionField.text = @"";
    [self.userDescriptionField resignFirstResponder];
    sender.enabled = NO;
    
}
- (IBAction)onEditingChanged:(UITextField *)sender {
    NSCharacterSet *spaces = [NSCharacterSet whitespaceCharacterSet];
    if ([sender.text stringByTrimmingCharactersInSet:spaces].length > 0) {
        if ([self.userDescriptionField.text stringByTrimmingCharactersInSet:spaces].length > 0) {
            self.addButton.enabled = YES;
        }
    }
    else {
        self.addButton.enabled = NO;
    }
}
- (IBAction)onDescriptionEditingChanged:(UITextField *)sender {
    NSCharacterSet *spaces = [NSCharacterSet whitespaceCharacterSet];
    if ([sender.text stringByTrimmingCharactersInSet:spaces].length > 0) {
        if ([self.userTextField.text stringByTrimmingCharactersInSet:spaces].length > 0) {
            self.addButton.enabled = YES;
        }
    }
    else {
        self.addButton.enabled = NO;
    }

}

#pragma mark -Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowCreatureSegue"]) {
        CreatureViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
        
        vc.creature = creature;
        vc.creaturesArray = self.creatures;
        vc.indexPath = [self.tableView indexPathForSelectedRow];
        
    }
    
}

-(IBAction)unwindSegue:(UIStoryboardSegue *)sender {
    
}

@end
