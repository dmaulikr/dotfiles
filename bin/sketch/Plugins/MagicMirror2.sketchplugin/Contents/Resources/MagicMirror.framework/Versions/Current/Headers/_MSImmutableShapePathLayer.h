//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MSImmutableLayer.h"

@class MSImmutableShapePath;

@interface _MSImmutableShapePathLayer : MSImmutableLayer
{
    long long _booleanOperation;
    BOOL _edited;
    MSImmutableShapePath *_path;
}


@property(nonatomic) long long booleanOperation; // @synthesize booleanOperation=_booleanOperation;
- (void)decodePropertiesWithCoder:(id)arg1;
@property(nonatomic) BOOL edited; // @synthesize edited=_edited;
- (void)encodePropertiesWithCoder:(id)arg1;
- (void)enumerateChildProperties:(CDUnknownBlockType)arg1;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;
- (BOOL)hasDefaultValues;
- (id)initWithMutableModelObject:(id)arg1;
@property(retain, nonatomic) MSImmutableShapePath *path; // @synthesize path=_path;

@end
