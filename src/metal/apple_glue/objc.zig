const std = @import("std");
const Metal = @import("../metal.zig");
const NS = @import("ns.zig");

pub extern fn MTLCreateSystemDefaultDevice() callconv(.C) ?*Metal.Device;

pub extern fn mtl_compile_options_new() callconv(.C) ?*Metal.CompileOptions;
pub extern fn mtl_compile_options_get_language_version(*Metal.CompileOptions) callconv(.C) Metal.LanguageVersion;
pub extern fn mtl_compile_options_set_language_version(*Metal.CompileOptions, Metal.LanguageVersion) callconv(.C) void;
pub extern fn mtl_compile_options_get_fast_math_enabled(*Metal.CompileOptions) callconv(.C) bool;
pub extern fn mtl_compile_options_set_fast_math_enabled(*Metal.CompileOptions, bool) callconv(.C) void;

pub extern fn mtl_device_get_name(*Metal.Device) callconv(.C) ?[*:0]u8;
pub extern fn mtl_device_is_headless(*Metal.Device) callconv(.C) bool;
pub extern fn mtl_device_is_low_power(*Metal.Device) callconv(.C) bool;
pub extern fn mtl_device_is_removable(*Metal.Device) callconv(.C) bool;
pub extern fn mtl_device_has_unified_memory(*Metal.Device) callconv(.C) bool;
pub extern fn mtl_device_supports_gpu_family(*Metal.Device, Metal.GPUFamily) callconv(.C) bool;
pub extern fn mtl_device_supports_feature_set(*Metal.Device, Metal.FeatureSet) callconv(.C) bool;
pub extern fn mtl_device_get_location(*Metal.Device) callconv(.C) Metal.Device.Location;
pub extern fn mtl_device_get_location_number(*Metal.Device) callconv(.C) u64;
pub extern fn mtl_device_get_registry_id(*Metal.Device) callconv(.C) u64;
pub extern fn mtl_device_get_max_transfer_rate(*Metal.Device) callconv(.C) u64;
pub extern fn mtl_device_get_peer_group_id(*Metal.Device) callconv(.C) u64;
pub extern fn mtl_device_get_peer_count(*Metal.Device) callconv(.C) u32;
pub extern fn mtl_device_get_peer_index(*Metal.Device) callconv(.C) u32;
pub extern fn mtl_device_get_max_buffer_length(*Metal.Device) callconv(.C) NS.UInteger;

comptime
{
    std.testing.refAllDecls(@This());
}
