//
//  SelectionTableViewController.m
//  TVCSelectionTest
//
//  Created by amureki on 28/07/14.
//  Copyright (c) 2014 amureki. All rights reserved.
//

#import "SelectionTableViewController.h"

@interface SelectionTableViewController ()<UITableViewDataSource,UITableViewDelegate> {}
@end

@implementation SelectionTableViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    objs = [[NSArray alloc]initWithObjects:@"object1",@"object", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)whenDoneButtonClicked:(id)sender {
    //when done button clicked -->
    //send a delegate to main controller
    if([self.delegate respondsToSelector:@selector(selectedObject:)])
    {
        [self.delegate selectedObject:selectedObj];
    }
    //dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return objs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [objs objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //u can manage check mark and all, i am getting the selected player name
    selectedObj = [objs objectAtIndex:indexPath.row];
}

@end