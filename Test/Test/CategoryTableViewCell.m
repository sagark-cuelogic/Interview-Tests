//
//  CategoryTableViewCell.m
//  Test
//
//  Created by Sagar Kudale on 03/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import "CategoryTableViewCell.h"
#import "CollectionViewCell.h"

@implementation CategoryTableViewCell {
    
    __weak IBOutlet UICollectionView *iCollectionView;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void) setImageList:(NSArray *)imageList {
    _imageList = imageList;
    iCollectionView.dataSource = self;
    iCollectionView.delegate = self;
    [iCollectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [self.imageList count];
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGSize retval = CGSizeMake(100, 100);
    return retval;
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0,0, 10, 0);
}
@end
