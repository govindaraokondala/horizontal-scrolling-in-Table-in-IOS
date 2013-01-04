//
//  MenuTableViewController.h
//  HorizentalScrollSample
//
//  Created by Hb on 04/01/13.
//  Copyright (c) 2013 HB 23. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "MasterViewController.h"
@interface MenuTableViewController : UITableViewController
@property(nonatomic,strong)NSMutableArray *rowData;

@property(nonatomic,strong)MasterViewController *masterView;
@property(nonatomic,strong)TableViewController *tableViewObj;
@end
