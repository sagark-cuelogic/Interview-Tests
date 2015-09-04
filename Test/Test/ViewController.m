//
//  ViewController.m
//  Test
//
//  Created by Sagar Kudale on 03/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import "ViewController.h"
#import "AFAPIClient.h"
#import "ImageData.h"
#import "CategoryTableViewCell.h"

@interface ViewController () {
    NSMutableDictionary *responseData;
    __weak IBOutlet UITableView *iTableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    responseData = [[NSMutableDictionary alloc] initWithCapacity:1];
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) loadData {
    AFAPIClient *client = [AFAPIClient sharedClient];
    [client GET:@"imageData.php" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject){
        NSDictionary *response = responseObject;
        
        @autoreleasepool {
            for (NSString *key in response.allKeys) {
                NSMutableArray *categoryArray = [[NSMutableArray alloc] initWithCapacity:1];
                for (NSDictionary *dictObject in [response objectForKey:key]) {
                    ImageData *imageData = [[ImageData alloc] initWithJson:dictObject];
                    [categoryArray addObject:imageData];
                }
                [responseData setObject:categoryArray forKey:key];
            }
            NSLog(@"count : %ld", (long)responseData.count);
            [iTableView reloadData];
        }
    }failure:^(NSURLSessionDataTask *task, NSError *error){
        NSLog(@"fail");
    }];
}


#pragma table view datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
    if (cell == nil) {
        cell = [[CategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
    }
    cell.imageList = [responseData objectForKey:[[responseData allKeys] objectAtIndex:1]];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [responseData count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[responseData allKeys] objectAtIndex:section];
}

@end
