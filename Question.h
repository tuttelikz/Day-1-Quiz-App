//
//  Question.h
//  Day 1 Quiz App
//
//  Created by Sanzhar Askaruly on 6/12/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property (strong, nonatomic) NSString *questions;
@property (strong, nonatomic) NSString *answers;
@property (strong, nonatomic) NSMutableArray *options;
@end
