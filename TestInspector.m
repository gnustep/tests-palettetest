//
//  TestInspector.m
//  Test
//
//  Created by Gregory Casamento on Sat Jul 10 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#include "TestInspector.h"
#include "TestView.h"

@implementation TestInspector

- (id)init
{
    self = [super init];
    [NSBundle loadNibNamed:@"TestInspector" owner:self];
    return self;
}

- (void)ok:(id)sender
{
	/* Your code Here */
    [super ok:sender];
}

- (void)revert:(id)sender
{
	/* Your code Here */
    [super revert:sender];
}

@end
