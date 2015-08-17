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
    __block typeof (self) weakSelf = self;
    [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:urlstr] options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if (image) {
           
        if ([weakSelf SDWebImageExist:urlstr]) {
//            weakSelf.image = image;
            weakSelf.image = [weakSelf SDWebImageForUrl:urlstr];

            weakSelf.alpha = 0;
           
                [UIView transitionWithView:weakSelf duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    weakSelf.alpha = 1;
                } completion:nil];
                     }
       else
       {
           weakSelf.image = image;
           weakSelf.alpha = 0;
           [UIView transitionWithView:weakSelf duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
               weakSelf.alpha = 1;
           } completion:nil];
            [weakSelf saveImageToCache:image forimageeURL:[NSURL URLWithString:urlstr]];
       }
            
        }
        
    }];
    
    
    
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlstr]];
//        UIImage * image = [UIImage imageWithData:data];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (image) {
//                weakSelf.alpha = 0;
//                [UIView transitionWithView:weakSelf duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
//                    weakSelf.image = image;
//                    weakSelf.alpha = 1;
//                } completion:^(BOOL finished) {
//                }];
//            }
//        });
//    });

    
    
}
- (void)setWebImageWithUrlStr:(NSString *)urlstr placeHolder:(UIImage *)image
{
    
    self.image = image;
    __block typeof (self) weakSelf = self;
    [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:urlstr] options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if (image) {
            
            if ([weakSelf SDWebImageExist:urlstr]) {
               
                   weakSelf.image = [weakSelf SDWebImageForUrl:urlstr];
                weakSelf.alpha = 0;
                
                [UIView transitionWithView:weakSelf duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    weakSelf.alpha = 1;
                } completion:nil];
             
            }
            else
            {
                weakSelf.image = image;
                weakSelf.alpha = 0;
                [UIView transitionWithView:weakSelf duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    weakSelf.alpha = 1;
                } completion:nil];
                [weakSelf saveImageToCache:image forimageeURL:[NSURL URLWithString:urlstr]];
            }
            
        }
        
    }];
    
    
    
}
-(void)setWebImageWithUrlStr:(NSString *)urlstr placeHolder:(UIImage *)image progress:(void (^)(float))progress finish:(void (^)(UIImage *, NSError *, SDImageCacheType, NSURL *))finish
{
    self.image = image;
    __block typeof (self) weakSelf = self;
    [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:urlstr] options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        float value =   (float)receivedSize / (float)expectedSize;
        if (progress) {
            progress(value);
        }
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if (image) {
            
            if ([weakSelf SDWebImageExist:urlstr]) {
                weakSelf.image = [weakSelf SDWebImageForUrl:urlstr];

                weakSelf.alpha = 0;
                
                [UIView transitionWithView:weakSelf duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    weakSelf.alpha = 1;
                } completion:nil];
            }
            else
            {
                weakSelf.image = image;
                weakSelf.alpha = 0;
                [UIView transitionWithView:weakSelf duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    weakSelf.alpha = 1;
                } completion:nil];
                [weakSelf saveImageToCache:image forimageeURL:[NSURL URLWithString:urlstr]];
            }
            
        }
        if (finish) {
            finish(image , error , cacheType , imageURL);
        }
        
    }];
    
    
}
- (void)setWebImageWithUrlStr:(NSString *)urlstr placeHolder:(UIImage *)image duration:(NSTimeInterval)duration animations:(void(^)())animations animationsCompletion:(void(^)(BOOL finished))completion progress:(void (^)(float value))progress finish:(void (^)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL))finish
{
    self.image = image;
    __block typeof (self) weakSelf = self;
    [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:urlstr] options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        float value =   (float)receivedSize / (float)expectedSize;
        if (progress) {
            progress(value);
        }
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if (image) {
            
            if ([weakSelf SDWebImageExist:urlstr]) {
                weakSelf.image = [weakSelf SDWebImageForUrl:urlstr];

                weakSelf.alpha = 0;
                
                [UIView transitionWithView:weakSelf duration:duration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    weakSelf.alpha = 1;
                    
                    if (animations) {
                        animations();
                    }
                } completion:^(BOOL finished) {
                    if (completion) {
                        completion(finished);
                    }
                }];
                          }
            else
            {
                weakSelf.image = image;
                weakSelf.alpha = 0;
                [UIView transitionWithView:weakSelf duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    weakSelf.alpha = 1;
                } completion:nil];
                [weakSelf saveImageToCache:image forimageeURL:[NSURL URLWithString:urlstr]];
            }
            
        }
        if (finish) {
            finish(image , error , cacheType , imageURL);
        }
        
    }];
    
}

- (void)saveImageToCache:(UIImage *)image forimageeURL:(NSURL *)url
{
    
    [[SDWebImageManager sharedManager]saveImageToCache:image forURL:url];
    

}
- (UIImage *)SDWebImageForUrl:(NSString *)imgUrl
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    if (![manager cachedImageExistsForURL:[NSURL URLWithString:imgUrl]]) {
        return nil;
    }
    
    NSString *key = [manager cacheKeyForURL:[NSURL URLWithString:imgUrl]];
    
    UIImage *image = [manager.imageCache imageFromMemoryCacheForKey:key];
    if (!image) {
        image = [manager.imageCache imageFromDiskCacheForKey:key];
    }
    return image;
}
- (BOOL)SDWebImageExist:(NSString *)imgUrl
{
    return [[SDWebImageManager sharedManager]  cachedImageExistsForURL:[NSURL URLWithString:imgUrl]];
    
}
@end
