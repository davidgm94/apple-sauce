const Metal = @import("../metal.zig");
const NS = @import("ns.zig");

pub extern fn MTLCreateSystemDefaultDevice() callconv(.C) ?*Metal.Device;
pub extern fn mtl_compile_options_new() callconv(.C) ?*Metal.CompileOptions;
pub extern fn mtl_compile_options_get_language_version(*Metal.CompileOptions) callconv(.C) Metal.CompileOptions.LanguageVersion;
pub extern fn mtl_compile_options_set_language_version(*Metal.CompileOptions, Metal.CompileOptions.LanguageVersion) callconv(.C) void;
pub extern fn mtl_NSString([*]const u8) *NS.String;
