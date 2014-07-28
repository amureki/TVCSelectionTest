//
//  SelectionTableViewController.h
//  TVCSelectionTest
//
//  Created by amureki on 28/07/14.
//  Copyright (c) 2014 amureki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectionObjectDelegate <NSObject>
- (void)selectedObject:(NSString *)obj;
@end

@interface SelectionTableViewController : UITableViewController
{
    NSArray *objs;
    NSString *selectedObj;
}

@property (retain, nonatomic) IBOutlet UITableView *objTable;
@property (nonatomic, assign) id<SelectionObjectDelegate>delegate;

@end