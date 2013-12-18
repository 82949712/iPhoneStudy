//
//  AppStart.m
//  iPhoneStudy
//
//  Created by apple on 13-11-28.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "AppStart.h"

@implementation AppStart

+(void)registerDefault{
    //get the path for plist file
    NSString* bundlePath = [[NSBundle mainBundle]pathForResource:@"Settings" ofType:@"bundle"];
    
    if(!bundlePath){
        NSLog(@"settings path not found");
        return;
    }
    
    NSDictionary* settingsDic = [NSDictionary dictionaryWithContentsOfFile:[bundlePath stringByAppendingPathComponent:@"Root.plist"]];
    NSArray* allSettings = [settingsDic objectForKey:@"PreferenceSpecifiers"];
    NSMutableDictionary* toBeRegistered = [[NSMutableDictionary alloc]initWithCapacity:allSettings.count];
    for(NSDictionary* item in allSettings){
        id key = [item objectForKey:@"Key"];
        id value = [item objectForKey:@"DefaultValue"];
        if(key || value){
            [toBeRegistered setObject:value forKey:key];
        }
        
    }
    [[NSUserDefaults standardUserDefaults]registerDefaults:toBeRegistered];
    [[NSUserDefaults standardUserDefaults]synchronize];
}


@end
