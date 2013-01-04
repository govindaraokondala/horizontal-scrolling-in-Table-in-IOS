//
//  TableViewCell.m
//  Pulse
//
//  Created by Bushra on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewCell.h"
#import "ActualTableViewCell.h"

@implementation TableViewCell
@synthesize detailObj;
@synthesize horizontalTableView;
@synthesize contentArray;

- (NSString *) reuseIdentifier {
    return @"Cell";
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [contentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ActualTableViewCell";
    ActualTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if(cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ActualTableViewCell"
													 owner:self options:nil];
		for (id oneObject in nib) if ([oneObject isKindOfClass:[ActualTableViewCell class]])
			cell = (ActualTableViewCell *)oneObject;
    }
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(concurrentQueue, ^{        
        UIImage *image = nil;        
        image = [UIImage imageNamed:[[contentArray objectAtIndex:indexPath.row] objectForKey:@"ImageName"]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.tileImg setImage:image]; 
        });
    }); 
    [cell.titleName setText:[[contentArray objectAtIndex:indexPath.row] objectForKey:@"ImageName"]];
    CGAffineTransform rotate= CGAffineTransformMakeRotation(M_PI_2);
    cell.transform=rotate;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"values: %@",[contentArray objectAtIndex:indexPath.row]);  
//    self.detailObj=[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
}



@end
