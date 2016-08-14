//
//  NSString+Cache.m
//  NTConnotation
//
//  Created by Nineteen on 8/14/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NSString+Cache.h"

@implementation NSString (Cache)

- (NSInteger)fileSize {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDirectory = NO;
    
    BOOL exist = [fileManager fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (!exist) return 0;
    
    if (isDirectory) {
        NSInteger size = 0;
        NSDirectoryEnumerator *enumerator = [fileManager enumeratorAtPath:self];
        for (NSString *subPath in enumerator) {
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            size += [fileManager attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
        return size;
    } else {
        return [fileManager attributesOfItemAtPath:self error:nil].fileSize;
    }
}

@end
