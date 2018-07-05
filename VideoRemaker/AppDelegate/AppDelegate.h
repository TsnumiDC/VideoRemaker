//
//  AppDelegate.h
//  VideoRemaker
//
//  Created by Dylan Chen on 2018/7/5.
//  Copyright © 2018年 Dylan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

