//
//  ImageData.h
//  Test
//
//  Created by Sagar Kudale on 03/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ImageData : NSObject
- (instancetype) initWithJson:(NSDictionary *) json;
- (NSString *) getImageURL;
@end
