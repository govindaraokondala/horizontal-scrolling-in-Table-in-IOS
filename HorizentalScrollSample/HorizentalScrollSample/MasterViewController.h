//
//  MasterViewController.h
//  HorizentalScrollSample
//
//  Created by Hb on 04/01/13.
//  Copyright (c) 2013 HB 23. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewCell;

@interface MasterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *tableView;
    TableViewCell *tableViewCell;
    
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet TableViewCell *tableViewCell;
@property (nonatomic, retain) NSArray *sectionsNames;
@property (nonatomic, retain) NSDictionary *totalData;
@end
