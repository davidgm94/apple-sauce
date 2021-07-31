const std = @import("std");
const Metal = @import("../metal.zig");
const NS = @import("ns.zig");
const CA = @import("ca.zig");
const CG = @import("cg.zig");

pub extern fn MTLCreateSystemDefaultDevice() callconv(.C) ?*Metal.Device;

pub extern fn ca_metal_layer_get() callconv(.C) ?*CA.Metal.Layer;
pub extern fn ca_metal_layer_set_device(*CA.Metal.Layer, *Metal.Device) callconv(.C) void;
pub extern fn ca_metal_layer_set_pixel_format(*CA.Metal.Layer, Metal.PixelFormat) callconv(.C) void;
pub extern fn ca_metal_layer_get_pixel_format(*CA.Metal.Layer) callconv(.C) Metal.PixelFormat;
pub extern fn ca_metal_layer_get_next_drawable(*CA.Metal.Layer) callconv(.C) ?*CA.Metal.Drawable;
pub extern fn ca_metal_drawable_get_texture(*CA.Metal.Drawable) callconv(.C) ?*Metal.Texture;
pub extern fn ns_window_content_view_set_layer(*NS.Window, *CA.Metal.Layer) callconv(.C) void;

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

pub extern fn mtl_library_new_from_source(*Metal.Device, ?[*:0]const u8, *Metal.CompileOptions, *?*NS.Error) callconv(.C) ?*Metal.Library;

pub extern fn mtl_function_new(*Metal.Library, [*:0]const u8) callconv(.C) ?*Metal.Function;

pub extern fn mtl_command_queue_new(*Metal.Device) callconv(.C) ?*Metal.CommandQueue;
pub extern fn mtl_command_queue_get_command_buffer(*Metal.CommandQueue) callconv(.C) ?*Metal.CommandBuffer;

pub extern fn mtl_render_pipeline_descriptor_new() ?*Metal.RenderPipeline.Descriptor;
pub extern fn mtl_render_pipeline_descriptor_set_vertex_function(*Metal.RenderPipeline.Descriptor, *Metal.Function) callconv(.C) void;
pub extern fn mtl_render_pipeline_descriptor_set_fragment_function(*Metal.RenderPipeline.Descriptor, *Metal.Function) callconv(.C) void;
pub extern fn mtl_render_pipeline_descriptor_set_color_attachment_pixel_format(*Metal.RenderPipeline.Descriptor, u32, Metal.PixelFormat) callconv(.C) void;

pub extern fn mtl_render_pipeline_state_new_from_descriptor(*Metal.Device, *Metal.RenderPipeline.Descriptor, *?*NS.Error) callconv(.C) ?*Metal.RenderPipeline.State;
pub extern fn ca_metal_layer_set_drawable_size(*CA.Metal.Layer, CG.Size) callconv(.C) void;

pub extern fn mtl_render_pass_descriptor_new() callconv(.C) ?*Metal.Render.PassDescriptor;
pub extern fn mtl_render_pass_descriptor_get_color_attachment(*Metal.Render.PassDescriptor, index: u32) callconv(.C) ?*Metal.Render.PassDescriptor.ColorAttachmentDescriptor;
pub extern fn mtl_render_pass_descriptor_color_attachment_descriptor_set_texture(*Metal.Render.PassDescriptor.ColorAttachmentDescriptor, *Metal.Texture) callconv(.C) void;
pub extern fn mtl_render_pass_descriptor_color_attachment_descriptor_set_load_action(*Metal.Render.PassDescriptor.ColorAttachmentDescriptor, Metal.LoadAction) callconv(.C) void;
pub extern fn mtl_render_pass_descriptor_color_attachment_descriptor_set_clear_color(*Metal.Render.PassDescriptor.ColorAttachmentDescriptor, Metal.ClearColor) callconv(.C) void;
pub extern fn mtl_render_pass_descriptor_color_attachment_descriptor_set_store_action(*Metal.Render.PassDescriptor.ColorAttachmentDescriptor, Metal.StoreAction) callconv(.C) void;

pub extern fn mtl_render_command_encoder_new(*Metal.CommandBuffer, *Metal.Render.PassDescriptor) callconv(.C) ?*Metal.RenderCommandEncoder;
pub extern fn mtl_render_command_encoder_set_pipeline_state(*Metal.RenderCommandEncoder, *Metal.RenderPipeline.State) callconv(.C) void;
pub extern fn mtl_render_command_encoder_set_vertex_bytes_at_index(*Metal.RenderCommandEncoder, [*]u8, u64, u32) callconv(.C) void;
pub extern fn mtl_render_command_encoder_draw_primitives(*Metal.RenderCommandEncoder, Metal.PrimitiveType, NS.Integer, NS.Integer) callconv(.C) void;
pub extern fn mtl_render_command_encoder_end(*Metal.RenderCommandEncoder) callconv(.C) void;

pub extern fn mtl_command_buffer_present_drawable(*Metal.CommandBuffer, *CA.Metal.Drawable) callconv(.C) void;
pub extern fn mtl_command_buffer_commit(*Metal.CommandBuffer) callconv(.C) void;

comptime
{
    std.testing.refAllDecls(@This());
}
