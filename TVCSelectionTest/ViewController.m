//
//  ViewController.m
//  TVCSelectionTest
//
//  Created by amureki on 28/07/14.
//  Copyright (c) 2014 amureki. All rights reserved.
//

#import "ViewController.h"
#import "SelectionTableViewController.h"

@interface ViewController () <SelectionObjectDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)whenSelectButtonClicked:(id)sender
{
    SelectionTableViewController *controller = [[SelectionTableViewController alloc]initWithNibName:@"SelectionTableViewController" bundle:nil];
    controller.delegate = self; //u must set to self
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)selectedObject:(NSString *)obj
{
    //implementation of your delegate method
    
    NSLog(@"%@",obj);
    if([obj isEqualToString:@"obj1"])
    {
        UIButton *aButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [aButton setTitle:obj forState:UIControlStateNormal];
        [aButton addTarget:self action:@selector(whenFirstObjButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        aButton.frame = CGRectMake(50, 50, 200, 55);
        [self.view addSubview:aButton];
    }
    else
    {
        UIButton *aButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [aButton setTitle:obj forState:UIControlStateNormal];
        aButton.frame = CGRectMake(50, 105, 200, 55);
        [aButton addTarget:self action:@selector(whenSecondObjButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:aButton];
    }
    
}
//now define the action methods
- (void)whenFirstObjButtonClicked:(UIButton *)sender
{
    
    NSLog(@"object 1 start");
}

- (void)whenSecondObjButtonClicked:(UIButton *)sender
{
    NSLog(@"object 2 start");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
