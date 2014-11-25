//
//  UIImage+HLSExtensions.h
//  CoconutKit
//
//  Created by Samuel Défago on 14.07.11.
//  Copyright 2011 Samuel Défago. All rights reserved.
//

@interface UIImage (HLSExtensions)

/**
 * Return an image from the CoconutKit-resources bundle
 */
+ (instancetype)coconutKitImageNamed:(NSString *)imageName;

/**
 * Return a 1x1 px image having a given color
 */
+ (instancetype)imageWithColor:(UIColor *)color;

/**
 * Return the receiver masked with some image. Black mask pixels correspond to unmasked portions. To make parts of
 * the mask transparent, use pixels between black (opaque) and white (transparent), not an alpha
 */
- (UIImage *)imageMaskedWithImage:(UIImage *)maskImage;

/**
 * Return the image scaled to fill the specified size. The image will be stretched as needed
 */
- (UIImage *)imageScaledToSize:(CGSize)size;

@end
