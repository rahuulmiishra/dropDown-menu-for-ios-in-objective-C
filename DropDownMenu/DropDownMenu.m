//
//  SkillListVC.m
//  Skillz
//
//  Created by Fstech042 on 05/08/15.
//  Copyright (c) 2015 Fstech. All rights reserved.
//


#import "DropDownMenu.h"

@interface DropDownMenu ()

{
    IBOutlet UITableView *dropDownTable;
    
    NSArray *myList;
}

@end

@implementation DropDownMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dropDownTable.layer.borderWidth = 0.6f;
    dropDownTable.layer.cornerRadius = 2.0f;
    dropDownTable.layer.borderColor = [UIColor grayColor].CGColor;
    
    myList = [[NSArray alloc]initWithObjects:@"Obj-C",@"Swift",@"Python",@"Perl",@"Ruby",@"PHP",@"HTML",@"Switf", nil];
    

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
    
    cell.textLabel.text = [myList objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[myList objectAtIndex:indexPath.row] forKey:@"item"];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"selectedListItem"
         object:self userInfo:dictionary];
   
     [self.view removeFromSuperview];
}


@end
