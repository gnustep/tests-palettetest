/* All Rights reserved */

#include <AppKit/AppKit.h>
#include "TestPalette.h"
#include "TestView.h"
#include "TestNonUIObject.h"

static NSImage *image = nil;

@implementation TestView (TestPaletteInspector)

- (NSString *)inspectorClassName
{
    return @"TestInspector";
}

@end

@implementation TestNonUIObject (IBObjectProtocol)
- (NSImage *)imageForViewer
{
  /*
  NSBundle *bundle = [NSBundle mainBundle];
  NSString *path = [bundle pathForImageResource: @"TestNonUIObject"];
  NSImage  *image = [[NSImage alloc] initWithContentsOfFile: path];
  NSLog(@"path = %@",path);
  */
  return image;
}
@end

@implementation TestPalette

+ (void) initialize
{
  if(self == [TestPalette class])
    {
      NSBundle *bundle = [NSBundle bundleForClass: [self class]];
      NSString *path = [bundle pathForImageResource: @"TestNonUIObject"];
      NSLog(@"path = %@",path);
      image = [[NSImage alloc] initWithContentsOfFile: path];
    }
}

- (void)finishInstantiate
{
  NSButton *v = [[NSButton alloc] initWithFrame: NSMakeRect(10,10,48,48)];
  NSBundle *bundle = [NSBundle bundleForClass: [self class]];
  NSString *path = [bundle pathForImageResource: @"TestNonUIObject"];
  NSImage  *dragImage = [[NSImage alloc] initWithContentsOfFile: path];
  id       obj = [TestNonUIObject new];
  NSView   *contents = [originalWindow contentView];

    /* `finishInstantiate' can be used to associate non-view objects with
     * a view in the palette's nib.  For example:
     *   [self associateObject:aNonUIObject ofType:IBObjectPboardType
     *                withView:aView];
     */

  [v setBordered: NO];
  [v setImage: dragImage];
  [v setImagePosition: NSImageOverlaps];
  [v setTitle: nil];
  [contents addSubview: v];
  [self associateObject: obj
	type: IBObjectPboardType
	with: v];

}

@end
