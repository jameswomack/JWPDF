//
//  JWPDF.h
//  JWPDF
//
//  Created by James Womack on 3/27/13.
//  Copyright (c) 2013 Noble Gesture. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JWPDF : NSObject

+ (CGPDFDocumentRef)documentWithData:(NSData *)data;
+ (CGPDFDocumentRef)documentWithName:(NSString *)name;
+ (CGPDFDocumentRef)documentWithPath:(NSString *)path;

+ (void)logTitleOfDocument:(CGPDFDocumentRef)documentRef;

@end