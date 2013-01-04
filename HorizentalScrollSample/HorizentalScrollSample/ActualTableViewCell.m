
//
//  ActualTableViewCell.m
//  HorizentalScrollSample
//
//  Created by Hb on 04/01/13.
//  Copyright (c) 2013 HB 23. All rights reserved.
//

#import "ActualTableViewCell.h"

@implementation ActualTableViewCell
@synthesize tileImg,titleName;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
