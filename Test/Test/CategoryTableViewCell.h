//
//  CategoryTableViewCell.h
//  Test
//
//  Created by Sagar Kudale on 03/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryTableViewCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *imageList;
@end
