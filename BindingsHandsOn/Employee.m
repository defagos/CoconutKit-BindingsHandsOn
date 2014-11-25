//
//  Employee.m
//  BindingsHandsOn
//
//  Created by Samuel Defago on 19/11/14.
//  Copyright (c) 2014 Samuel Défago. All rights reserved.
//

#import "Employee.h"

@implementation Employee

+ (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    });
    return dateFormatter;
}

- (BOOL)validateName:(NSString **)pName error:(NSError **)pError
{
    if (! pName || (*pName).length == 0) {
        if (pError) {
            *pError = [NSError errorWithDomain:@"ch.defagos.BindingsHandsOn"
                                          code:42
                                      userInfo:@{ NSLocalizedDescriptionKey : @"The name is mandatory" }];
        }
        return NO;
    }
    return YES;
}

@end
