const std = @import("std");
//const glfw = @cImport({
    //@cInclude("GLFW/glfw3.h");
//});
const print = std.debug.print;
const panic = std.debug.panic;
const assert = std.debug.assert;
const Metal = @import("metal.zig");

const InitializationError = error{GLFWInitError};
fn init() InitializationError!void
{
    if (glfw.glfwInit() == 0)
    {
        return error.GLFWInitError;
    }
}

const CreateWindowError = error{CreateWindow};
fn create_window() CreateWindowError!?*glfw.GLFWwindow
{
    const window = glfw.glfwCreateWindow(640, 480, "Hello Mac world", null, null);
    if (window == null)
    {
        return error.CreateWindow;
    }

    glfw.glfwMakeContextCurrent(window);

    return window;
}

pub fn main() anyerror!void
{
    _ = Metal.Device.create_system_default() orelse
    {
        panic("Device couldn't be created\n", .{});
    };

    //_ = main_function();
    //try init();
    //const window = try create_window();

    //while (glfw.glfwWindowShouldClose(window) == 0)
    //{
        //glfw.glClear(glfw.GL_COLOR_BUFFER_BIT);
        //glfw.glfwSwapBuffers(window);
        //glfw.glfwPollEvents();
    //}
}
