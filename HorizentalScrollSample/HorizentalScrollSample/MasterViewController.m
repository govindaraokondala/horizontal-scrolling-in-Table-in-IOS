//
//  PulseViewController.m
//  Pulse
//
//  Created by Bushra on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "TableViewCell.h"

@implementation MasterViewController
@synthesize tableView;
@synthesize tableViewCell;
@synthesize sectionsNames;

@synthesize totalData;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self.sectionsNames count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.sectionsNames objectAtIndex:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100
    ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    TableViewCell *cell = (TableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell setBackgroundColor:[UIColor clearColor]];
	if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        
        CGAffineTransform rotateTable = CGAffineTransformMakeRotation(-M_PI_2);
        tableViewCell.horizontalTableView.transform = rotateTable;
        tableViewCell.horizontalTableView.frame = CGRectMake(0, 0, tableViewCell.horizontalTableView.frame.size.width, tableViewCell.horizontalTableView.frame.size.height);
        
        tableViewCell.contentArray = [self.totalData objectForKey:[self.sectionsNames objectAtIndex:indexPath.section]];
        
        tableViewCell.horizontalTableView.allowsSelection = YES;
		cell = tableViewCell;
		//self.tableViewCell = nil;
        
	}
    cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    self.navigationItem.title=@"TableView";
    [super viewDidLoad];
    self.totalData=[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Articles" ofType:@"plist"]];
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(localizedCompare:)];
    self.sectionsNames = [self.totalData.allKeys sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"ind: %i",[indexPath row]);     
}
- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

@end
