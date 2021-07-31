const std = @import("std");
const NS = @import("apple_glue/ns.zig");
pub const objc = @import("apple_glue/objc.zig");

pub const Size = extern struct
{
    const Self = @This();

    width: NS.UInteger,
    height: NS.UInteger,
    depth: NS.UInteger,
};

pub const PixelFormat = enum(u32)
{
    invalid = 0,

    A8Unorm = 1,
    
    R8Unorm = 10,
    R8Unorm_sRGB = 11,
    R8Snorm = 12,
    R8Uint = 13,
    R8Sint = 14,
    
    // Normal 16 bit formats

    R16Unorm = 20,
    R16Snorm = 22,
    R16Uint  = 23,
    R16Sint  = 24,
    R16Float = 25,

    RG8Unorm = 30,
    RG8Unorm_sRGB = 31,
    RG8Snorm = 32,
    RG8Uint = 33,
    RG8Sint = 34,

    B5G6R5Unorm = 40,
    A1BGR5Unorm = 41,
    ABGR4Unorm  = 42,
    BGR5A1Unorm = 43,

    // Normal 32 bit formats

    R32Uint  = 53,
    R32Sint  = 54,
    R32Float = 55,

    RG16Unorm  = 60,
    RG16Snorm  = 62,
    RG16Uint   = 63,
    RG16Sint   = 64,
    RG16Float  = 65,

    RGBA8Unorm      = 70,
    RGBA8Unorm_sRGB = 71,
    RGBA8Snorm      = 72,
    RGBA8Uint       = 73,
    RGBA8Sint       = 74,
    
    BGRA8Unorm      = 80,
    BGRA8Unorm_sRGB = 81,

    // Packed 32 bit formats

    RGB10A2Unorm = 90,
    RGB10A2Uint  = 91,

    RG11B10Float = 92,
    RGB9E5Float = 93,

    BGR10A2Unorm  = 94,

    BGR10_XR      = 554,
    BGR10_XR_sRGB = 555,

    // Normal 64 bit formats

    RG32Uint  = 103,
    RG32Sint  = 104,
    RG32Float = 105,

    RGBA16Unorm  = 110,
    RGBA16Snorm  = 112,
    RGBA16Uint   = 113,
    RGBA16Sint   = 114,
    RGBA16Float  = 115,

    BGRA10_XR      = 552,
    BGRA10_XR_sRGB = 553,

    // Normal 128 bit formats

    RGBA32Uint  = 123,
    RGBA32Sint  = 124,
    RGBA32Float = 125,

    // Compressed formats.

    // S3TC/DXT
    BC1_RGBA = 130,
    BC1_RGBA_sRGB = 131,
    BC2_RGBA = 132,
    BC2_RGBA_sRGB = 133,
    BC3_RGBA = 134,
    BC3_RGBA_sRGB = 135,

    // RGTC
    BC4_RUnorm = 140,
    BC4_RSnorm = 141,
    BC5_RGUnorm = 142,
    BC5_RGSnorm = 143,

    // BPTC
    BC6H_RGBFloat = 150,
    BC6H_RGBUfloat = 151,
    BC7_RGBAUnorm = 152,
    BC7_RGBAUnorm_sRGB = 153,

    // PVRTC
    PVRTC_RGB_2BPP = 160,
    PVRTC_RGB_2BPP_sRGB = 161,
    PVRTC_RGB_4BPP = 162,
    PVRTC_RGB_4BPP_sRGB = 163,
    PVRTC_RGBA_2BPP = 164,
    PVRTC_RGBA_2BPP_sRGB = 165,
    PVRTC_RGBA_4BPP = 166,
    PVRTC_RGBA_4BPP_sRGB = 167,

    // ETC2
    EAC_R11Unorm = 170,
    EAC_R11Snorm = 172,
    EAC_RG11Unorm = 174,
    EAC_RG11Snorm = 176,
    EAC_RGBA8 = 178,
    EAC_RGBA8_sRGB = 179,

    ETC2_RGB8 = 180,
    ETC2_RGB8_sRGB = 181,
    ETC2_RGB8A1 = 182,
    ETC2_RGB8A1_sRGB = 183,

    // ASTC
    ASTC_4x4_sRGB = 186,
    ASTC_5x4_sRGB = 187,
    ASTC_5x5_sRGB = 188,
    ASTC_6x5_sRGB = 189,
    ASTC_6x6_sRGB = 190,
    ASTC_8x5_sRGB = 192,
    ASTC_8x6_sRGB = 193,
    ASTC_8x8_sRGB = 194,
    ASTC_10x5_sRGB = 195,
    ASTC_10x6_sRGB = 196,
    ASTC_10x8_sRGB = 197,
    ASTC_10x10_sRGB = 198,
    ASTC_12x10_sRGB = 199,
    ASTC_12x12_sRGB = 200,

    ASTC_4x4_LDR = 204,
    ASTC_5x4_LDR = 205,
    ASTC_5x5_LDR = 206,
    ASTC_6x5_LDR = 207,
    ASTC_6x6_LDR = 208,
    ASTC_8x5_LDR = 210,
    ASTC_8x6_LDR = 211,
    ASTC_8x8_LDR = 212,
    ASTC_10x5_LDR = 213,
    ASTC_10x6_LDR = 214,
    ASTC_10x8_LDR = 215,
    ASTC_10x10_LDR = 216,
    ASTC_12x10_LDR = 217,
    ASTC_12x12_LDR = 218,
    
    
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_4x4_HDR = 222,
    ASTC_5x4_HDR = 223,
    ASTC_5x5_HDR = 224,
    ASTC_6x5_HDR = 225,
    ASTC_6x6_HDR = 226,
    ASTC_8x5_HDR = 228,
    ASTC_8x6_HDR = 229,
    ASTC_8x8_HDR = 230,
    ASTC_10x5_HDR = 231,
    ASTC_10x6_HDR = 232,
    ASTC_10x8_HDR = 233,
    ASTC_10x10_HDR = 234,
    ASTC_12x10_HDR = 235,
    ASTC_12x12_HDR = 236,
    GBGR422 = 240,
    BGRG422 = 241,

    // Depth

    Depth16Unorm = 250,
    Depth32Float = 252,

    // Stencil

    Stencil8 = 253,

    // Depth Stencil
    
    Depth24Unorm_Stencil8 = 255,
    Depth32Float_Stencil8 = 260,

    X32_Stencil8 = 261,
    X24_Stencil8 = 262,
};

pub const PrimitiveType = enum(u32)
{
    point = 0,
    line = 1,
    line_strip = 2,
    triangle = 3,
    triangle_strip = 4,
};

pub const VisibilityResultMode = enum(u32)
{
    disabled = 0,
    boolean = 1,
    counting = 2,
};

pub const ScissorRect = extern struct
{
    x: u32,
    y: u32,
    width: u32,
    height: u32,
};

pub const Viewport = extern struct
{
    originX: f64,
    originY: f64,
    width: f64,
    height: f64,
    znear: f64,
    zfar: f64,
};

pub const CullMode = enum(u32)
{
    none = 0,
    front = 1,
    back = 2,
};

pub const Winding = enum(u32)
{
    clockwise = 0,
    counterclockwise = 1,
};

pub const DepthClipMode = enum(u32)
{
    clip = 0,
    clamp = 1,
};

pub const TriangleFillMode = enum(u32)
{
    fill = 0,
    lines = 1,
};

pub const DrawPrimitivesIndirectArguments = extern struct
{
    vertex_count: u32,
    instance_count: u32,
    vertex_start: u32,
    base_instance: u32,
};

pub const DrawIndexedPrimitivesIndirectArguments = extern struct
{
    index_count: u32,
    instance_count: u32,
    index_start: u32,
    base_vertex: i32,
    base_instance: u32,
};

pub const DrawPatchIndirectArguments = extern struct
{
    patch_count: u32,
    instance_count: u32,
    patch_start: u32,
    base_instance: u32,
};

pub const QuadTessellationFactorsHalf = extern struct
{
    edge_tessellation_factor: [4]u16,
    inside_tessellation_factor: [2]u16,
};

pub const TriangleTessellationFactorsHalf = extern struct
{
    edge_tessellation_factor: [3]u16,
    inside_tessellation_factor: u16,
};

pub const RenderStage = enum(u32)
{
    vertex = 1 << 0,
    fragment = 1 << 1,
};

pub const LoadAction = enum(u32)
{
    dont_care = 0,
    load = 1,
    clear = 2,
};

pub const IndexType = enum(u32)
{
    uint16 = 0,
    uint32 = 1,
};

pub const StoreAction = enum(u32)
{
    dont_care = 0,
    store = 1,
    multisample_resolve = 2,
    store_and_multisample_resolve = 3,
    unknown = 4,
    custom_sample_depth_store = 5,
};


pub const LanguageVersion = enum(u32)
{
    @"1_0" = (1 << 16),
    @"1_1" = (1 << 16) + 1,

    @"2_0" = (2 << 16),
    @"2_1" = (2 << 16) + 1,
    @"2_2" = (2 << 16) + 2,
};


pub const DispatchType = enum(u32)
{
    serial,
    concurrent,
};


pub const GPUFamily = enum(u32)
{
    apple1 = 1001,
    apple2 = 1002,
    apple3 = 1003,
    apple4 = 1004,
    apple5 = 1005,

    mac1 = 2001,
    mac2 = 2002,

    common1 = 3001,
    common2 = 3002,
    common3 = 3003,

    mac_catalyst1 = 4001,
    mac_catalyst2 = 4002,
};

pub const FeatureSet = enum(u32)
{
    macos_gpu_family1_v1 = 10000,
    macos_gpu_family1_v2 = 10001,
    macos_read_write_texture_tier2 = 10002,
    macos_gpu_family1_v3 = 10003,
    macos_gpu_family1_v4 = 10004,
    macos_gpu_family2_v1 = 10005,

    const osx_gpu_family1_v1 = macos_gpu_family1_v1;
    const osx_gpu_family1_v2 = macos_gpu_family1_v2;
    const osx_read_write_texture_tier2 = macos_read_write_texture_tier2;
};

pub const PurgeableState = enum(u32)
{
    keep_current = 1,
    non_volatile = 2,
    @"volatile" = 3,
    empty = 4,
};


pub const BlitOption = enum(u32)
{
    none = 0,
    depth_from_depth_stencil = 1,
    stencil_from_depth_stencil = 2,
};

pub const LibraryError = enum(u32)
{
    unsupported = 1,
    internal = 2,
    compile_failure = 3,
    compile_warning = 4,
    function_not_found = 5,
    file_not_found = 6,
};

pub const BarrierScope = enum(u32)
{
    buffers = 1 << 0,
    textures = 1 << 1,
    render_targets = 1 << 2,
};

pub const IndirectCommandType = enum(u32)
{
    draw = 1 << 0,
    draw_indexed = 1 << 1,
    draw_patches = 1 << 2,
    draw_indexed_patches = 1 << 3,
};

pub const DataType = enum(u32)
{
    none = 0,
    structure = 1,
    array = 2,
    float = 3,
    float2 = 4,
    float3 = 5,
    float4 = 6,
    float2x2 = 7,
    float2x3 = 8,
    float2x4 = 9,
    float3x2 = 10,
    float3x3 = 11,
    float3x4 = 12,
    float4x2 = 13,
    float4x3 = 14,
    float4x4 = 15,
    half = 16,
    half2 = 17,
    half3 = 18,
    half4 = 19,
    half2x2 = 20,
    half2x3 = 21,
    half2x4 = 22,
    half3x2 = 23,
    half3x3 = 24,
    half3x4 = 25,
    half4x2 = 26,
    half4x3 = 27,
    half4x4 = 28,
    int = 29,
    int2 = 30,
    int3 = 31,
    int4 = 32,
    uint = 33,
    uint2 = 34,
    uint3 = 35,
    uint4 = 36,
    short = 37,
    short2 = 38,
    short3 = 39,
    short4 = 40,
    ushort = 41,
    ushort2 = 42,
    ushort3 = 43,
    ushort4 = 44,
    char = 37,
    char2 = 38,
    char3 = 39,
    char4 = 40,
    uchar = 41,
    uchar2 = 42,
    uchar3 = 43,
    uchar4 = 44,
    bool = 37,
    bool2 = 38,
    bool3 = 39,
    bool4 = 40,
    texture = 58,
    sampler = 59,
    pointer = 60,
    render_pipeline = 78,
    indirect_command_buffer = 80,
};


pub const TextureType = enum(u32)
{
    tex_1d = 0,
    tex_1d_array = 1,
    tex_2d = 2,
    tex_2d_array = 3,
    tex_2d_multisample = 4,
    cube = 5,
    cube_array = 6,
    tex_3d = 7,
    tex_2d_multisample_array = 8,
    texture_buffer = 9
};

pub const TextureSwizzle = enum(u32)
{
    zero = 0,
    one = 1,
    red = 2,
    green = 3,
    blue = 4,
    alpha = 5,
};


pub const PipelineOption = enum(u32)
{
    none = 0,
    argument_info = 1 << 0,
    buffer_type_info = 1 << 1,
};


pub const CPUCacheMode = enum(u32)
{
    default = 0,
    write_combined = 1,
};

pub const HazardTrackingMode = enum(u32)
{
    default = 0,
    untracked = 1,
    tracked = 2,
};

pub const StorageMode = enum(u32)
{
    shared = 0,
    managed = 1,
    private = 2,
    memoryless = 3,
};

pub const Resource = opaque
{
    const Self = @This();

    pub const Options = enum(u32)
    {
        CPUCacheMode_default = @enumToInt(CPUCacheMode.default),
        CPUCacheMode_write_combined = @enumToInt(CPUCacheMode.write_combined),
        StorageMode_managed = @enumToInt(StorageMode.managed) << 4,
        StorageMode_private = @enumToInt(StorageMode.private) << 4,
        StorageMode_memoryless = @enumToInt(StorageMode.memoryless) << 4,

        HazardTrackingMode_untracked = @enumToInt(HazardTrackingMode.untracked) << 8,
        HazardTrackingMode_tracked = @enumToInt(HazardTrackingMode.tracked) << 8,
        const StorageMode_shared = @enumToInt(StorageMode.shared) << 4;
        const HazardTrackingMode_default = @enumToInt(HazardTrackingMode.default) << 8;
    };

    pub const Usage = enum(u32)
    {
        read = 1 << 0,
        write = 1 << 1,
        sample = 1 << 2,
    };

    pub fn get_device(self: *Self) ?*Device
    {
        return objc.mtl_resource_get_device(self);
    }

    pub fn get_label(self: *Self) ?[*:0]u8
    {
        return objc.mtl_resource_get_label(self);
    }

    pub fn get_cpu_cache_mode(self: *Self) CPUCacheMode
    {
        return objc.mtl_resource_get_cpu_cache_mode(self);
    }

    pub fn get_storage_mode(self: *Self) StorageMode
    {
        return objc.mtl_resource_get_storage_mode(self);
    }

    pub fn get_hazard_tracking_mode(self: *Self) HazardTrackingMode
    {
        return objc.mtl_resource_get_hazard_tracking_mode(self);
    }

    pub fn get_options(self: *Self) Resource.Options
    {
        return objc.mtl_resource_get_options(self);
    }
};

pub const Device = opaque
{
    const Self = @This();

    pub const Location = enum(u32)
    {
        builtin = 0,
        slot = 1,
        external = 2,
        unspecified = 100,
    };

    pub fn create_system_default() ?*Device
    {
        return objc.MTLCreateSystemDefaultDevice();
    }

    pub fn get_name(self: *Self) ?[*]u8
    {
        return objc.mtl_device_get_name(self);
    }

    pub fn is_headless(self: *Self) bool
    {
        return objc.mtl_device_is_headless(self);
    }

    pub fn is_low_power(self: *Self) bool
    {
        return objc.mtl_device_is_low_power(self);
    }

    pub fn is_removable(self: *Self) bool
    {
        return objc.mtl_device_is_removable(self);
    }

    pub fn get_registry_id(self: *Self) u64
    {
        return objc.mtl_device_get_registry_id(self);
    }

    pub fn get_location(self: *Self) Device.Location
    {
        return objc.mtl_device_get_location(self);
    }

    pub fn get_location_number(self: *Self) u64
    {
        return objc.mtl_device_get_location_number(self);
    }

    pub fn get_max_transfer_rate(self: *Self) u64
    {
        return objc.mtl_device_get_max_transfer_rate(self);
    }

    pub fn has_unified_memory(self: *Self) bool
    {
        return objc.mtl_device_has_unified_memory(self);
    }

    pub fn get_peer_group_id(self: *Self) u64
    {
        return objc.mtl_device_get_peer_group_id(self);
    }

    pub fn get_peer_count(self: *Self) u32
    {
        return objc.mtl_device_get_peer_count(self);
    }

    pub fn get_peer_index(self: *Self) u32
    {
        return objc.mtl_device_get_peer_index(self);
    }

    pub fn supports_family(self: *Self, family: GPUFamily) bool
    {
        return objc.mtl_device_supports_gpu_family(self, family);
    }

    pub fn supports_feature_set(self: *Self, feature_set: FeatureSet) bool
    {
        return objc.mtl_device_supports_feature_set(self, feature_set);
    }

    pub fn get_recommended_max_working_set_size(self: *Self) u64
    {
        return objc.mtl_device_get_recommended_max_working_set_size(self);
    }

    pub fn get_current_allocated_size(self: *Self) NS.UInteger
    {
        return objc.mtl_device_get_current_allocated_size(self);
    }

    pub fn get_max_thread_group_memory_length(self: *Self) NS.UInteger
    {
        return objc.mtl_device_get_max_thread_group_memory_length(self);
    }

    pub fn get_max_threads_per_thread_group(self: *Self) Size
    {
        return objc.mtl_device_get_max_threads_per_thread_group(self);
    }

    pub fn get_max_buffer_length(self: *Self) NS.UInteger
    {
        return objc.mtl_device_get_max_buffer_length(self);
    }

    pub fn new_buffer(self: *Self, length: NS.UInteger, options: Resource.Options) ?*Buffer
    {
        return objc.mtl_device_new_buffer(self, length, options);
    }

    pub fn new_buffer_from_memory(self: *Self, memory: []const u8, options: Resource.Options) ?*Buffer
    {
        return objc.mtl_device_new_buffer_from_memory(self, memory.ptr, memory.len, options);
    }

    pub fn new_buffer_from_memory_no_copy(self: *Self, memory: []u8, options: Resource.Options) ?*Buffer
    {
        return objc.mtl_device_new_buffer_from_memory_no_copy(self, memory.ptr, memory.len, options);
    }

    pub fn new_default_library(self: *Self) ?*Library
    {
        return objc.mtl_device_new_default_library(self);
    }

    pub fn new_library_from_file(self: *Self, filepath: []const u8, ns_error: *NS.Error) ?*Library
    {
        return objc.mtl_device_new_library_from_file(self, NS.String.new(filepath.ptr), ns_error);
    }

    pub fn new_library_from_source(self: *Self, source: []const u8, compile_options: *CompileOptions, err: **NS.Error) ?*Library
    {
        return objc.mtl_device_new_library_from_source(self, NS.String.new(source.ptr), compile_options, err);
    }

    pub fn new_event(self: *Self) ?*Event
    {
        return objc.mtl_device_new_event(self);
    }

    pub fn new_shared_event(self: *Self) ?*SharedEvent
    {
        return objc.mtl_device_new_shared_event(self);
    }

    pub fn new_shared_event_with_handle(self: *Self, shared_event_handle: *SharedEvent.Handle) ?*SharedEvent
    {
        return objc.mtl_device_new_shared_event_with_handle(self, shared_event_handle);
    }

    pub fn new_fence(self: *Self) ?*Fence
    {
        return objc.mtl_device_new_fence(self);
    }
};

pub const Fence = opaque
{
};

pub const Event = opaque
{
    const Self = @This();

    pub fn get_device(self: *Self) ?*Device
    {
        return objc.mtl_event_get_device(self);
    }

    pub fn get_label(self: *Self) ?[*:0]u8
    {
        return objc.mtl_event_get_label(self);
    }
};

pub const SharedEvent = opaque
{
    const Self = @This();

    pub const Handle = opaque{};
    pub const Listener = opaque{};
    pub const NotificationBlock = opaque{};

    pub fn get_signaled_value(self: *Self) u64
    {
        return objc.mtl_shared_event_get_signaled_value(self);
    }

    pub fn new_handle(self: *Self) SharedEvent.Handle
    {
        return objc.mtl_shared_event_new_handle(self);
    }

    pub fn notify_listener(self: *Self, listener: *Listener, value: u64, notification_block: NotificationBlock) void
    {
        objc.mtl_shared_event_notify_listener(self, listener, value, notification_block);
    }
};

pub const Library = opaque
{
    const Self = @This();

    pub fn get_device(self: *Device) ?*Device
    {
        return objc.library_get_device(self);
    }

    pub fn get_label(self: *Device) ?[*:0]u8
    {
        return objc.library_get_label(self);
    }

    pub fn get_function_names(self: *Device) ?*?[*:0]u8
    {
        return objc.library_get_function_names(self);
    }
};

pub const Layer = opaque
{
    const Self = @This();

    pub fn set_device(self: *Self, device: *Device) void
    {
        return objc.mtl_layer_set_device(self, device);
    }

    pub fn set_pixel_format(self: *Self, pixel_format: PixelFormat) void
    {
        return objc.mtl_layer_set_pixel_format(self, pixel_format);
    }
};

pub const CompileOptions = opaque
{
    const Self = @This();

    pub fn new() ?*CompileOptions
    {
        return objc.mtl_compile_options_new();
    }

    pub fn get_language_version(self: *Self) LanguageVersion
    {
        return objc.mtl_compile_options_get_language_version(self);
    }

    pub fn set_language_version(self: *Self, language_version: LanguageVersion) void
    {
        objc.mtl_compile_options_set_language_version(self, language_version);
    }

    pub fn get_fast_math_enabled(self: *Self) bool
    {
        return objc.mtl_compile_options_get_fast_math_enabled(self);
    }

    pub fn set_fast_math_enabled(self: *Self, fast_math_enabled: bool) void
    {
        objc.mtl_compile_options_set_fast_math_enabled(self, fast_math_enabled);
    }
};

pub const Attribute = opaque
{
    const Self = @This();

    pub fn get_name(self: *Self) [*:0]u8
    {
        return objc.mtl_attribute_get_name(self);
    }

    pub fn get_index(self: *Self) u64
    {
        return objc.mtl_attribute_get_index(self);
    }

    pub fn get_data_type(self: *Self) DataType
    {
        return objc.mtl_attribute_get_data_type(self);
    }

    pub fn is_active(self: *Self) bool
    {
        return objc.mtl_attribute_is_active(self);
    }

    pub fn is_patch_control_point_data(self: *Self) bool
    {
        return objc.mtl_attribute_is_patch_control_point_data(self);
    }

    pub fn is_patch_data(self: *Self) bool
    {
        return objc.mtl_attribute_is_patch_data(self);
    }
};

pub const VertexAttribute = Attribute;

//pub const VertexAttribute = opaque
//{
    //const Self = @This();

    //pub fn get_name(self: *Self) [*:0]u8
    //{
        //return objc.mtl_attribute_get_name(self);
    //}

    //pub fn get_index(self: *Self) u64
    //{
        //return objc.mtl_attribute_get_index(self);
    //}

    //pub fn get_data_type(self: *Self) DataType
    //{
        //return objc.mtl_attribute_get_data_type(self);
    //}

    //pub fn is_active(self: *Self) bool
    //{
        //return objc.mtl_attribute_is_active(self);
    //}

    //pub fn is_patch_control_point_data(self: *Self) bool
    //{
        //return objc.mtl_attribute_is_patch_control_point_data(self);
    //}

    //pub fn is_patch_data(self: *Self) bool
    //{
        //return objc.mtl_attribute_is_patch_data(self);
    //}
//};
//

pub const Function = opaque
{
    const Self = @This();

    pub fn new(library: *Library, name: [:0]const u8) ?*Self
    {
        return objc.mtl_function_new(library, name.ptr);
    }

    pub fn new_from_existent(library: *Library, name: [:0]const u8, constant_values: *Function.ConstantValues, err: *NS.Error) ?*Self
    {
        return objc.mtl_function_new_from_existent(library, name.ptr, constant_values, err);
    }

    pub fn get_device(self: *Self) ?*Device
    {
        return objc.mtl_function_get_device(self);
    }

    pub fn get_label(self: *Self) ?[*:0]u8
    {
        return objc.mtl_function_get_label(self);
    }

    pub fn get_type(self: *Self) Function.Type
    {
        return objc.mtl_function_get_type(self);
    }

    pub fn get_name(self: *Self) ?[*:0]u8
    {
        return objc.mtl_function_get_name(self);
    }

    pub fn get_stage_input_attributes(self: *Self) ?[*]?*Attribute
    {
        return objc.mtl_function_get_stage_input_attributes(self);
    }

    pub const ConstantValues = opaque
    {
        fn set_index(self: *ConstantValues, value: [*]u8, data_type: DataType, index: NS.UInteger) void
        {
            objc.mtl_function_constant_values_set_index(self, value, data_type, index);
        }

        fn set_name(self: *ConstantValues, value: [*]u8, data_type: DataType, name: []const u8) void
        {
            objc.mtl_function_constant_values_set_index(self, value, data_type, name.ptr);
        }

        fn set_range(self: *ConstantValues, value: [*]u8, data_type: DataType, range: NS.Range) void
        {
            objc.mtl_function_constant_values_set_range(self, value, data_type, range);
        }

        fn reset(self: *ConstantValues) void
        {
            objc.mtl_function_constant_values_reset(self);
        }
    };

    pub const Type = enum(u32)
    {
        vertex = 1,
        fragment = 2,
        kernel = 3,
    };
};

pub const ComputePipeline = opaque
{
    pub const State = opaque
    {
        const Self = @This();

        fn new_from_function(device: *Device, function: *Function, err: *NS.Error) ?*Self
        {
            return objc.mtl_compute_pipeline_new_from_function(device, function, err);
        }

        fn new_from_reflection(device: *Device, function: *Function, options: PipelineOption, reflection: *ComputePipeline.Reflection, err: *NS.Error) ?*Self
        {
            return objc.mtl_compute_pipeline_new_from_reflection(device, function, options, reflection, err);
        }

        fn new_from_descriptor(device: *Device, descriptor: *ComputePipeline.Descriptor, options: PipelineOption, reflection: *ComputePipeline.Reflection, err: *NS.Error) ?*Self
        {
            return objc.mtl_compute_pipeline_new_from_descriptor(device, descriptor, options, reflection, err);
        }

        pub fn get_device(self: *Self) ?*Device
        {
            return objc.mtl_resource_get_device(self);
        }

        pub fn get_label(self: *Self) ?[*:0]u8
        {
            return objc.mtl_resource_get_label(self);
        }

        pub fn get_max_threads_per_thread_group(self: *Self) NS.UInteger
        {
            return objc.mtl_compute_pipeline_state_get_max_threads_per_thread_group(self);
        }

        pub fn get_thread_execution_width(self: *Self) NS.UInteger
        {
            return objc.mtl_compute_pipeline_state_get_thread_execution_width(self);
        }

        pub fn get_static_thread_group_memory_length(self: *Self) NS.UInteger
        {
            return objc.mtl_compute_pipeline_state_get_static_thread_group_memory_length(self);
        }

    };

    pub const Reflection = opaque
    {
        const Self = @This();
        pub fn new() Self
        {
            return objc.mtl_compute_pipeline_reflection_new();
        }

        pub fn get_arguments(self: *Self) *Argument
        {
            return objc.mtl_compute_pipeline_reflection_get_arguments(self);
        }
    };

    pub const Descriptor = opaque { };
};

pub const Buffer = opaque
{
    const Self = @This();

    pub fn get(self: *Self) [*]u8
    {
        return objc.mtl_buffer_get_contents(self);
    }

    pub fn length(self: *Self) NS.UInteger
    {
        return objc.mtl_buffer_get_length(self);
    }

    pub fn modify_range(self: *Self, range: NS.Range) void
    {
        objc.mtl_buffer_modify_range(self, range);
    }

    pub fn add_debug_marker_range(self: *Self, name: [*:0]u8, range: NS.Range) void
    {
        objc.mtl_add_debug_marker_range(self, name, range);
    }

    pub fn remove_all_debug_markers(self: *Self) void
    {
        objc.mtl_buffer_remove_all_debug_markers(self);
    }

    pub fn new_remote_buffer_view_for_device(self: *Self, device: *Device) ?*Self
    {
        return objc.mtl_buffer_new_view_for_device(self, device);
    }

    pub fn new_remote_storage_buffer(self: *Self) ?*Self
    {
        return objc.mtl_buffer_new_remote_storage_buffer(self);
    }
};

pub const Heap = opaque
{
    pub fn new(device: *Device, descriptor: *Heap.Descriptor) *Heap
    {
        return objc.mtl_heap_new(device, descriptor);
    }

    pub fn get_device(self: *Heap) ?*Device
    {
        return objc.mtl_heap_get_device(self);
    }

    pub fn get_label(self: *Heap) ?[*:0]u8
    {
        return objc.mtl_heap_get_label(self);
    }

    pub fn get_type(self: *Heap) Heap.Type
    {
        return objc.mtl_heap_get_type(self);
    }

    pub fn get_storage_mode(self: *Heap) StorageMode
    {
        return objc.mtl_heap_get_storage_mode(self);
    }

    pub fn get_cpu_cache_mode(self: *Heap) CPUCacheMode
    {
        return objc.mtl_heap_get_cpu_cache_mode(self);
    }

    pub fn get_hazard_tracking_mode(self: *Heap) HazardTrackingMode
    {
        return objc.mtl_heap_get_hazard_tracking_mode(self);
    }

    pub fn get_resource_options(self: *Heap) Resource.Options
    {
        return objc.mtl_heap_get_resource_options(self);
    }

    pub fn get_size(self: *Heap) NS.UInteger
    {
        return objc.mtl_heap_get_size(self);
    }

    pub fn get_used_size(self: *Heap) NS.UInteger
    {
        return objc.mtl_heap_get_used_size(self);
    }

    pub fn get_currently_allocated_size(self: *Heap) NS.UInteger
    {
        return objc.mtl_heap_get_currently_allocated_size(self);
    }

    pub fn get_max_available_size_with_alignment(self: *Heap) NS.UInteger
    {
        return objc.mtl_heap_get_max_available_size_with_alignment(self);
    }

    pub fn set_purgeable_state(self: *Heap, purgeable_state: PurgeableState) void
    {
        objc.mtl_heap_set_purgeable_state(self, purgeable_state);
    }

    pub fn new_buffer(self: *Self, length: NS.UInteger, options: Resource.Options) *Buffer
    {
        return objc.mtl_heap_new_buffer(self, length, options);
    }

    pub fn new_buffer_from_offset(self: *Heap, length: NS.UInteger, options: Resource.Options, offset: NS.UInteger) *Buffer
    {
        return objc.mtl_heap_new_buffer_from_offset(self, length, options, offset);
    }

    pub fn new_texture(self: *Heap, descriptor: *Texture.Descriptor, offset: NS.UInteger) *Texture
    {
        return objc.mtl_heap_new_texture(self, descriptor, offset);
    }

    pub const Descriptor = opaque
    {
        const Self = @This();

        pub fn new() ?*Self
        {
            return objc.mtl_heap_descriptor_new();
        }

        pub fn get_type(self: *Self) Heap.Type
        {
            return objc.mtl_heap_descriptor_get_type(self);
        }

        pub fn set_type(self: *Self, heap_type: *Heap.Type) void
        {
            objc.mtl_heap_descriptor_set_type(self, heap_type);
        }

        pub fn get_storage_mode(self: *Self) StorageMode
        {
            return objc.mtl_heap_descriptor_get_storage_mode(self);
        }

        pub fn set_storage_mode(self: *Self, storage_mode: StorageMode) void
        {
            objc.mtl_heap_descriptor_get_storage_mode(self, storage_mode);
        }

        pub fn get_CPU_cache_mode(self: *Self) CPUCacheMode
        {
            return objc.mtl_heap_descriptor_get_cpu_cache_mode(self);
        }

        pub fn set_CPU_cache_mode(self: *Self, cpu_cache_mode: CPUCacheMode) void
        {
            objc.mtl_heap_descriptor_set_cpu_cache_mode(self, cpu_cache_mode);
        }

        pub fn get_hazard_tracking_mode(self: *Self) HazardTrackingMode
        {
            return objc.mtl_heap_descriptor_get_hazard_tracking_mode(self);
        }

        pub fn set_hazard_tracking_mode(self: *Self, hazard_tracking_mode: HazardTrackingMode) void
        {
            objc.mtl_heap_descriptor_set_hazard_tracking_mode(self, hazard_tracking_mode);
        }

        pub fn get_resource_options(self: *Self) Resource.Options
        {
            return objc.mtl_heap_descriptor_get_resource_options(self);
        }

        pub fn set_resource_options(self: *Self, resource_options: Resource.Options) void
        {
            objc.mtl_heap_descriptor_set_resource_options(self, resource_options);
        }

        pub fn get_size(self: *Self) NS.UInteger
        {
            return objc.mtl_heap_descriptor_get_size(self);
        }

        pub fn set_size(self: *Self, descriptor_size: NS.UInteger) void
        {
            objc.mtl_heap_descriptor_set_size(self, descriptor_size);
        }
    };

    pub const Type = enum(u32)
    {
        automatic = 0,
        placement = 1,
    };
};

pub const Vertex = opaque
{
    pub const Format = enum(u32)
    {
        invalid = 0,
        uchar2 = 1,
        uchar3 = 2,
        uchar4 = 3,
        char2 = 4,
        char3 = 5,
        char4 = 6,
        uchar2_normalized = 7,
        uchar3_normalized = 8,
        uchar4_normalized = 9,
        char2_normalized = 10,
        char3_normalized = 11,
        char4_normalized = 12,
        ushort2 = 13,
        ushort3 = 14,
        ushort4 = 15,
        short2 = 16,
        short3 = 17,
        short4 = 18,
        ushort2_normalized = 19,
        ushort3_normalized = 20,
        ushort4_normalized = 21,
        short2_normalized = 22,
        short3_normalized = 23,
        short4_normalized = 24,
        half2 = 25,
        half3 = 26,
        half4 = 27,
        float = 28,
        float2 = 29,
        float3 = 30,
        float4 = 31,
        int = 32,
        int2 = 33,
        int3 = 34,
        int4 = 35,
        uint = 36,
        uint2 = 37,
        uint3 = 38,
        uint4 = 39,
        int1010102_normalized = 40,
        uint1010102_normalized = 41,
        uchar4_normalized_bgra = 42,
        uchar = 45,
        char = 46,
        uchar_normalized = 47,
        char_normalized = 48,
        ushort = 49,
        short = 50,
        ushort_normalized = 51,
        short_normalized = 52,
        half = 53,
    };

    pub const StepFunction = enum(u32)
    {
        constant = 0,
        per_vertex = 1,
        per_instance = 2,
        per_patch = 3,
        per_patch_control_point = 4,
        thread_position_in_grid_x = 5,
        thread_position_in_grid_y = 6,
        thread_position_in_grid_x_indexed = 5,
        thread_position_in_grid_y_indexed = 6,
    };

    pub const Descriptor = opaque
    {
        const Self = @This();

        pub fn new() ?*Self
        {
            return objc.mtl_vertex_descriptor_new();
        }

        pub fn set_attribute(self: *Self, index: u32, format: Vertex.Format, offset: u32, buffer_index: u32) void
        {
            objc.mtl_vertex_descriptor_set_attribute(self, index, format, offset, buffer_index);
        }

        pub fn set_layout(self: *Self, index: u32, stride: u32, step_rate: u32, step_function: Vertex.StepFunction) void
        {
            objc.mtl_vertex_descriptor_set_layout(self, index, stride, step_rate, step_function);
        }
    };
};

pub const RenderPipeline = opaque
{
    const Self = @This();
    pub fn set_vertex_descriptor(self: *Self, vertex_descriptor: *Vertex.Descriptor) void
    {
        objc.mtl_render_pipeline_set_vertex_descriptor(self, vertex_descriptor);
    }
};

pub const Argument = opaque
{
    pub fn get_name(self: *Argument) ?[*:0]u8
    {
        return objc.mtl_argument_get_name(self);
    }

    pub fn is_active(self: *Argument) bool
    {
        return objc.mtl_argument_is_active(self);
    }

    pub fn get_index(self: *Argument) NS.UInteger
    {
        return objc.mtl_argument_get_index(self);
    }

    pub fn get_type(self: *Argument) Argument.Type
    {
        return objc.mtl_argument_get_type(self);
    }

    pub fn get_access(self: *Argument) Argument.Access
    {
        return objc.mtl_argument_get_access(self);
    }

    pub fn get_buffer_alignment(self: *Argument) NS.UInteger
    {
        return objc.mtl_argument_get_buffer_alignment(self);
    }

    pub fn get_buffer_data_size(self: *Argument) NS.UInteger
    {
        return objc.mtl_argument_get_buffer_data_size(self);
    }

    pub fn get_buffer_data_type(self: *Argument) DataType
    {
        return objc.mtl_argument_get_buffer_data_type(self);
    }

    pub fn get_buffer_struct_type(self: *Argument) StructType
    {
        return objc.mtl_argument_get_buffer_struct_type(self);
    }

    pub fn get_buffer_pointer_type(self: *Argument) PointerType
    {
        return objc.mtl_argument_get_buffer_pointer_type(self);
    }

    pub fn get_array_length(self: *Argument) NS.UInteger
    {
        return objc.mtl_argument_get_array_length(self);
    }

    pub fn get_thread_group_memory_alignment(self: *Argument) NS.UInteger
    {
        return objc.mtl_argument_get_thread_group_memory_alignment(self);
    }

    pub fn get_thread_group_memory_data_size(self: *Argument) NS.UInteger
    {
        return objc.mtl_argument_get_thread_group_memory_data_size(self);
    }

    pub const Descriptor = opaque
    {
        const Self = @This();

        pub fn new() ?*Self
        {
            return objc.mtl_argument_descriptor_new();
        }

        pub fn get_data_type(self: *Self) DataType
        {
            return objc.mtl_argument_descriptor_get_data_type(self);
        }

        pub fn set_data_type(self: *Self, data_type: DataType) void
        {
            objc.mtl_argument_descriptor_set_data_type(self, data_type);
        }

        pub fn get_index(self: *Self) NS.UInteger
        {
            return objc.mtl_argument_descriptor_get_index(self);
        }

        pub fn set_index(self: *Self, index: NS.UInteger) void
        {
            objc.mtl_argument_descriptor_set_index(self, index);
        }

        pub fn get_access(self: *Self) Argument.Access
        {
            return objc.mtl_argument_descriptor_get_access(self);
        }

        pub fn set_access(self: *Self, access: Argument.Access) void
        {
            objc.mtl_argument_descriptor_set_access(self, access);
        }

        pub fn get_array_length(self: *Self) NS.UInteger
        {
            return objc.mtl_argument_descriptor_get_array_length(self);
        }

        pub fn set_array_length(self: *Self, array_length: NS.UInteger) void
        {
            objc.mtl_argument_descriptor_set_array_length(self, array_length);
        }

        pub fn get_constant_block_alignment(self: *Self) NS.UInteger
        {
            return objc.mtl_argument_descriptor_get_constant_block_alignment(self);
        }

        pub fn set_constant_block_alignment(self: *Self, constant_block_alignment: NS.UInteger) void
        {
            objc.mtl_argument_descriptor_set_constant_block_alignment(self, constant_block_alignment);
        }

        pub fn get_texture_type(self: *Self) TextureType
        {
            return objc.mtl_argument_descriptor_get_texture_type(self);
        }

        pub fn set_texture_type(self: *Self, texture_type: TextureType) void
        {
            objc.mtl_argument_descriptor_get_texture_type(self, texture_type);
        }
    };

    pub const Encoder = opaque
    {
        const Self = @This();

        pub fn new(function: *Function, buffer_index: NS.UInteger) ?*Self
        {
            return objc.mtl_argument_encoder_new(function, buffer_index);
        }

        pub fn new_from_reflection(function: *Function, buffer_index: NS.UInteger, reflection: *AutoreleasedArgument) ?*Self
        {
            return objc.mtl_argument_encoder_new_from_reflection(function, buffer_index, reflection);
        }

        pub fn new_from_argument_buffer(self: *Self, buffer_index: NS.UInteger) ?*Self
        {
            return objc.mtl_argument_encoder_new_from_argument_buffer(self, buffer_index);
        }

        pub fn new_from_arguments(device: *Device, arguments: []const Argument.Descriptor) ?*Self
        {
            return objc.mtl_argument_encoder_new_from_arguments(device, arguments.ptr, arguments.len);
        }

        pub fn get_length(self: *Self) NS.UInteger
        {
            return objc.mtl_argument_encoder_get_length(self);
        }

        pub fn set_buffer_with_offset(self: *Self, buffer: *Buffer, offset: NS.UInteger) void
        {
            objc.mtl_argument_descriptor_set_buffer_with_offset(self, buffer, offset);
        }

        pub fn set_buffer_with_offset_for_element(self: *Self, buffer: *Buffer, start_offset: NS.UInteger, array_element: NS.UInteger) void
        {
            objc.mtl_argument_descriptor_set_buffer_with_offset(self, buffer, start_offset, array_element);
        }

        pub fn set_buffers_offsets_with_range(self: *Self, buffers: [*]*Buffer, offsets: [*]NS.UInteger, range: NS.Range) void
        {
            objc.mtl_argument_descriptor_set_buffers_offsets_with_range(self, buffers, offsets, range);
        }

        pub fn set_texture_at_index(self: *Self, texture: *Texture, index: NS.UInteger) void
        {
            objc.mtl_argument_descriptor_set_texture_at_index(self, texture, index);
        }

        pub fn set_textures_with_range(self: *Self, textures: [*]Texture, range: NS.Range) void
        {
            objc.mtl_argument_descriptor_set_textures_with_range(self, textures, range);
        }

        pub fn set_sampler_state_at_index(self: *Self, sampler_state: *SamplerState, index: NS.UInteger) void
        {
            objc.mtl_argument_descriptor_set_sampler_state_at_index(self, sampler_state, index);
        }

        pub fn set_sampler_states_with_range(self: *Self, sampler_states: [*]SamplerState, range: NS.Range) void
        {
            objc.mtl_argument_descriptor_set_sampler_states_with_range(self, sampler_states, range);
        }

        pub fn get_constant_data_at_index(self: *Self, index: NS.UInteger) ?[*]u8
        {
            return objc.mtl_argument_descriptor_get_constant_data_at_index(self, index);
        }

        pub fn set_indirect_command_buffer_at_index(self: *Self, indirect_command_buffer: *IndirectCommandBuffer, index: NS.UInteger) void
        {
            objc.mtl_argument_descriptor_set_indirect_command_buffer_at_index(self, indirect_command_buffer, index);
        }

        pub fn set_indirect_command_buffers_with_range(self: *Self, indirect_command_buffers: [*]IndirectCommandBuffer, range: NS.Range) void
        {
            objc.mtl_argument_descriptor_set_indirect_command_buffers_with_range(self, indirect_command_buffers, range);
        }

        pub fn get_alignment(self: *Self) NS.UInteger
        {
            return objc.mtl_argument_descriptor_get_alignment(self);
        }
    };

    pub const Access = enum(u32)
    {
        read_only = 0,
        read_write = 1,
        write_only = 2,
    };

    pub const BuffersTier = enum(u32)
    {
        tier1 = 0,
        tier2 = 1,
    };

    pub const Type = enum(u32)
    {
        buffer = 0,
        thread_group_memory = 1,
        texture = 2,
        sampler = 3,
    };
};

pub const PointerType = opaque
{
    const Self = @This();

    pub fn get_element_type(self: *Self) DataType
    {
        return objc.mtl_pointer_type_get_element_type(self);
    }

    pub fn get_access(self: *Self) Argument.Access
    {
        return objc.mtl_pointer_type_get_access(self);
    }

    pub fn get_alignment(self: *Self) NS.UInteger
    {
        return objc.mtl_pointer_type_get_alignment(self);
    }

    pub fn get_data_size(self: *Self) NS.UInteger
    {
        return objc.mtl_pointer_type_get_data_size(self);
    }

    pub fn is_element_argument_buffer(self: *Self) bool
    {
        return objc.mtl_pointer_type_is_element_argument_buffer(self);
    }

    pub fn get_element_struct_type(self: *Self) *StructType
    {
        return objc.mtl_pointer_type_get_element_struct_type(self);
    }

    pub fn get_element_array_type(self: *Self) *ArrayType
    {
        return objc.mtl_pointer_type_get_element_array_type(self);
    }
};

pub const CompareFunction = enum(u32)
{
    never = 0,
    less = 1,
    equal = 2,
    less_equal = 3,
    greater = 4,
    not_equal = 5,
    greater_equal = 6,
    always = 7,
};

pub const StencilOperation = enum(u32)
{
    keep = 0,
    zero = 1,
    replace = 2,
    increment_clamp = 3,
    decrement_clamp = 4,
    invert = 5,
    increment_wrap = 6,
    decrement_wrap = 7,
};

pub const DepthStencil = opaque
{
    pub const State = opaque
    {
        const Self = @This();

        pub fn new(device: *Device, descriptor: *DepthStencil.Descriptor) ?*Self
        {
            return objc.mtl_depth_stencil_state_new(device, descriptor);
        }
    };

    pub const Descriptor = opaque
    {
        const Self = @This();

        pub fn new(compare_function: CompareFunction, depth_write_enabled: bool) ?*Self
        {
            return objc.mtl_depth_stencil_descriptor_new(compare_function, depth_write_enabled);
        }
    };
};


pub const Render = opaque
{
    pub const Pipeline = opaque
    {
        const Self = @This();

        pub fn new(device: *Device, descriptor: *Render.Descriptor, err: *NS.Error) ?*Self
        {
            return objc.mtl_render_pipeline_new(device, descriptor, err);
        }
    };

    pub const Descriptor = opaque
    {
        const Self = @This();

        pub fn new(pixel_format: PixelFormat) ?*Self
        {
            return objc.mtl_render_descriptor_new(pixel_format);
        }

        pub fn set_function(self: *Self, function: *Function, function_type: Function.Type) void
        {
            objc.mtl_render_descriptor_set_function(self, function, function_type);
        }

        pub fn set_color_pixel_format(self: *Self, index: u32, pixel_format: PixelFormat) void
        {
            objc.mtl_render_descriptor_set_color_pixel_format(self, index, pixel_format);
        }

        pub fn set_depth_pixel_format(self: *Self, pixel_format: PixelFormat) void
        {
            objc.mtl_render_descriptor_set_depth_pixel_format(self, pixel_format);
        }

        pub fn set_stencil_pixel_format(self: *Self, pixel_format: PixelFormat) void
        {
            objc.mtl_render_descriptor_set_stencil_pixel_format(self, pixel_format);
        }

        pub fn set_sample_count(self: *Self, sample_count: u32) void
        {
            objc.mtl_render_descriptor_set_sample_count(self, sample_count);
        }
    };

    pub const PassDescriptor = opaque
    {
        const Self = @This();
        pub fn new() ?*Self
        {
            return objc.mtl_render_pass_descriptor_new();
        }

        pub fn pass_texture(self: *Self, color_attachment: i32, texture: *Texture) void
        {
            objc.mtl_render_pass_descriptor_pass_texture(self, color_attachment, texture);
        }

        pub fn pass_load_action(self: *Self, color_attachment: i32, load_action: LoadAction) void
        {
            objc.mtl_render_pass_descriptor_pass_load_action(self, color_attachment, load_action);
        }
    };
};

pub const CommandBuffer = opaque
{
    const Self = @This();

    pub const OnCompleteFn = fn([*]u8, *Self) void;
    pub const HandlerFn = fn(*Self) void;

    pub fn new_from_command_queue(command_queue: *CommandQueue) ?*Self
    {
        return objc.mtl_command_buffer_new(command_queue);
    }

    pub fn new_from_unretained_references(command_queue: *CommandQueue) ?*Self
    {
        return objc.mtl_command_buffer_new_from_unretained_references(command_queue);
    }

    pub fn on_complete(command_queue: *CommandQueue, sender: [*]u8, on_complete_fn: OnCompleteFn) void
    {
        objc.mtl_command_buffer_on_complete(command_queue, sender, on_complete_fn);
    }

    pub fn present_drawable(self: *CommandBuffer, drawable: *Drawable) void
    {
        objc.mtl_command_buffer_present_drawable(self, drawable);
    }

    pub fn enqueue(self: *Self) void
    {
        objc.mtl_command_buffer_enqueue(self);
    }

    pub fn commit(self: *Self) void
    {
        objc.mtl_command_buffer_commit(self);
    }

    pub fn add_scheduled_handler(self: *Self, handler: HandlerFn) void
    {
        objc.mtl_command_buffer_add_scheduled_handler(self, handler);
    }

    pub fn add_completed_handler(self: *Self, handler: HandlerFn) void
    {
        objc.mtl_command_buffer_add_completed_handler(self, handler);
    }

    pub fn wait_until_scheduled(self: *Self) void
    {
        objc.mtl_command_buffer_wait_until_scheduled(self);
    }

    pub fn wait_until_completed(self: *Self) void
    {
        objc.mtl_command_buffer_wait_until_completed(self);
    }

    pub fn get_status(self: *Self) CommandBuffer.Status
    {
        return objc.mtl_command_buffer_get_status(self);
    }

    pub fn get_error(self: *Self) CommandBuffer.Error
    {
        return objc.mtl_command_buffer_get_error(self);
    }

    pub fn get_kernel_start_time(self: *Self) f64
    {
        return objc.mtl_command_buffer_get_kernel_start_time(self);
    }

    pub fn get_kernel_end_time(self: *Self) f64
    {
        return objc.mtl_command_buffer_get_kernel_end_time(self);
    }

    pub fn get_gpu_start_time(self: *Self) f64
    {
        return objc.mtl_command_buffer_get_gpu_start_time(self);
    }

    pub fn get_gpu_end_time(self: *Self) f64
    {
        return objc.mtl_command_buffer_get_gpu_end_time(self);
    }

    pub fn encode_signal_event(self: *Self, event: *Event, value: u64) void
    {
        objc.mtl_command_buffer_encode_signal_event(self, event, value);
    }

    pub fn encode_wait_for_event(self: *Self, event: *Event, value: u64) void
    {
        objc.mtl_command_buffer_encode_wait_for_event(self, event, value);
    }

    pub fn has_retained_references(self: *Self) bool
    {
        return objc.mtl_command_buffer_has_retained_references(self);
    }

    pub fn get_device(self: *Self) ?*Device
    {
        return objc.mtl_command_buffer_get_device(self);
    }

    pub fn get_command_queue(self: *Self) ?*CommandQueue
    {
        return objc.mtl_command_buffer_get_command_queue(self);
    }

    pub fn get_label(self: *Self) ?[*:0]u8
    {
        return objc.mtl_command_buffer_get_label(self);
    }

    pub fn push_debug_group(self: *Self, name: []const u8) void
    {
        objc.mtl_command_buffer_push_debug_group(self, name);
    }

    pub fn pop_debug_group(self: *Self) void
    {
        objc.mtl_command_buffer_pop_debug_group(self);
    }

    pub const Status = enum(u32)
    {
        not_enqueued = 0,
        enqueued = 1,
        committed = 2,
        scheduled = 3,
        completed = 4,
        @"error" = 5,
    };

    pub const Error = enum(u32)
    {
        none = 0,
        internal = 1,
        timeout = 2,
        page_fault = 3,
        blacklisted = 4,
        not_permitted = 7,
        out_of_memory = 8,
        invalid_resource = 9,
        memoryless = 10,
        device_removed = 11,
    };
};

pub const IndirectCommandBuffer = opaque
{
    const Self = @This();

    pub fn new(device: *Device, indirect_command_buffer_descriptor: *IndirectCommandBuffer.Descriptor, max_count: NS.UInteger, options: Resource.Options) ?*IndirectCommandBuffer
    {
        return objc.mtl_indirect_command_buffer_new(device, indirect_command_buffer_descriptor, max_count, options);
    }

    pub fn get_size(self: *Self) NS.UInteger
    {
        return objc.mtl_indirect_command_buffer_get_size(self);
    }

    pub fn get_compute_command_at_index(self: *Self, index: NS.UInteger) ?*IndirectComputeCommand
    {
        return objc.mtl_indirect_command_buffer_get_compute_command_at_index(self, index);
    }

    pub fn get_render_command_at_index(self: *Self, index: NS.UInteger) ?*IndirectRenderCommand
    {
        return objc.mtl_indirect_command_buffer_get_render_command_at_index(self, index);
    }

    pub fn reset_with_range(self: *Self, range: NS.Range) void
    {
        objc.mtl_indirect_command_buffer_reset_with_range(self, range);
    }

    pub const Descriptor = opaque
    {
    };
};

pub const CommandEncoder = opaque
{
    const Self = @This();

    pub fn end(self: *Self) void
    {
        objc.mtl_command_encoder_end(self);
    }

    pub fn get_device(self: *Self) ?*Device
    {
        return objc.mtl_command_encoder_get_device(self);
    }

    pub fn get_label(self: *Self) ?[*:0]u8
    {
        return objc.mtl_command_encoder_get_label(self);
    }

    pub fn insert_debug_sign_post(self: *Self, name: [:0]const u8) void
    {
        objc.mtl_command_encoder_insert_debug_sign_post(self, name.ptr);
    }

    pub fn push_debug_group(self: *Self, name: [:0]const u8) void
    {
        objc.mtl_command_encoder_push_debug_group(self, name.ptr);
    }

    pub fn pop_debug_group(self: *Self) void
    {
        objc.mtl_command_encoder_pop_debug_group(self);
    }
};

pub const BlitCommandEncoder = opaque
{
    const Self = @This();
    
    pub fn new(command_buffer: *CommandBuffer) ?*Self
    {
        return objc.mtl_blit_command_encoder_new(command_buffer);
    }

    pub fn copy_from_buffer_to_buffer(self: *Self, dst_buffer: *Buffer, dst_offset: NS.UInteger, src_buffer: *Buffer, src_offset: NS.UInteger, size: NS.UInteger) void
    {
        objc.mtl_blit_command_encoder_copy_from_buffer_to_buffer(self, dst_buffer, dst_offset, src_buffer, src_offset, size);
    }

    pub fn fill_buffer(self: *Self, src_buffer: *Buffer, range: NS.Range, value: u8) void
    {
        objc.mtl_blit_command_encoder_fill_buffer(self, src_buffer, range, value);
    }

    pub fn generate_mipmaps(self: *Self, texture: *Texture) void
    {
        objc.mtl_blit_command_encoder_generate_mipmaps(self, texture);
    }

    pub fn copy_indirect_command_buffer(self: *Self, dst_command_buffer: *IndirectCommandBuffer, dst_index: NS.UInteger, range: NS.Range, src_command_buffer: *IndirectCommandBuffer) void
    {
        objc.mtl_blit_command_encoder_copy_indirect_command_buffer(self, dst_command_buffer, dst_index, range, src_command_buffer);
    }

    pub fn optimize_indirect_command_buffer(self: *Self, indirect_command_buffer: *IndirectCommandBuffer, range: NS.Range) void
    {
        objc.mtl_blit_command_encoder_optimize_indirect_command_buffer(self, indirect_command_buffer, range);
    }

    pub fn reset_commands_in_buffer(self: *Self, indirect_command_buffer: *IndirectCommandBuffer, range: NS.Range) void
    {
        objc.mtl_blit_command_encoder_optimize_indirect_command_buffer(self, indirect_command_buffer, range);
    }

    pub fn synchronize_resource(self: *Self, resource: *Resource) void
    {
        objc.mtl_blit_command_encoder_synchronize_resource(self, resource);
    }

    pub fn synchronize_texture(self: *Self, texture: *Texture, slice: NS.UInteger, level: NS.UInteger) void
    {
        objc.mtl_blit_command_encoder_synchronize_texture(self, texture, slice, level);
    }

    pub fn update_fence(self: *Self, fence: *Fence) void
    {
        objc.mtl_blit_command_encoder_update_fence(self, fence);
    }

    pub fn wait_for_fence(self: *Self, fence: *Fence) void
    {
        objc.mtl_blit_command_encoder_wait_for_fence(self, fence);
    }

    pub fn optimize_contents_for_CPU_access(self: *Self, texture: *Texture) void
    {
        objc.mtl_blit_command_encoder_optimize_contents_for_CPU_access(self, texture);
    }

    pub fn optimize_contents_for_GPU_access(self: *Self, texture: *Texture) void
    {
        objc.mtl_blit_command_encoder_optimize_contents_for_GPU_access(self, texture);
    }

    pub fn optimize_contents_for_CPU_access_slice_level(self: *Self, texture: *Texture, slice: NS.UInteger, level: NS.UInteger) void
    {
        objc.mtl_blit_command_encoder_optimize_contents_for_CPU_access_slice_level(self, texture, slice, level);
    }

    pub fn optimize_contents_for_GPU_access_slice_level(self: *Self, texture: *Texture, slice: NS.UInteger, level: NS.UInteger) void
    {
        objc.mtl_blit_command_encoder_optimize_contents_for_GPU_access_slice_level(self, texture, slice, level);
    }

    pub fn sample_counters_in_buffer(self: *Self, counter_sampler_buffer: *CounterSamplerBuffer, sample_index: NS.UInteger, barrier: bool) void
    {
        objc.mtl_blit_command_encoder_sample_counters_in_buffer(self, counter_sampler_buffer, sample_index, barrier);
    }

    pub fn resolve_counters(self: *Self, counter_sampler_buffer: *CounterSamplerBuffer, range: NS.Range, buffer: *Buffer, dst_offset: NS.UInteger) void
    {
        objc.mtl_blit_command_encoder_resolve_counters(self, counter_sampler_buffer, range, buffer, dst_offset);
    }
};

pub const ComputeCommandEncoder = opaque
{
    const Self = @This();
    pub fn new(command_buffer: *CommandBuffer) ?*Self
    {
        objc.mtl_compute_command_encoder_new(command_buffer);
    }

    pub fn new_from_dispatch_type(command_buffer: *CommandBuffer, dispatch_type: DispatchType) ?*Self
    {
        objc.mtl_compute_command_encoder_new_from_dispatch_type(command_buffer, dispatch_type);
    }

    pub fn end_encoding(self: *Self) void
    {
        objc.mtl_compute_command_encoder_end_encoding(self);
    }

    pub fn set_pipeline_state(self: *Self, pipeline_state: *ComputePipelineState) void
    {
        objc.mtl_compute_command_encoder_set_pipeline_state(self, pipeline_state);
    }

    pub fn set_buffer_offset_at_index(self: *Self, buffer: *Buffer, offset: NS.UInteger, index: NS.UInteger) void
    {
        objc.mtl_compute_command_encoder_set_buffer_offset_at_index(self, buffer, offset, index);
    }

    pub fn set_bytes_at_index(self: *Self, bytes: []const u8, index: NS.UInteger) void
    {
        objc.mtl_compute_command_encoder_set_bytes_at_index(self, bytes.ptr, bytes.len, index);
    }

    pub fn set_sampler_state_at_index(self: *Self, sampler_state: *SamplerState, index: NS.UInteger) void
    {
        objc.mtl_compute_command_encoder_set_sampler_state_at_index(self, sampler_state, index);
    }

    pub fn set_sampler_states_with_range(self: *Self, sampler_states: [*]*SamplerState, range: NS.Range) void
    {
        objc.mtl_compute_command_encoder_set_sampler_states_with_range(self, sampler_states, range);
    }

    pub fn set_sampler_state_LOD_min_clamp_LOD_max_clamp_at_index(self: *Self, sampler_state: *SamplerState, LOD_min_clamp: f32, LOD_max_clamp: f32, index: NS.UInteger) void
    {
        objc.mtl_compute_command_encoder_set_sampler_state_LOD_min_clamp_LOD_max_clamp_at_index(self, sampler_state, LOD_min_clamp, LOD_max_clamp, index);
    }

    pub fn set_texture_at_index(self: *Self, texture: *Texture, index: NS.UInteger) void
    {
        objc.mtl_compute_command_encoder_set_texture_at_index(self, texture, index);
    }

    pub fn set_textures_with_range(self: *Self, textures: [*]*Texture, range: NS.Range) void
    {
        objc.mtl_compute_command_encoder_set_textures_with_range(self, textures, range);
    }

    pub fn set_thread_group_memory_length_at_index(self: *Self, length: NS.UInteger, index: NS.UInteger) void
    {
        objc.mtl_compute_command_encoder_set_thread_group_memory_length_at_index(self, length, index);
    }

    pub fn dispatch_thread_groups_thread_per_thread_group(self: *Self, thread_groups_per_grid: Size, threads_per_thread_group: Size) void
    {
        objc.mtl_compute_command_encoder_dispatch_thread_groups_thread_per_thread_group(self, thread_groups_per_grid, threads_per_thread_group);
    }

    pub fn dispatch_thread_thread_threads_per_thread_group(self: *Self, thread_groups_per_grid: Size, threads_per_thread_group: Size) void
    {
        objc.mtl_compute_command_encoder_dispatch_thread_thread_threads_per_thread_group(self, thread_groups_per_grid, threads_per_thread_group);
    }

    pub fn dispatch_thread_groups_with_indirect_buffer(self: *Self, indirect_buffer: *Buffer, buffer_offset: NS.UInteger, threads_per_thread_group: Size) void
    {
        objc.mtl_compute_command_encoder_dispatch_thread_groups_with_indirect_buffer(self, indirect_buffer, buffer_offset, threads_per_thread_group);
    }

    pub fn use_resource_usage(self: *Self, resource: *Resource, resource_usage: Resource.Usage) void
    {
        objc.mtl_compute_command_encoder_use_resource_usage(self, resource, resource_usage);
    }

    pub fn use_resources_usage(self: *Self, resources: []*Resource, resource_usage: Resource.Usage) void
    {
        objc.mtl_compute_command_encoder_use_resources_usage(self, resources.ptr, resources.len, resource_usage);
    }

    pub fn use_heap(self: *Self, heap: *Heap) void
    {
        objc.mtl_compute_command_encoder_use_heap(self, heap);
    }

    pub fn use_heaps(self: *Self, heaps: []*Heap) void
    {
        objc.mtl_compute_command_encoder_use_heaps(self, heaps.ptr, heaps.len);
    }

    pub fn set_stage_in_region(self: *Self, region: Region) void
    {
        objc.mtl_compute_command_encoder_set_stage_in_region(self, region);
    }

    pub fn set_stage_in_region_with_indirect_buffer(self: *Self, buffer: *Buffer, buffer_offset: NS.UInteger) void
    {
        objc.mtl_compute_command_encoder_set_stage_in_region_with_indirect_buffer(self, buffer, buffer_offset);
    }

    pub fn get_dispatch_type(self: *Self) DispatchType
    {
        objc.mtl_compute_command_encoder_get_dispatch_type(self);
    }

    pub fn set_barrier_with_scope(self: *Self, barrier_scope: BarrierScope) void
    {
        objc.mtl_compute_command_encoder_set_barrier_with_scope(self, barrier_scope);
    }

    pub fn set_barrier_with_resources(self: *Self, resources: []*Resource) void
    {
        objc.mtl_compute_command_encoder_set_barrier_with_resources(self, resources.ptr, resources.len);
    }

    pub fn execute_command_in_buffer(self: *Self, resources: []*Resource) void
    {
        objc.mtl_compute_command_encoder_execute_command_in_buffer(self, resources.ptr, resources.len);
    }
};

pub const RenderCommandEncoder = opaque
{
    const Self = @This();

    pub fn new(command_buffer: *CommandBuffer, render_pass_descriptor: *Render.PassDescriptor) ?*Self
    {
        return objc.mtl_render_command_encoder_new(command_buffer, render_pass_descriptor);
    }

    pub fn set_front_face(self: *Self, winding: Winding) void
    {
        objc.mtl_render_command_encoder_set_front_face(self, winding);
    }
    
    pub fn set_cull_mode(self: *Self, cull_mode: CullMode) void
    {
        objc.mtl_render_command_encoder_set_cull_mode(self, cull_mode);
    }

    pub fn set_viewport(self: *Self, viewport: *Viewport) void
    {
        objc.mtl_render_command_encoder_set_viewport(self, viewport);
    }

    pub fn set_render_pipeline(self: *Self, render_pipeline: *RenderPipeline) void
    {
        objc.mtl_render_command_encoder_set_pipeline(self, render_pipeline);
    }

    pub fn set_depth_stencil(self: *Self, depth_stencil_state: *DepthStencil.State) void
    {
        objc.mtl_render_command_encoder_set_depth_stencil_state(self, depth_stencil_state);
    }

    pub fn set_vertex_bytes_at_index(self: *Self, bytes: []const u8, index: u32) void
    {
        objc.mtl_render_command_set_vertex_bytes_at_index(self, bytes.ptr, bytes.len, index);
    }

    pub fn set_vertex_buffer(self: *Self, buffer: *Buffer, buffer_offset: NS.UInteger, index: u32) void
    {
        objc.mtl_render_command_encoder_set_vertex_buffer(self, buffer, buffer_offset, index);
    }

    pub fn set_fragment_buffer(self: *Self, buffer: *Buffer, buffer_offset: NS.UInteger, index: u32) void
    {
        objc.mtl_render_command_encoder_set_fragment_buffer(self, buffer, buffer_offset, index);
    }

    pub fn draw_primitives(self: *Self, primitive_type: PrimitiveType, primitive_start: Size, primitive_count: Size) void
    {
        objc.mtl_render_command_encoder_draw_primitives(self, primitive_type, primitive_start, primitive_count);
    }

    pub fn draw_indexed_primitives(self: *Self, primitive_type: PrimitiveType, index_count: u32, index_type: IndexType, index_buffer: *Buffer, index_buffer_offset: u32) void
    {
        objc.mtl_render_command_encoder_draw_indexed_primitives(self, primitive_type, index_count, index_type, index_buffer, index_buffer_offset);
    }

    pub fn set_texture_at_index(self: *Self, texture: *Texture, index: NS.UInteger) void
    {
        objc.mtl_render_command_encoder_set_texture_at_index(self, texture, index);
    }
};

pub const CommandQueue = opaque
{
    const Self = @This();

    pub fn new(device: *Device) ?*Self
    {
        return objc.mtl_command_queue_new(device);
    }

    pub fn new_with_command_buffer_count(device: *Device, command_buffer_count: NS.UInteger) ?*Self
    {
        return objc.mtl_command_queue_new_with_command_buffer_count(device, command_buffer_count);
    }
};

comptime
{
    std.testing.refAllDecls(@This());
}
