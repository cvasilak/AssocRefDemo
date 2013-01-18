//
//  PagedList.m
//  AssocRefDemo
//

#import <objc/runtime.h>
#import "PagedList.h"

static char const * const NameTagKey = "ObjectTag";
static char const * const PipeTagKey = "ObjectPipe";

@implementation NSArray(PagedList)

@dynamic name;
@dynamic pipe;

/*
 this does not work, class clustering of NSArray
-(id)initWithPipe:(NSString*)pipe {
    self = [super init];
    if (self) {
        self.pipe = pipe;
    }
    
    return self;
}
*/

-(NSString*) name {
    return objc_getAssociatedObject(self, NameTagKey);
}

-(void) setName:(NSString*) name {
     objc_setAssociatedObject(self, NameTagKey, name, OBJC_ASSOCIATION_COPY);
}

-(NSString*) pipe {
    return objc_getAssociatedObject(self, PipeTagKey);
}

-(void) setPipe:(NSString*) pipe {
    objc_setAssociatedObject(self, PipeTagKey, pipe, OBJC_ASSOCIATION_COPY);
}

@end
