//
//  UIImageView+Fade.m
//  CityGuide
//
//  Created by 徐继垚 on 15/8/11.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "UIImageView+Fade.h"

@implementation UIImageView (Fade)
- (void)setWebImageWithUrlStr:(NSString *)urlstr
{
    [self sd_setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.alpha = 0;
        [UIView transitionWithView:self duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.alpha = 1;
        } completion:nil];
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
}
- (void)setWebImageWithUrlStr:(NSString *)urlstr placeHolder:(UIImage *)image
{
    [self sd_setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:image options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.alpha = 0;
        [UIView transitionWithView:self duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.alpha = 1;
        } completion:^(BOOL finished) {
        }];
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
  
    }];
    
    
}
-(void)setWebImageWithUrlStr:(NSString *)urlstr placeHolder:(UIImage *)image progress:(void (^)(float))progress finish:(void (^)(UIImage *, NSError *, SDImageCacheType, NSURL *))finish
{
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:image options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.alpha = 0;
        [UIView transitionWithView:self duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.alpha = 1;
        } completion:^(BOOL finished) {
        }];
        
        float value =   (float)receivedSize / (float)expectedSize;
        if (progress) {
            progress(value);
        }
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (finish) {
            finish(image , error , cacheType , imageURL);
        }
    }];
    
    
}
- (void)setWebImageWithUrlStr:(NSString *)urlstr placeHolder:(UIImage *)image duration:(NSTimeInterval)duration animations:(void(^)())animations animationsCompletion:(void(^)(BOOL finished))completion progress:(void (^)(float value))progress finish:(void (^)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL))finish
{
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:image options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.alpha = 0;
        [UIView transitionWithView:self duration:duration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.alpha = 1;
            if (animations) {
                animations();
            }
        } completion:^(BOOL finished) {
            if (completion) {
                completion(finished);
            }
        }];
        
       
        
        float value =   (float)receivedSize / (float)expectedSize;
        if (progress) {
            progress(value);
        }
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (finish) {
            finish(image , error , cacheType , imageURL);
        }
        
    }];
    
    
    
    
}

@end
