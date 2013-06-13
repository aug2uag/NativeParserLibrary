//
//  NativeParserObject.m
//  NativeParser
//
//  Created by Reza Fatahi on 6/13/13.
//  Copyright (c) 2013 Rex Fatahi. All rights reserved.
//

#import "NativeParserObject.h"

@implementation NativeParserObject

+ (NSString *)scanString:(NSString *)string startTag:(NSString *)startTag endTag:(NSString *)endTag
{
    
    NSString* scanString = @"";
    
    if (string.length > 0) {
        
        NSScanner* scanner = [[NSScanner alloc] initWithString:string];
        
        [scanner scanUpToString:startTag intoString:nil];
        scanner.scanLocation += [startTag length];
        [scanner scanUpToString:endTag intoString:&scanString];
    }
    
    
    return scanString;
    
}

@end
