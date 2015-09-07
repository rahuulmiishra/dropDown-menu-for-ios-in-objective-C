//
//  ViewController.m
//  DropDownMenu
//
//  Created by Fstech042 on 07/09/15.
//  Copyright (c) 2015 rahul. All rights reserved.
//

#import "ViewController.h"
#import "DropDownMenu.h"

@interface ViewController ()

{
    DropDownMenu *sb;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDropDown:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    sb = (DropDownMenu *)[storyboard instantiateViewControllerWithIdentifier:@"DropDownMenu"];
    
    
    [sb willMoveToParentViewController:self];
    CGRect newFrame= CGRectMake(self.view.center.x+5, 160, 110, self.view.frame.size.height/2);  //Change this to adjust the position of List and size of list
    [sb.view setFrame:newFrame];
    [self.view addSubview:sb.view];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"selectedListItem" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeValue:)
                                                 name:@"selectedListItem"
                                               object:nil];
    
    
    [self addChildViewController:sb];
    [sb didMoveToParentViewController:self];

}

- (void)changeValue:(NSNotification *)notify
{
  NSString *selItem = [[notify userInfo] valueForKey:@"item"];
    NSLog(@"%@",selItem);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch ;
    touch = [[event allTouches] anyObject];
    
    
    if ([touch view] == self.view) //to remove the list when tapped outside
    {
        //Do what ever you want
        [sb.view removeFromSuperview];
    }
    
}

@end
