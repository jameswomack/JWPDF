//
//  JWPDF.m
//  JWPDF
//
//  Created by James Womack on 3/27/13.
//  Copyright (c) 2013 Noble Gesture. All rights reserved.
//

#import "JWPDF.h"


@implementation JWPDF


#define SEQ(a,b) [a isEqualToString:b]
#define EXT @"pdf"


+ (CGPDFDocumentRef)documentWithData:(NSData *)data
{
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    CGPDFDocumentRef pdf = CGPDFDocumentCreateWithProvider(provider);
    return pdf;
}


+ (CGPDFDocumentRef)documentWithName:(NSString *)name
{
    NSString *path = [NSBundle.mainBundle pathForResource:name ofType:SEQ(name.pathExtension, EXT)?nil:EXT];
    return [self documentWithPath:path];
}


+ (CGPDFDocumentRef)documentWithPath:(NSString *)path
{
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [self documentWithData:data];
}


+ (void)logTitleOfDocument:(CGPDFDocumentRef)documentRef
{
    char *titleKey = "Title";
    
    CGPDFStringRef titleStringRef;
    
    CGPDFDictionaryRef info = CGPDFDocumentGetInfo(documentRef);
    
    CGPDFDictionaryGetString(info, titleKey, &titleStringRef);
    
    const unsigned char *titleCstring = CGPDFStringGetBytePtr(titleStringRef);
    
    printf("title: %s\n", titleCstring);
}


@end
