#if __has_feature(objc_arc) && !__has_feature(objc_arc_fields)
#error "Metal requires __has_feature(objc_arc_field) if ARC is enabled (use a more recent compiler version)"
#endif

#import <Metal/Metal.h>
#import <QuartzCore/QuartzCore.h>

typedef void MTLDevice;

MTLDevice* MTL_create_system_default_device(void)
{
    return MTLCreateSystemDefaultDevice();
}
