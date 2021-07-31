#if __has_feature(objc_arc) && !__has_feature(objc_arc_fields)
#error "Metal requires __has_feature(objc_arc_field) if ARC is enabled (use a more recent compiler version)"
#endif

#define MT_EXPORT __attribute__((visibility("default")))
#define MT_HIDE   __attribute__((visibility("hidden")))
#define MT_INLINE   inline __attribute__((always_inline))
#define MT_ALIGN(_size_)   __attribute__((aligned(_size_)))

#ifdef __APPLE__
    #include <os/availability.h>
    #define mt_macCatalyst  macCatalyst
    #define mt_ios          ios
    #define mt_macos        macos
    #define MT_API_AVAILABLE(...) API_AVAILABLE(__VA_ARGS__)
    #define MT_API_UNAVAILABLE(_api_) API_UNAVAILABLE(_api_)
#else
    #pragma error "Not an Apple device"
#endif

#if INTPTR_MAX == INT64_MAX
typedef unsigned long NsUInteger;
typedef long NSInteger;
#elif INTPTR_MAX == INT32_MAX
typedef unsigned int NsUInteger;
typedef int NsInteger;
#else
#pragma error "not a suitable platform"
#endif

typedef double CfTimeInterval;

#include <stdint.h>

typedef struct NsRange
{
    NsUInteger location;
    NsUInteger length;
} NsRange;

typedef void NsError_s;
typedef NsError_s* NsError;

typedef struct
{
    char** keys;
    char** values;
} NsDictionaryStringString;

typedef struct
{
    NsUInteger width, height, depth;
} MtSize;

typedef struct
{
    NsUInteger x, y, z;
} MtOrigin;

typedef struct
{
    NsUInteger size, align;
} MtSizeAndAlign;

typedef void MtDevice;
typedef void MtRenderDesc;
typedef void MtRenderPipeline;
typedef void MtCommandQueue;
typedef void MtCommandEncoder;
typedef void MtBlitCommandEncoder;
typedef void MtLibrary;
typedef void MtRenderPassDesc;
typedef void MtTexture;
typedef void MtCommandBuffer;
typedef void MtDrawable;
typedef void MtVertexDescriptor;
typedef void MtTextureDescriptor;
typedef void MtIndirectCommandBufferDescriptor;
typedef void MtIndirectCommandBuffer;
typedef void MtIndirectComputeCommand;
typedef void MtIndirectRenderCommand;
typedef void MtDepthStencilDescriptor;
typedef void MtDepthStencilState;
typedef void MtBuffer;
typedef void MtCompileOptions;

typedef void MtFunction;
typedef void MtFunctionConstant;
typedef void MtFunctionConstantValues;

typedef void MtEvent;
typedef void MtSharedEvent;
typedef void MtSharedEventHandle;
typedef void MtFence;
typedef void (^MtSharedEventNotificationBlock)(MtSharedEvent *ev, uint64_t value);
typedef void (*MtCommandBufferHandlerFun)(MtCommandBuffer * buf);
typedef void MtSharedEventListener;

typedef void MtResource;
typedef void MtHeap;
typedef void MtHeapDescriptor;

typedef void MtAttribute;
typedef void MtVertexAttribute;

typedef void MtComputePipelineState;
typedef void MtSamplerState;

typedef void MtRenderCommandEncoder;
typedef void MtComputeCommandEncoder;
typedef void MtBlitCommandEncoder;
typedef void MtResourceStateCommandEncoder;

typedef void MtCounterSampleBuffer;

typedef void MtArgumentEncoder;
typedef void MtAutoreleasedArgument;
typedef void MtArgument;
typedef void MtArgumentDescriptor;

typedef void MtComputePipelineDescriptor;
typedef void MtPointerType;
typedef void MtArrayType;
typedef void MtStructType;

typedef void MtComputePipelineReflection_s;
typedef void MtRenderPipelineReflection_s;
typedef MtComputePipelineReflection_s* MtComputePipelineReflection;
typedef MtRenderPipelineReflection_s* MtRenderPipelineReflection;

typedef enum MtPrimitiveType {
  MtPrimitiveTypePoint         = 0,
  MtPrimitiveTypeLine          = 1,
  MtPrimitiveTypeLineStrip     = 2,
  MtPrimitiveTypeTriangle      = 3,
  MtPrimitiveTypeTriangleStrip = 4
} MtPrimitiveType;

typedef enum MtVisibilityResultMode {
  MtVisibilityResultModeDisabled = 0,
  MtVisibilityResultModeBoolean  = 1,
  MtVisibilityResultModeCounting = 2
} MtVisibilityResultMode;

typedef struct MtScissorRect {
  uint32_t x, y, width, height;
} MtScissorRect;

typedef struct MtViewport {
  double originX, originY, width, height, znear, zfar;
} MtViewport;

typedef enum MtCullMode {
  MtCullModeNone  = 0,
  MtCullModeFront = 1,
  MtCullModeBack  = 2
} MtCullMode;

typedef enum MtWinding {
  MtWindingClockwise        = 0,
  MtWindingCounterClockwise = 1
} MtWinding;

typedef enum MtDepthClipMode {
  MtDepthClipModeClip  = 0,
  MtDepthClipModeClamp = 1
} MtDepthClipMode;

typedef enum MtTriangleFillMode {
  MtTriangleFillModeFill  = 0,
  MtTriangleFillModeLines = 1
} MtTriangleFillMode;

typedef struct MtDrawPrimitivesIndirectArguments {
    uint32_t vertexCount;
    uint32_t instanceCount;
    uint32_t vertexStart;
    uint32_t baseInstance;
} MtDrawPrimitivesIndirectArguments;

typedef struct MtDrawIndexedPrimitivesIndirectArguments {
    uint32_t indexCount;
    uint32_t instanceCount;
    uint32_t indexStart;
    int32_t  baseVertex;
    uint32_t baseInstance;
} MtDrawIndexedPrimitivesIndirectArguments;

typedef struct MtDrawPatchIndirectArguments {
    uint32_t patchCount;
    uint32_t instanceCount;
    uint32_t patchStart;
    uint32_t baseInstance;
} MtDrawPatchIndirectArguments;

typedef struct MtQuadTessellationFactorsHalf {
    uint16_t edgeTessellationFactor[4];
    uint16_t insideTessellationFactor[2];
} MtQuadTessellationFactorsHalf;

typedef struct MtTriangleTessellationFactorsHalf {
  uint16_t edgeTessellationFactor[3];
  uint16_t insideTessellationFactor;
} MtTriangleTessellationFactorsHalf;

typedef enum MtRenderStages {
  MtRenderStageVertex   = (1UL << 0),
  MtRenderStageFragment = (1UL << 1)
} MtRenderStages;

typedef enum MtLoadAction {
  MtLoadActionDontCare = 0,
  MtLoadActionLoad     = 1,
  MtLoadActionClear    = 2,
} MtLoadAction;

typedef enum MtIndexType {
  MtIndexTypeUInt16 = 0,
  MtIndexTypeUInt32 = 1,
} MtIndexType;

typedef enum MtStoreAction {
  MtStoreActionDontCare                   = 0,
  MtStoreActionStore                      = 1,
  MtStoreActionMultisampleResolve         = 2,
  MtStoreActionStoreAndMultisampleResolve = 3,
  MtStoreActionUnknown                    = 4,
  MtStoreActionCustomSampleDepthStore     = 5,
} MtStoreAction;

typedef enum MtDeviceLocation {
	MtDeviceLocationBuiltIn = 0,
    MtDeviceLocationSlot = 1,
    MtDeviceLocationExternal = 2,
    MtDeviceLocationUnspecified = 100,
} MtDeviceLocation;

typedef enum MtLanguageVersion {
    MtLanguageVersion1_0  = (1 << 16),
    MtLanguageVersion1_1  = (1 << 16) + 1,
    MtLanguageVersion1_2  = (1 << 16) + 2,
    MtLanguageVersion2_0  = (2 << 16),
    MtLanguageVersion2_1  = (2 << 16) + 1,
    MtLanguageVersion2_2  = (2 << 16) + 2,
} MtLanguageVersion;

typedef enum MtFunctionType {
  MtFunctionTypeVertex = 1,
  MtFunctionTypeFragment = 2,
  MtFunctionTypeKernel = 3,
} MtFunctionType;

typedef enum MtDispatchType {
    MtDispatchTypeSerial,
    MtDispatchTypeConcurrent,
} MtDispatchType;

typedef enum MtCommandBufferStatus {
    MtCommandBufferStatusNotEnqueued = 0,
    MtCommandBufferStatusEnqueued = 1,
    MtCommandBufferStatusCommitted = 2,
    MtCommandBufferStatusScheduled = 3,
    MtCommandBufferStatusCompleted = 4,
    MtCommandBufferStatusError = 5,
} MtCommandBufferStatus;

typedef enum MtResourceUsage {
  MtResourceUsageRead   = 1 << 0,
  MtResourceUsageWrite  = 1 << 1,
  MtResourceUsageSample = 1 << 2
} MtResourceUsage;

typedef enum MtGPUFamily {
    MtGPUFamilyApple1 = 1001,
    MtGPUFamilyApple2 = 1002,
    MtGPUFamilyApple3 = 1003,
    MtGPUFamilyApple4 = 1004,
    MtGPUFamilyApple5 = 1005,

    MtGPUFamilyMac1 = 2001,
    MtGPUFamilyMac2 = 2002,

    MtGPUFamilyCommon1 = 3001,
    MtGPUFamilyCommon2 = 3002,
    MtGPUFamilyCommon3 = 3003,

    MtGPUFamilyMacCatalyst1 = 4001,
    MtGPUFamilyMacCatalyst2 = 4002,
} MtGPUFamily;

typedef enum MtFeatureSet {
    MtFeatureSet_macOS_GPUFamily1_v1 = 10000,
    MtFeatureSet_OSX_GPUFamily1_v1 = MtFeatureSet_macOS_GPUFamily1_v1, // deprecated

    MtFeatureSet_macOS_GPUFamily1_v2 = 10001,
    MtFeatureSet_OSX_GPUFamily1_v2 = MtFeatureSet_macOS_GPUFamily1_v2, // deprecated
    MtFeatureSet_macOS_ReadWriteTextureTier2 = 10002,
    MtFeatureSet_OSX_ReadWriteTextureTier2 = MtFeatureSet_macOS_ReadWriteTextureTier2, // deprecated

    MtFeatureSet_macOS_GPUFamily1_v3 = 10003,

    MtFeatureSet_macOS_GPUFamily1_v4 = 10004,
    MtFeatureSet_macOS_GPUFamily2_v1 = 10005,
} MtFeatureSet;

typedef enum MtPurgeableState {
    MtPurgeableStateKeepCurrent = 1,

    MtPurgeableStateNonVolatile = 2,
    MtPurgeableStateVolatile = 3,
    MtPurgeableStateEmpty = 4,
} MtPurgeableState;

typedef enum MtCommandBufferError {
    MtCommandBufferErrorNone = 0,
    MtCommandBufferErrorInternal = 1,
    MtCommandBufferErrorTimeout = 2,
    MtCommandBufferErrorPageFault = 3,
    MtCommandBufferErrorBlacklisted = 4,
    MtCommandBufferErrorNotPermitted = 7,
    MtCommandBufferErrorOutOfMemory = 8,
    MtCommandBufferErrorInvalidResource = 9,
    MtCommandBufferErrorMemoryless = 10,
    MtCommandBufferErrorDeviceRemoved = 11,
} MtCommandBufferError;

/*!
 @enum MTLHeapType
 @abstract Describes the mode of operation for an MTLHeap.
 @constant MTLHeapTypeAutomatic
 In this mode, resources are placed in the heap automatically.
 Automatically placed resources have optimal GPU-specific layout, and may perform better than MTLHeapTypePlacement.
 This heap type is recommended when the heap primarily contains temporary write-often resources.
 @constant MTLHeapTypePlacement
 In this mode, the app places resources in the heap.
 Manually placed resources allow the app to control memory usage and heap fragmentation directly.
 This heap type is recommended when the heap primarily contains persistent write-rarely resources.
 */
typedef enum MtHeapType {
  MtHeapTypeAutomatic = 0,
    MtHeapTypePlacement = 1,
} MtHeapType;


typedef enum MtBlitOption {
  MtBlitOptionNone                       = 0,
  MtBlitOptionDepthFromDepthStencil      = 1 << 0,
  MtBlitOptionStencilFromDepthStencil    = 1 << 1,
  } MtBlitOption;


typedef enum {
    MtLibraryErrorUnsupported      = 1,
    MtLibraryErrorInternal         = 2,
    MtLibraryErrorCompileFailure   = 3,
    MtLibraryErrorCompileWarning   = 4,
    MtLibraryErrorFunctionNotFound = 5,
    MtLibraryErrorFileNotFound     = 6,
} MtLibraryError;

typedef enum MtBarrierScope
{
    MtBarrierScopeBuffers        = 1 << 0,
    MtBarrierScopeTextures       = 1 << 1,
    MtBarrierScopeRenderTargets  = 1 << 2,
} MtBarrierScope;

typedef enum MtIndirectCommandType {
    MIndirectCommandTypeDraw                = (1 << 0),
    MIndirectCommandTypeDrawIndexed         = (1 << 1),
    MIndirectCommandTypeDrawPatches         = (1 << 2),
    MIndirectCommandTypeDrawIndexedPatches  = (1 << 3) ,
} MtIndirectCommandType;

typedef enum MtDataType {

    MtDataTypeNone = 0,

    MtDataTypeStruct = 1,
    MtDataTypeArray  = 2,

    MtDataTypeFloat  = 3,
    MtDataTypeFloat2 = 4,
    MtDataTypeFloat3 = 5,
    MtDataTypeFloat4 = 6,

    MtDataTypeFloat2x2 = 7,
    MtDataTypeFloat2x3 = 8,
    MtDataTypeFloat2x4 = 9,

    MtDataTypeFloat3x2 = 10,
    MtDataTypeFloat3x3 = 11,
    MtDataTypeFloat3x4 = 12,

    MtDataTypeFloat4x2 = 13,
    MtDataTypeFloat4x3 = 14,
    MtDataTypeFloat4x4 = 15,

    MtDataTypeHalf  = 16,
    MtDataTypeHalf2 = 17,
    MtDataTypeHalf3 = 18,
    MtDataTypeHalf4 = 19,

    MtDataTypeHalf2x2 = 20,
    MtDataTypeHalf2x3 = 21,
    MtDataTypeHalf2x4 = 22,

    MtDataTypeHalf3x2 = 23,
    MtDataTypeHalf3x3 = 24,
    MtDataTypeHalf3x4 = 25,

    MtDataTypeHalf4x2 = 26,
    MtDataTypeHalf4x3 = 27,
    MtDataTypeHalf4x4 = 28,

    MtDataTypeInt  = 29,
    MtDataTypeInt2 = 30,
    MtDataTypeInt3 = 31,
    MtDataTypeInt4 = 32,

    MtDataTypeUInt  = 33,
    MtDataTypeUInt2 = 34,
    MtDataTypeUInt3 = 35,
    MtDataTypeUInt4 = 36,

    MtDataTypeShort  = 37,
    MtDataTypeShort2 = 38,
    MtDataTypeShort3 = 39,
    MtDataTypeShort4 = 40,

    MtDataTypeUShort = 41,
    MtDataTypeUShort2 = 42,
    MtDataTypeUShort3 = 43,
    MtDataTypeUShort4 = 44,

    MtDataTypeChar  = 45,
    MtDataTypeChar2 = 46,
    MtDataTypeChar3 = 47,
    MtDataTypeChar4 = 48,

    MtDataTypeUChar  = 49,
    MtDataTypeUChar2 = 50,
    MtDataTypeUChar3 = 51,
    MtDataTypeUChar4 = 52,

    MtDataTypeBool  = 53,
    MtDataTypeBool2 = 54,
    MtDataTypeBool3 = 55,
    MtDataTypeBool4 = 56,

    MtDataTypeTexture  = 58,
    MtDataTypeSampler  = 59,
    MtDataTypePointer  = 60,

    MtDataTypeRenderPipeline         = 78,
    MtDataTypeIndirectCommandBuffer  = 80,
} MtDataType;

typedef enum MtArgumentAccess {
    MtArgumentAccessReadOnly   = 0,
    MtArgumentAccessReadWrite  = 1,
    MtArgumentAccessWriteOnly  = 2,
} MtArgumentAccess;

typedef enum MtArgumentBuffersTier
{
    MtArgumentBuffersTier1 = 0,
    MtArgumentBuffersTier2 = 1,
} MtArgumentBuffersTier;

typedef enum MtTextureType {
    MtTextureType1D = 0,
    MtTextureType1DArray = 1,
    MtTextureType2D = 2,
    MtTextureType2DArray = 3,
    MtTextureType2DMultisample = 4,
    MtTextureTypeCube = 5,
    MtTextureTypeCubeArray  = 6,
    MtTextureType3D = 7,
    MtTextureType2DMultisampleArray = 8,
    MtTextureTypeTextureBuffer  = 9
} MtTextureType;

typedef enum MtTextureSwizzle {
    MtTextureSwizzleZero = 0,
    MtTextureSwizzleOne = 1,
    MtTextureSwizzleRed = 2,
    MtTextureSwizzleGreen = 3,
    MtTextureSwizzleBlue = 4,
    MtTextureSwizzleAlpha = 5,
} MtTextureSwizzle;

typedef enum MtAttributeFormat
{
    MtAttributeFormatInvalid = 0,

    MtAttributeFormatUChar2 = 1,
    MtAttributeFormatUChar3 = 2,
    MtAttributeFormatUChar4 = 3,

    MtAttributeFormatChar2 = 4,
    MtAttributeFormatChar3 = 5,
    MtAttributeFormatChar4 = 6,

    MtAttributeFormatUChar2Normalized = 7,
    MtAttributeFormatUChar3Normalized = 8,
    MtAttributeFormatUChar4Normalized = 9,

    MtAttributeFormatChar2Normalized = 10,
    MtAttributeFormatChar3Normalized = 11,
    MtAttributeFormatChar4Normalized = 12,

    MtAttributeFormatUShort2 = 13,
    MtAttributeFormatUShort3 = 14,
    MtAttributeFormatUShort4 = 15,

    MtAttributeFormatShort2 = 16,
    MtAttributeFormatShort3 = 17,
    MtAttributeFormatShort4 = 18,

    MtAttributeFormatUShort2Normalized = 19,
    MtAttributeFormatUShort3Normalized = 20,
    MtAttributeFormatUShort4Normalized = 21,

    MtAttributeFormatShort2Normalized = 22,
    MtAttributeFormatShort3Normalized = 23,
    MtAttributeFormatShort4Normalized = 24,

    MtAttributeFormatHalf2 = 25,
    MtAttributeFormatHalf3 = 26,
    MtAttributeFormatHalf4 = 27,

    MtAttributeFormatFloat = 28,
    MtAttributeFormatFloat2 = 29,
    MtAttributeFormatFloat3 = 30,
    MtAttributeFormatFloat4 = 31,

    MtAttributeFormatInt = 32,
    MtAttributeFormatInt2 = 33,
    MtAttributeFormatInt3 = 34,
    MtAttributeFormatInt4 = 35,

    MtAttributeFormatUInt = 36,
    MtAttributeFormatUInt2 = 37,
    MtAttributeFormatUInt3 = 38,
    MtAttributeFormatUInt4 = 39,

    MtAttributeFormatInt1010102Normalized = 40,
    MtAttributeFormatUInt1010102Normalized = 41,

    MtAttributeFormatUChar4Normalized_BGRA = 42,

    MtAttributeFormatUChar             = 45,
    MtAttributeFormatChar              = 46,
    MtAttributeFormatUCharNormalized   = 47,
    MtAttributeFormatCharNormalized    = 48,

    MtAttributeFormatUShort            = 49,
    MtAttributeFormatShort             = 50,
    MtAttributeFormatUShortNormalized  = 51,
    MtAttributeFormatShortNormalized   = 52,

    MtAttributeFormatHalf              = 53,

} MtAttributeFormat;


typedef enum MtStepFunction
{
    MtStepFunctionConstant = 0,

    // vertex functions only
    MtStepFunctionPerVertex = 1,
    MtStepFunctionPerInstance = 2,
    MtStepFunctionPerPatch  = 3,
    MtStepFunctionPerPatchControlPoint  = 4,

    // compute functions only
    MtStepFunctionThreadPositionInGridX = 5,
    MtStepFunctionThreadPositionInGridY = 6,
    MtStepFunctionThreadPositionInGridXIndexed = 7,
    MtStepFunctionThreadPositionInGridYIndexed = 8,
} MtStepFunction;

typedef enum MtPipelineOption
{
    MtPipelineOptionNone               = 0,
    MtPipelineOptionArgumentInfo       = 1 << 0,
    MtPipelineOptionBufferTypeInfo     = 1 << 1,
} MtPipelineOption;

typedef enum MtArgumentType {
    MtArgumentTypeBuffer = 0,
    MtArgumentTypeThreadgroupMemory= 1,
    MtArgumentTypeTexture = 2,
    MtArgumentTypeSampler = 3,
} MtArgumentType;

typedef struct {
    uint32_t threadgroupsPerGrid[3];
} MtDispatchThreadgroupsIndirectArguments;

typedef struct {
	uint32_t  stageInOrigin[3];
	uint32_t  stageInSize[3];
} MtStageInRegionIndirectArguments;

typedef struct
{
    MtOrigin origin;
    MtSize   size;
} MtRegion;

typedef struct
{
    uint32_t location;
    uint32_t length;
}  MtIndirectCommandBufferExecutionRange;

typedef struct
{
    MtTextureSwizzle red;
    MtTextureSwizzle green;
    MtTextureSwizzle blue;
    MtTextureSwizzle alpha;
} MtTextureSwizzleChannels;

typedef enum MtCPUCacheMode {
  MtCPUCacheModeDefaultCache  = 0,
  MtCPUCacheModeWriteCombined = 1
} MtCPUCacheMode;

typedef enum MtHazardTrackingMode {
  MtHazardTrackingModeDefault   = 0,
  MtHazardTrackingModeUntracked = 1,
  MtHazardTrackingModeTracked   = 2
} MtHazardTrackingMode;

typedef enum MtStorageMode {
  MtStorageModeShared     = 0,
  MtStorageModeManaged    = 1,
  MtStorageModePrivate    = 2,
  MtStorageModeMemoryless = 3
} MtStorageMode;

typedef enum MtResourceOptions {
  MtResourceCPUCacheModeDefaultCache    = MtCPUCacheModeDefaultCache,
  MtResourceCPUCacheModeWriteCombined   = MtCPUCacheModeWriteCombined,
  
  MtResourceStorageModeShared           = MtStorageModeShared           << 4,
  MtResourceStorageModeManaged          = MtStorageModeManaged          << 4,
  MtResourceStorageModePrivate          = MtStorageModePrivate          << 4,
  MtResourceStorageModeMemoryless       = MtStorageModeMemoryless       << 4,
  
  MtResourceHazardTrackingModeDefault   = MtHazardTrackingModeDefault   << 8,
  MtResourceHazardTrackingModeUntracked = MtHazardTrackingModeUntracked << 8,
  MtResourceHazardTrackingModeTracked   = MtHazardTrackingModeTracked   << 8
} MtResourceOptions;

#import <Foundation/Foundation.h>
#import <Metal/Metal.h>
#import <QuartzCore/QuartzCore.h>

MT_HIDE MT_INLINE
NSString* mtNSString(const char* str)
{
    return [NSString stringWithCString: str
            encoding: NSUTF8StringEncoding];
}

MT_HIDE
MT_INLINE
const char*
Cstring(NSString* str) {
  return [str cStringUsingEncoding:NSUTF8StringEncoding];
}

MT_HIDE
MT_INLINE
MTLSize
mtMTLSize(MtSize size) {
	return MTLSizeMake(size.width, size.height, size.depth);
}

MT_HIDE
MT_INLINE
MtSize
mtSize(MTLSize size) {
	MtSize sz = {size.width, size.height, size.depth};
	return sz;
}

MT_HIDE
MT_INLINE
MTLOrigin
mtMTLOrigin(MtOrigin orig) {
	return MTLOriginMake(orig.x, orig.y, orig.z);
}

MT_HIDE
MT_INLINE
MtOrigin
mtOrigin(MTLOrigin orig) {
	MtOrigin o = {orig.x, orig.y, orig.z};
	return o;
}

MT_HIDE
MT_INLINE
MTLSizeAndAlign
mtMTLSizeAndAlign(MtSizeAndAlign s) {
	MTLSizeAndAlign o = {s.size, s.align};
	return o;
}

MT_HIDE
MT_INLINE
MtSizeAndAlign
mtSizeAndAlign(MTLSizeAndAlign s) {
	MtSizeAndAlign o = {s.size, s.align};
	return o;
}


MT_HIDE
MT_INLINE
NSRange
mtNSRange(NsRange range) {
	return NSMakeRange(range.location, range.length);
}

MT_HIDE
MT_INLINE
NsRange
mtRange(NSRange range) {
	NsRange r = {range.location, range.length};
	return r;
}

MT_HIDE
MT_INLINE
const char*
CstringFromDict(NSDictionary<NSErrorUserInfoKey, id> *dict) {
	return Cstring([NSString stringWithFormat:@"Dictionary: %@", dict]);
}

MT_HIDE
MT_INLINE
MTLRegion
mtMTLRegion(MtRegion region) {
	MTLRegion reg = {mtMTLOrigin(region.origin), mtMTLSize(region.size)};
	return reg;
}

MT_HIDE
MT_INLINE
MtRegion
mtRegion(MtRegion region) {
	MtRegion reg = {region.origin, region.size};
	return reg;
}

MT_HIDE
MT_INLINE
MtIndirectCommandBufferExecutionRange
mtIndirectCommandBufferExecutionRange(MtIndirectCommandBufferExecutionRange range) {
  MtIndirectCommandBufferExecutionRange icbRange = {range.location, range.length};
  return icbRange;
}

MT_HIDE
MT_INLINE
MtIndirectCommandBufferExecutionRange
mtMTLIndirectCommandBufferExecutionRange(MtIndirectCommandBufferExecutionRange range) {
  MtIndirectCommandBufferExecutionRange icbRange = {range.location, range.length};
  return icbRange;
}


CF_RETURNS_RETAINED MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) MT_EXPORT
MtCompileOptions* mtl_compile_options_new()
{
    return [MTLCompileOptions new];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) 
MtLanguageVersion mtl_compile_options_get_language_version(MtCompileOptions* compile_options)
{
    return (MtLanguageVersion) [(MTLCompileOptions*) (compile_options) languageVersion];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) 
void mtl_compile_options_set_language_version(MtCompileOptions* compile_options, MtLanguageVersion language_version)
{
    return [(MTLCompileOptions*) (compile_options) setLanguageVersion:(MTLLanguageVersion) language_version];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) 
bool mtl_compile_options_get_fast_math_enabled(MtCompileOptions* compile_options)
{
    return [(MTLCompileOptions*) (compile_options) fastMathEnabled];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) 
void mtl_compile_options_set_fast_math_enabled(MtCompileOptions* compile_options, bool fast_math_enabled)
{
    return [(MTLCompileOptions*) (compile_options) setFastMathEnabled: fast_math_enabled];
}

// Device
CF_RETURNS_RETAINED MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) 
const char* mtl_device_get_name(MtDevice* device)
{
    return [[(id<MTLDevice>)device name] cStringUsingEncoding:NSUTF8StringEncoding];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) 
bool mtl_device_is_headless(MtDevice* device)
{
    return [(id<MTLDevice>) device isHeadless];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) 
bool mtl_device_is_low_power(MtDevice* device)
{
    return [(id<MTLDevice>) device isLowPower];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11)) MT_API_UNAVAILABLE(mt_ios) 
bool mtl_device_is_removable(MtDevice* device)
{
    return [(id<MTLDevice>) device isRemovable];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.13), mt_ios(11.0)) 
uint64_t mtl_device_get_registry_id(MtDevice* device)
{
    return [(id<MTLDevice>) device registryID];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) 
MtDeviceLocation mtl_device_get_location(MtDevice* device)
{
    return [(id<MTLDevice>)device location];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.15)) MT_API_UNAVAILABLE(mt_ios)
uint64_t mtl_device_get_location_number(MtDevice* device)
{
    return [(id<MTLDevice>)device locationNumber];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.15)) MT_API_UNAVAILABLE(mt_ios)
uint64_t mtl_device_get_max_transfer_rate(MtDevice* device)
{
    return [(id<MTLDevice>)device maxTransferRate];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.15), mt_ios(13.0))
bool mtl_device_has_unified_memory(MtDevice* device)
{
    return [(id<MTLDevice>)device hasUnifiedMemory];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.15)) MT_API_UNAVAILABLE(mt_ios)
uint64_t mtl_device_get_peer_group_id(MtDevice* device)
{
    return [(id<MTLDevice>)device peerGroupID];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.15)) MT_API_UNAVAILABLE(mt_ios)
uint32_t mtl_device_get_peer_count(MtDevice* device)
{
    return [(id<MTLDevice>)device peerCount];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.15)) MT_API_UNAVAILABLE(mt_ios)
uint32_t mtl_device_get_peer_index(MtDevice* device)
{
    return [(id<MTLDevice>)device peerIndex];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.15), mt_ios(13.0))
bool mtl_device_supports_gpu_family(MtDevice* device, MtGPUFamily family)
{
    return [(id<MTLDevice>)device supportsFamily: (MTLGPUFamily)family];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0))
bool mtl_device_supports_feature_set(MtDevice* device, MtFeatureSet feature_set)
{
    return [(id<MTLDevice>)device supportsFeatureSet: (MTLFeatureSet)feature_set];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.14), mt_ios(12.0))
NsUInteger mtl_device_get_max_buffer_length(MtDevice* device)
{
    return [(id<MTLDevice>)device maxBufferLength];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) CF_RETURNS_RETAINED
MtBuffer* mtl_new_buffer(MtDevice* device, NsUInteger length, MtResourceOptions options)
{
    return [(id<MTLDevice>)device
        newBufferWithLength: length
        options: (MTLResourceOptions)options];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) CF_RETURNS_RETAINED
MtBuffer* mtl_new_buffer_from_memory(MtDevice* __restrict device, const void* __restrict ptr, NsUInteger len, MtResourceOptions options)
{
    return [(id<MTLDevice>)device
        newBufferWithBytes: ptr
        length: len
        options: (MTLResourceOptions)options];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) CF_RETURNS_RETAINED
MtBuffer* mtl_new_buffer_from_memory_no_copy(MtDevice* device, void* __restrict _Nonnull ptr, NsUInteger len, MtResourceOptions options)
{
    return [(id<MTLDevice>)device newBufferWithBytesNoCopy: ptr 
                                   					length: len 
                                  				   options: (MTLResourceOptions)options 
                              				   deallocator: nil];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) CF_RETURNS_RETAINED
MtLibrary* mtl_new_default_library(MtDevice* device)
{
    return [(id<MTLDevice>)device newDefaultLibrary];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) CF_RETURNS_RETAINED
MtLibrary* mtl_new_library_from_file(MtDevice* device, char* filepath, NsError* error)
{
      return [(id<MTLDevice>)device newLibraryWithFile: mtNSString(filepath) error:(NSError**)&error];
}

MT_EXPORT MT_API_AVAILABLE(mt_macos(10.11), mt_ios(8.0)) CF_RETURNS_RETAINED
MtLibrary* mtl_new_library_from_source(MtDevice* device, char* source, MtCompileOptions* options, NsError** error)
{
    NSError *_err;
    MtLibrary* lib = [(id<MTLDevice>)device
        newLibraryWithSource: mtNSString(source)
        options: (MTLCompileOptions*)options
        error: &_err];

    *error = _err;

    return lib;
}

void mtl_new_event(MtDevice* device)
{
}

void mtl_new_shared_event(MtDevice* device)
{
}

void mtl_new_shared_event_with_handle(MtDevice* device, shared_event_handle)
{
}

void mtl_new_fence(MtDevice* device)
{
}
//
//void mtl_device_get_recommended_max_working_set_size(MtDevice* device)
//{
//}

//void mtl_device_get_current_allocated_size(MtDevice* device)
//{
//}

//void mtl_device_get_max_thread_group_memory_length(MtDevice* device)
//{
//}

//void mtl_device_get_max_threads_per_thread_group(MtDevice* device)
//{
//}

