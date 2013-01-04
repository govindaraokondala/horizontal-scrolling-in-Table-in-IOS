//
//  TableViewController.m
//  ScrollViewPreview
//
//  Created by Hb on 04/01/13.
//  Copyright (c) 2013 HB 23. All rights reserved.
//

#import "TableViewController.h"
#import "CustomTableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize totalData,scrollPages;
@synthesize categoryList;
@synthesize counter;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"ScrollView";
    self.counter=0;
    self.totalData=[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Articles" ofType:@"plist"]];
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(localizedCompare:)];
    self.categoryList = [self.totalData.allKeys sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
   
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return [self.categoryList count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.categoryList objectAtIndex:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"CustomTableViewCell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   if(cell==nil)
   {
       NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:nil options:nil];
       for (id oneObject in nib) 
           if ([oneObject isKindOfClass:[CustomTableViewCell class]])
               cell = (CustomTableViewCell *)oneObject;

   }
    self.scrollPages =[self.totalData objectForKey:[categoryList objectAtIndex:indexPath.section]];
    cell.scrollViewPreview.contentSize=CGSizeMake([self.scrollPages count]*100, 100);
    [cell.scrollViewPreview setShowsHorizontalScrollIndicator:NO];
    cell.scrollViewPreview.bounces=NO;
    
    for(int i=0;i<[self.scrollPages count] ;i++)
    {
        UIButton *temp_btn=[UIButton buttonWithType:UIButtonTypeCustom];
        temp_btn.frame=CGRectMake(i*100, 0, 100, 70);
        [temp_btn setImage:[UIImage imageNamed:[[self.scrollPages objectAtIndex:i] objectForKey:@"ImageName"]] forState:UIControlStateNormal];
        [temp_btn setImage:[UIImage imageNamed:[[self.scrollPages objectAtIndex:i] objectForKey:@"ImageName"]] forState:UIControlStateHighlighted];
        [temp_btn setImage:[UIImage imageNamed:[[self.scrollPages objectAtIndex:i] objectForKey:@"ImageName"]] forState:UIControlStateSelected];
        temp_btn.tag=self.counter;
        [temp_btn addTarget:self action:@selector(imageClicked:) forControlEvents:UIControlEventTouchUpInside];
        [cell.scrollViewPreview addSubview:temp_btn];
        
        UILabel *textLbl=[[UILabel alloc] initWithFrame:CGRectMake(i*100, 70, 100, 30)];
        textLbl.text=[[self.scrollPages objectAtIndex:i] objectForKey:@"ImageName"];
        textLbl.backgroundColor=[UIColor colorWithRed:191.0/255.0 green:26.0/255.0 blue:51.0/255.0 alpha:1];
        textLbl.textColor=[UIColor whiteColor];
        textLbl.textAlignment=UITextAlignmentCenter;
        textLbl.contentMode=UIViewContentModeScaleToFill;
        [cell.scrollViewPreview addSubview:textLbl];
        self.counter++;
    }
    return cell;
}

-(void)imageClicked:(UIButton *)sender
{
    NSLog(@"Index: %i",sender.tag);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
