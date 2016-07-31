//
//  NTInformationTableViewCell.m
//  NTConnotation
//
//  Created by Nineteen on 7/31/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTInformationTableViewCell.h"

@implementation NTInformationTableViewCell

const int margin = 5;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.imageView.image != nil) {
        self.imageView.y = margin;
        self.imageView.height = self.contentView.height - 2*margin;
        self.imageView.width = self.imageView.height;
        self.textLabel.x = self.imageView.x + self.imageView.width + margin;
    }
}

@end
