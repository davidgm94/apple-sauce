const NS = @This();
const CA = @import("ca.zig");
pub const objc = @import("objc.zig");

pub const Integer = i64;
pub const UInteger = u64;

pub const String = opaque
{
    fn new(c_str: [*]u8) *String
    {
        return objc.mtl_NSString(c_str);
    }
};

pub const Error = opaque
{
    pub fn get_code(self: *Error) NS.Integer
    {
        return objc.ns_error_get_code(self);
    }
    
    pub fn get_domain(self: *Error) ?[*:0]u8
    {
        return objc.ns_error_get_domain(self);
    }

    pub fn get_user_info(self: *Error) ?[*:0]u8
    {
        return objc.ns_error_get_user_info(self);
    }

    pub fn get_localized_description(self: *Error) ?[*:0]u8
    {
        return objc.ns_error_get_localized_description(self);
    }

    pub fn get_localized_recovery_options(self: *Error) ?*?[*:0]u8
    {
        return objc.ns_error_get_localized_recovery_options(self);
    }

    pub fn get_localized_recovery_suggestion(self: *Error) ?[*:0]u8
    {
        return objc.ns_error_get_localized_recovery_suggestion(self);
    }

    pub fn get_localized_failure_reason(self: *Error) ?[*:0]u8
    {
        return objc.ns_error_get_localized_failure_reason(self);
    }
};

pub const Window = opaque
{
    const Self = @This();

    pub fn content_view_set_layer(self: *Self, layer: *CA.Metal.Layer) void
    {
        objc.ns_window_content_view_set_layer(self, layer);
    }
};
