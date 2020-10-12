//
//  MyPreferences.m
//  MyPreferences
//
//  Created by Toshimi Ataku on 2020/10/10.
//  Copyright © 2020 Toshimi Ataku. All rights reserved.
//

#import "MyPreferences.h"

@implementation MyPreferences

+ (void)initialize {
   // Register the preference defaults early.
    id keys[] = {
        @"boolForKey",
        @"stringForKey"
    };
    id objs[] = {
        [NSNumber numberWithBool:true],
        @"-N/A-"
    };
    int dictSize = sizeof(keys) / sizeof(keys[0]) > sizeof(objs) / sizeof(objs[0]) ? sizeof(objs) / sizeof(objs[0]) : sizeof(keys) / sizeof(keys[0]);
    int go = 1;

    NSDictionary *dict = [NSDictionary dictionaryWithObjects:objs forKeys:keys count: dictSize];
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    if (go)
        [pref registerDefaults:dict];
}

- (void)awakeFromNib {
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [pref dictionaryRepresentation];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key compare:@"boolForKey"] == NSOrderedSame) {
            _boolVal.state = [obj intValue] ? NSOnState : NSOffState;
        } else if ([key compare:@"stringForKey"] == NSOrderedSame) {
            _stringVal.stringValue = obj;
        }
    }];
}

- (IBAction)remove:(id)sender {
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    [[pref dictionaryRepresentation] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [pref removeObjectForKey:key];
    }];
}

- (IBAction)dumpPrefs:(id)sender {
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [pref dictionaryRepresentation];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key compare:@"boolForKey"] == NSOrderedSame) {
            NSLog(@"Key: %@, Value: %d", key, [obj intValue]);
        } else if ([key compare:@"stringForKey"] == NSOrderedSame) {
            NSLog(@"Key: %@, Value: %@", key, obj);
        }
    }];
}

- (IBAction)reload:(id)sender {
    [self awakeFromNib];
}

- (IBAction)boolForKey:(id)sender {
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    int val = [_boolVal intValue];
    [pref setObject:[NSNumber numberWithInt:val] forKey:@"boolForKey"];
}

- (IBAction)stringForKey:(id)sender {
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    id val = [_stringVal stringValue];
    [pref setObject:val forKey:@"stringForKey"];
}
@end
