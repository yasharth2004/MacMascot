#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "pic1" asset catalog image resource.
static NSString * const ACImageNamePic1 AC_SWIFT_PRIVATE = @"pic1";

/// The "pic2" asset catalog image resource.
static NSString * const ACImageNamePic2 AC_SWIFT_PRIVATE = @"pic2";

/// The "pic3" asset catalog image resource.
static NSString * const ACImageNamePic3 AC_SWIFT_PRIVATE = @"pic3";

/// The "pic7" asset catalog image resource.
static NSString * const ACImageNamePic7 AC_SWIFT_PRIVATE = @"pic7";

/// The "pic8" asset catalog image resource.
static NSString * const ACImageNamePic8 AC_SWIFT_PRIVATE = @"pic8";

/// The "pic9" asset catalog image resource.
static NSString * const ACImageNamePic9 AC_SWIFT_PRIVATE = @"pic9";

#undef AC_SWIFT_PRIVATE
