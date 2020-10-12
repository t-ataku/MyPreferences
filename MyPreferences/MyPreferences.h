//
//  MyPreferences.h
//  MyPreferences
//
//  Created by Toshimi Ataku on 2020/10/10.
//  Copyright © 2020 Toshimi Ataku. All rights reserved.
//

#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPreferences : NSObject
@property (weak) IBOutlet NSButton *boolVal;
@property (weak) IBOutlet NSTextField *stringVal;

@end

NS_ASSUME_NONNULL_END
