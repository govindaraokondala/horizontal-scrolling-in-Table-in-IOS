//
//  TableViewCell.h
//  Pulse
//
//  Created by Bushra on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface TableViewCell : UITableViewCell <UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *horizontalTableView;
    
    NSArray *contentArray;
}
@property(nonatomic,strong)DetailViewController *detailObj;
@property (nonatomic, retain) IBOutlet UITableView *horizontalTableView;
@property (nonatomic, retain) NSArray *contentArray;

- (NSString *) reuseIdentifier;

@end
