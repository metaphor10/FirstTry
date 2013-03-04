//
//  AB1ComponentCircuit.h
//  FirstTry
//
//  Created by Michael Black on 2/19/13.
//  Copyright (c) 2013 American University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AB1ComponentCircuit : NSManagedObject

@property (nonatomic, retain) UIImage *componentImage;
@property (nonatomic, retain) NSString * componentLabel;
@property (nonatomic) CGPoint componentPoint;
@property (nonatomic) double orderingValue;
@property (nonatomic, retain) NSManagedObject *componentType;

@end
