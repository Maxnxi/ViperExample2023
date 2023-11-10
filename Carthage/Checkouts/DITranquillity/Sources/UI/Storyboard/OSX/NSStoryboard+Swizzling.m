//
//  UIStoryboard+Swizzling.m
//  DITranquillity
//
//  Created by Alexander Ivlev on 27/08/2017.
//  Copyright © 2017 Alexander Ivlev. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"

#if __has_include(<DITranquillity/DITranquillity-Swift.h>)
#import <DITranquillity/DITranquillity-Swift.h>
#elif __has_include("DITranquillity-Swift.h")
#import "DITranquillity-Swift.h"
#endif

@interface NSStoryboard (Swizzling)
@end

@implementation NSStoryboard (Swizzling)

+ (void)load {
  static dispatch_once_t onceToken;

  dispatch_once(&onceToken, ^{
    [self swizzleClassOriginalSelector:@selector(storyboardWithName:bundle:)
                      swizzledSelector:@selector(di_storyboardWithName:bundle:)];
  });
}

+ (nonnull instancetype)di_storyboardWithName:(NSString *)name bundle:(nullable NSBundle *)storyboardBundleOrNil {
  if (self == [NSStoryboard class]) {
    return [DIStoryboard createWithName:name bundle:storyboardBundleOrNil];
  } else {
    return [self di_storyboardWithName:name bundle:storyboardBundleOrNil];
  }
}

@end
