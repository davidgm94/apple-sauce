pub const Size = extern struct
{
    const Self = @This();

    width: f32,
    height: f32,

    pub fn make(width: f32, height: f32) Self
    {
        return .{ .width = width, .height = height };
    }
};

