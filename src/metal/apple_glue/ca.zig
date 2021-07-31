const CA = @This();

const metal = @import("../metal.zig");
const objc = @import("objc.zig");
const CG = @import("cg.zig");

pub const Metal = opaque
{
    pub const Layer = opaque
    {
        const Self = @This();

        pub fn get() ?*Self
        {
            return objc.ca_metal_layer_get();
        }

        pub fn set_device(self: *Self, device: *metal.Device) void
        {
            return objc.ca_metal_layer_set_device(self, device);
        }

        pub fn set_pixel_format(self: *Self, pixel_format: metal.PixelFormat) void
        {
            objc.ca_metal_layer_set_pixel_format(self, pixel_format);
        }

        pub fn get_pixel_format(self: *Self) metal.PixelFormat
        {
            return objc.ca_metal_layer_get_pixel_format(self);
        }

        pub fn set_drawable_size(self: *Self, drawable_size: CG.Size) void
        {
            objc.ca_metal_layer_set_drawable_size(self, drawable_size);
        }

        pub fn get_next_drawable(self: *Self) ?*CA.Metal.Drawable
        {
            return objc.ca_metal_layer_get_next_drawable(self);
        }
    };

    pub const Drawable = opaque
    {
        const Self = @This();

        pub fn get_texture(self: *Self) ?*metal.Texture
        {
            return objc.ca_metal_drawable_get_texture(self);
        }
    };
};
