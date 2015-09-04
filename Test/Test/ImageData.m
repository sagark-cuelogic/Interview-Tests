//
//  ImageData.m
//  Test
//
//  Created by Sagar Kudale on 03/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import "ImageData.h"

@implementation ImageData {
    NSString *url;
    NSString *name;
}
- (instancetype) initWithJson:(NSDictionary *) json {
    self = [super init];
    if (self) {
        url = [json objectForKey:@"imgURL"];
        name = [json objectForKey:@"name"];
    }
    return self;
}

- (NSString *) getImageURL {
    
    return url;
}
@end
