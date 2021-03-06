//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class COScript, ECASLClient, MSPluginBundle, MSPluginCommandSpecifier, MSPluginScript, NSMutableString, NSString, NSTimer;



@protocol MSPluginCommand <NSObject>

+ (id)commandWithJSON:(id)arg1 scripts:(id)arg2 scriptsURL:(id)arg3;
+ (id)legacyCommandFromScriptAtURL:(id)arg1;
+ (id)rawShortcutStringForPluginAtURL:(id)arg1;

@property(readonly, nonatomic) MSPluginCommandSpecifier *commandSpecifier;
- (void)coscript:(id)arg1 hadError:(id)arg2 onLineNumber:(long long)arg3 atSourceURL:(id)arg4;
- (void)error:(id)arg1;
@property(readonly, copy, nonatomic) NSString *handler; // @synthesize handler=_handler;
@property(readonly, copy, nonatomic) NSString *identifier; // @synthesize identifier=_identifier;
- (id)initWithScript:(id)arg1 identifier:(id)arg2 name:(id)arg3 handler:(id)arg4 shortcut:(id)arg5;
@property(nonatomic) double lastTimerInterval; // @synthesize lastTimerInterval=_lastTimerInterval;
@property(retain, nonatomic) NSMutableString *log; // @synthesize log=_log;
@property(retain, nonatomic) ECASLClient *logger; // @synthesize logger=_logger;
- (id)menuItemWithAction:(SEL)arg1;
- (id)metadata;
@property(readonly, copy, nonatomic) NSString *name; // @synthesize name=_name;
@property(nonatomic) __weak MSPluginBundle *pluginBundle; // @synthesize pluginBundle=_pluginBundle;
- (id)pluginBundleIdentifierForMetadata;
- (void)print:(id)arg1;
- (void)purgeCompletedSession;
- (id)run:(id)arg1;
@property(readonly, nonatomic) MSPluginScript *script; // @synthesize script=_script;
@property(retain, nonatomic) COScript *session; // @synthesize session=_session;
@property(retain, nonatomic) NSTimer *sessionTimer; // @synthesize sessionTimer=_sessionTimer;
@property(nonatomic) BOOL skipNextLog; // @synthesize skipNextLog=_skipNextLog;
- (void)setValue:(id)arg1 forKey:(id)arg2 onLayer:(id)arg3;
- (void)setValue:(id)arg1 forKey:(id)arg2 onLayer:(id)arg3 forPluginIdentifier:(id)arg4;
@property(readonly, nonatomic) NSString *shortcut; // @synthesize shortcut=_shortcut;
- (id)shortcutKey;
- (unsigned long long)shortcutModifiers;
- (id)valueForKey:(id)arg1 onLayer:(id)arg2;
- (id)valueForKey:(id)arg1 onLayer:(id)arg2 forPluginIdentifier:(id)arg3;

@end


@interface MSPluginCommand : NSObject <MSPluginCommand>

@end
