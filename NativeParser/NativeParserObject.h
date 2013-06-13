//
//  NativeParserObject.h
//  NativeParser
//
//  Created by Reza Fatahi on 6/13/13.
//  Copyright (c) 2013 Rex Fatahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NativeParserObject : NSObject

+ (NSString *)scanString:(NSString *)string startTag:(NSString *)startTag endTag:(NSString *)endTag;

@end
