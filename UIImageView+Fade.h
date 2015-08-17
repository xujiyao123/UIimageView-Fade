//
//  UIImageView+Fade.h
//  CityGuide
//
//  Created by 徐继垚 on 15/8/11.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

@interface UIImageView (Fade) <SDWebImageManagerDelegate>
- (void)setWebImageWithUrlStr:(NSString *)urlstr;

- (void)setWebImageWithUrlStr:(NSString *)urlstr placeHolder:(UIImage *)image;

- (void)setWebImageWithUrlStr:(NSString *)urlstr placeHolder:(UIImage *)image progress:(void (^)(float value))progress finish:(void (^)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL))finish;

- (void)setWebImageWithUrlStr:(NSString *)urlstr placeHolder:(UIImage *)image duration:(NSTimeInterval)duration animations:(void(^)())animations animationsCompletion:(void(^)(BOOL finished))completion progress:(void (^)(float value))progress finish:(void (^)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL))finish;
@end
