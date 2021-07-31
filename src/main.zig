const std = @import("std");
const glfw = @cImport
({
    @cDefine("GLFW_INCLUDE_NONE", "1");
    @cDefine("GLFW_EXPOSE_NATIVE_COCOA", "1");
    @cInclude("GLFW/glfw3.h");
    @cInclude("GLFW/glfw3native.h");
});
const print = std.debug.print;
const panic = std.debug.panic;
const assert = std.debug.assert;
const Metal = @import("metal/metal.zig");
const NS = Metal.NS;
const CA = Metal.CA;
const CG = Metal.CG;

const InitializationError = error{GLFWInitError};
fn init() InitializationError!void
{
    if (glfw.glfwInit() == 0)
    {
        return error.GLFWInitError;
    }
}

const CreateWindowError = error{CreateWindow};
fn create_window() CreateWindowError!*glfw.GLFWwindow
{
    glfw.glfwWindowHint(glfw.GLFW_CLIENT_API, glfw.GLFW_NO_API);
    const window = glfw.glfwCreateWindow(640, 480, "Hello Mac world", null, null) orelse
    {
        glfw.glfwTerminate();
        return error.CreateWindow;
    };

    glfw.glfwMakeContextCurrent(window);

    return window;
}

pub fn main() anyerror!void
{
    const device = Metal.Device.create_system_default() orelse
    {
        panic("Couldn't create Metal device", .{});
    };

    try init();

    const glfw_window = try create_window();

    const ns_win = @ptrCast(*NS.Window, glfw.glfwGetCocoaWindow(glfw_window) orelse panic("Cocoa window is null\n", .{}));
    print("NS window: {}\nType: {}\n", .{ns_win, @TypeOf(ns_win)});

    var layer = CA.Metal.Layer.get() orelse panic("Failed to obtain metal layer\n", .{});
    layer.set_device(device);
    layer.set_pixel_format(Metal.PixelFormat.BGRA8Unorm);
    ns_win.content_view_set_layer(layer);
    
    var compile_options = Metal.CompileOptions.new() orelse panic("unable to create compile options\n", .{});
    compile_options.set_language_version(Metal.LanguageVersion.@"1_1");
    var compile_error: ?*NS.Error = null;
    const library = device.new_library_from_source(
        \\#include <metal_stdlib>
        \\using namespace metal;
        \\vertex float4 v_simple(
        \\    constant float4* in  [[buffer(0)]],
        \\    uint             vid [[vertex_id]])
        \\{
        \\    return in[vid];
        \\}
        \\fragment float4 f_simple(
        \\    float4 in [[stage_in]])
        \\{
        \\    return float4(1, 0, 0, 1);
        \\}
        , compile_options, &compile_error) orelse
    {
        panic("Unable to create Metal library from source", .{});
    };

    print("Library: {}\n", .{library});

    const vertex_shader = Metal.Function.new(library, "v_simple") orelse panic("Unable to create vertex shader\n", .{});
    const fragment_shader = Metal.Function.new(library, "f_simple") orelse panic("Unable to create vertex shader\n", .{});
    _ = vertex_shader;
    _ = fragment_shader;

    const command_queue = Metal.CommandQueue.new(device) orelse panic("Unable to create command queue", .{});
    _ = command_queue;

    var render_pipeline_descriptor = Metal.RenderPipeline.Descriptor.new() orelse panic("failed to create render pipeline descriptor", .{});
    _ = render_pipeline_descriptor;

    render_pipeline_descriptor.set_vertex_function(vertex_shader);
    render_pipeline_descriptor.set_fragment_function(fragment_shader);
    render_pipeline_descriptor.set_color_attachment_pixel_format(0, layer.get_pixel_format());

    var ns_error: ?*NS.Error = null;
    const render_pipeline_state = Metal.RenderPipeline.State.new_from_descriptor(device, render_pipeline_descriptor, &ns_error) orelse
    {
        panic("unable get render pipeline state\n", .{});
    };
    _ = render_pipeline_state;

    while (glfw.glfwWindowShouldClose(glfw_window) == 0)
    {
        var width: f32 = undefined;
        var height: f32 = undefined;
        glfw.glfwGetFramebufferSize(glfw_window, @ptrCast(*i32, &width), @ptrCast(*i32, &height));

        const ratio = width / height;
        _ = ratio;

        layer.set_drawable_size(CG.Size.make(width, height));
        const drawable = layer.get_next_drawable() orelse panic("Unable to get Metal drawable", .{});
        _ = drawable;

        const command_buffer = command_queue.get_command_buffer() orelse panic("Unable to get command buffer from queue", .{});

        var render_pass_descriptor = Metal.Render.PassDescriptor.new() orelse panic("Can't get rpd", .{});
        var color_attachment = render_pass_descriptor.get_color_attachment(0) orelse panic("unable to get color attachment", .{});
        color_attachment.set_texture(drawable.get_texture() orelse panic("uanble to get drawable texture", .{}));
        color_attachment.set_load_action(Metal.LoadAction.clear);
        color_attachment.set_clear_color(Metal.ClearColor.make(1.0, 1.0, 1.0, 1.0));
        color_attachment.set_store_action(.store);


        var render_command_encoder = Metal.RenderCommandEncoder.new(command_buffer, render_pass_descriptor) orelse panic("unable to get RCE", .{});
        render_command_encoder.set_render_pipeline_state(render_pipeline_state);
        render_command_encoder.set_vertex_bytes_at_index(
            [_][4]f32
            {
                .{0,0,0,1},
                .{-1,1,0,1},
                .{1,1,0,1},
            },
            0);

        render_command_encoder.draw_primitives(.triangle, 0, 3);
        render_command_encoder.end();

        command_buffer.present_drawable(drawable);
        command_buffer.commit();

        glfw.glfwPollEvents();
    }

    glfw.glfwDestroyWindow(glfw_window);
    glfw.glfwTerminate();
}
        //id<MTLRenderCommandEncoder> rce = [cb renderCommandEncoderWithDescriptor:rpd];

        //[rce setRenderPipelineState:rps];
        //[rce setVertexBytes:(vector_float4[]){
            //{ 0, 0, 0, 1 },
            //{ -1, 1, 0, 1 },
            //{ 1, 1, 0, 1 },
        //} length:3 * sizeof(vector_float4) atIndex:0];
        //[rce drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:3];

        //[rce endEncoding];
        //[cb presentDrawable:drawable];
        //[cb commit];

        //glfwPollEvents();
    //}
//}

//static void error_callback(int error, const char* description)
//{
    //fputs(description, stderr);
//}

//static void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods)
//{
    //if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
        //glfwSetWindowShouldClose(window, GLFW_TRUE);
//}
