//
//  TableViewController.h
//  ScrollViewPreview
//
//  Created by Hb on 04/01/13.
//  Copyright (c) 2013 HB 23. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
@property(nonatomic,strong)NSDictionary *totalData;
@property (nonatomic, retain) NSArray *scrollPages;
@property(nonatomic,strong)NSArray *categoryList;
@property(nonatomic)int counter;

-(void)imageClicked:(UIButton *)sender;
@end
