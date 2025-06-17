# WebGPU bindings for GML

## Table of Contents

* [About this document](#about-this-document)
* [Structs](#structs)
  * [GPU](#gpu)
    * [GPU.getCurrentTextureView](#gpugetcurrenttextureview)
    * [GPU.getPreferredCanvasFormat](#gpugetpreferredcanvasformat)
    * [GPU.getResourceTexture](#gpugetresourcetexture)
    * [GPU.getResourceTextureView](#gpugetresourcetextureview)
    * [GPU.requestAdapter](#gpurequestadapter)
    * [GPU.requestAnimationFrame](#gpurequestanimationframe)
    * [GPU.wgslLanguageFeatures](#gpuwgsllanguagefeatures)
  * [GPUAdapter](#gpuadapter)
    * [GPUAdapter.features](#gpuadapterfeatures)
    * [GPUAdapter.info](#gpuadapterinfo)
    * [GPUAdapter.isFallbackAdapter](#gpuadapterisfallbackadapter)
    * [GPUAdapter.limits](#gpuadapterlimits)
    * [GPUAdapter.requestDevice](#gpuadapterrequestdevice)
  * [GPUBindGroup](#gpubindgroup)
    * [GPUBindGroup.label](#gpubindgrouplabel)
  * [GPUBindGroupDescriptor](#gpubindgroupdescriptor)
  * [GPUBindGroupLayout](#gpubindgrouplayout)
    * [GPUBindGroupLayout.label](#gpubindgrouplayoutlabel)
  * [GPUBindGroupLayoutDescriptor](#gpubindgrouplayoutdescriptor)
  * [GPUBuffer](#gpubuffer)
    * [GPUBuffer.destroy](#gpubufferdestroy)
    * [GPUBuffer.label](#gpubufferlabel)
    * [GPUBuffer.getMappedRange](#gpubuffergetmappedrange)
    * [GPUBuffer.mapAsync](#gpubuffermapasync)
    * [GPUBuffer.mapState](#gpubuffermapstate)
    * [GPUBuffer.size](#gpubuffersize)
    * [GPUBuffer.unmap](#gpubufferunmap)
    * [GPUBuffer.usage](#gpubufferusage)
  * [GPUBufferDescriptor](#gpubufferdescriptor)
  * [GPUColor](#gpucolor)
  * [GPUCommandBuffer](#gpucommandbuffer)
    * [GPUCommandBuffer.label](#gpucommandbufferlabel)
  * [GPUCommandBufferDescriptor](#gpucommandbufferdescriptor)
  * [GPUCommandEncoder](#gpucommandencoder)
    * [GPUCommandEncoder.beginComputePass](#gpucommandencoderbegincomputepass)
    * [GPUCommandEncoder.beginRenderPass](#gpucommandencoderbeginrenderpass)
    * [GPUCommandEncoder.clearBuffer](#gpucommandencoderclearbuffer)
    * [GPUCommandEncoder.copyBufferToBuffer](#gpucommandencodercopybuffertobuffer)
    * [GPUCommandEncoder.copyBufferToTexture](#gpucommandencodercopybuffertotexture)
    * [GPUCommandEncoder.copyTextureToBuffer](#gpucommandencodercopytexturetobuffer)
    * [GPUCommandEncoder.copyTextureToTexture](#gpucommandencodercopytexturetotexture)
    * [GPUCommandEncoder.finish](#gpucommandencoderfinish)
    * [GPUCommandEncoder.insertDebugMarker](#gpucommandencoderinsertdebugmarker)
    * [GPUCommandEncoder.label](#gpucommandencoderlabel)
    * [GPUCommandEncoder.popDebugGroup](#gpucommandencoderpopdebuggroup)
    * [GPUCommandEncoder.pushDebugGroup](#gpucommandencoderpushdebuggroup)
    * [GPUCommandEncoder.resolveQuerySet](#gpucommandencoderresolvequeryset)
  * [GPUCommandEncoderDescriptor](#gpucommandencoderdescriptor)
  * [GPUComputePassDescriptor](#gpucomputepassdescriptor)
  * [GPUComputePassEncoder](#gpucomputepassencoder)
    * [GPUComputePassEncoder.dispatchWorkgroups](#gpucomputepassencoderdispatchworkgroups)
    * [GPUComputePassEncoder.dispatchWorkgroupsIndirect](#gpucomputepassencoderdispatchworkgroupsindirect)
    * [GPUComputePassEncoder.end_](#gpucomputepassencoderend_)
    * [GPUComputePassEncoder.insertDebugMarker](#gpucomputepassencoderinsertdebugmarker)
    * [GPUComputePassEncoder.label](#gpucomputepassencoderlabel)
    * [GPUComputePassEncoder.popDebugGroup](#gpucomputepassencoderpopdebuggroup)
    * [GPUComputePassEncoder.pushDebugGroup](#gpucomputepassencoderpushdebuggroup)
    * [GPUComputePassEncoder.setBindGroup](#gpucomputepassencodersetbindgroup)
    * [GPUComputePassEncoder.setPipeline](#gpucomputepassencodersetpipeline)
  * [GPUComputePipeline](#gpucomputepipeline)
    * [GPUComputePipeline.getBindGroupLayout](#gpucomputepipelinegetbindgrouplayout)
    * [GPUComputePipeline.label](#gpucomputepipelinelabel)
  * [GPUComputePipelineDescriptor](#gpucomputepipelinedescriptor)
  * [GPUDevice](#gpudevice)
    * [GPUDevice.createBindGroup](#gpudevicecreatebindgroup)
    * [GPUDevice.createBindGroupLayout](#gpudevicecreatebindgrouplayout)
    * [GPUDevice.createBuffer](#gpudevicecreatebuffer)
    * [GPUDevice.createCommandEncoder](#gpudevicecreatecommandencoder)
    * [GPUDevice.createComputePipeline](#gpudevicecreatecomputepipeline)
    * [GPUDevice.createPipelineLayout](#gpudevicecreatepipelinelayout)
    * [GPUDevice.createQuerySet](#gpudevicecreatequeryset)
    * [GPUDevice.createRenderBundleEncoder](#gpudevicecreaterenderbundleencoder)
    * [GPUDevice.createRenderPipeline](#gpudevicecreaterenderpipeline)
    * [GPUDevice.createSampler](#gpudevicecreatesampler)
    * [GPUDevice.createShaderModule](#gpudevicecreateshadermodule)
    * [GPUDevice.createTexture](#gpudevicecreatetexture)
    * [GPUDevice.queue](#gpudevicequeue)
  * [GPUDeviceDescriptor](#gpudevicedescriptor)
  * [GPUExtent3D](#gpuextent3d)
  * [GPUImageCopyBuffer](#gpuimagecopybuffer)
  * [GPUImageCopyTexture](#gpuimagecopytexture)
  * [GPUMappedRange](#gpumappedrange)
    * [GPUMappedRange.at](#gpumappedrangeat)
    * [GPUMappedRange.fromBuffer](#gpumappedrangefrombuffer)
    * [GPUMappedRange.set](#gpumappedrangeset)
    * [GPUMappedRange.toBuffer](#gpumappedrangetobuffer)
  * [GPUPipelineLayout](#gpupipelinelayout)
    * [GPUPipelineLayout.label](#gpupipelinelayoutlabel)
  * [GPUPipelineLayoutDescriptor](#gpupipelinelayoutdescriptor)
  * [GPUQuerySet](#gpuqueryset)
    * [GPUQuerySet.count](#gpuquerysetcount)
    * [GPUQuerySet.destroy](#gpuquerysetdestroy)
    * [GPUQuerySet.label](#gpuquerysetlabel)
    * [GPUQuerySet.type](#gpuquerysettype)
  * [GPUQuerySetDescriptor](#gpuquerysetdescriptor)
  * [GPUQueue](#gpuqueue)
    * [GPUQueue.label](#gpuqueuelabel)
    * [GPUQueue.onSubmittedWorkDone](#gpuqueueonsubmittedworkdone)
    * [GPUQueue.submit](#gpuqueuesubmit)
    * [GPUQueue.writeBuffer](#gpuqueuewritebuffer)
    * [GPUQueue.writeTexture](#gpuqueuewritetexture)
  * [GPURenderBundle](#gpurenderbundle)
    * [GPURenderBundle.label](#gpurenderbundlelabel)
  * [GPURenderBundleDescriptor](#gpurenderbundledescriptor)
  * [GPURenderBundleEncoder](#gpurenderbundleencoder)
    * [GPURenderBundleEncoder.draw](#gpurenderbundleencoderdraw)
    * [GPURenderBundleEncoder.drawIndexed](#gpurenderbundleencoderdrawindexed)
    * [GPURenderBundleEncoder.drawIndexedIndirect](#gpurenderbundleencoderdrawindexed)
    * [GPURenderBundleEncoder.drawIndirect](#gpurenderbundleencoderdrawindirect)
    * [GPURenderBundleEncoder.finish](#gpurenderbundleencoderfinish)
    * [GPURenderBundleEncoder.insertDebugMarker](#gpurenderbundleencoderinsertdebugmarker)
    * [GPURenderBundleEncoder.label](#gpurenderbundleencoderlabel)
    * [GPURenderBundleEncoder.popDebugGroup](#gpurenderbundleencoderpopdebuggroup)
    * [GPURenderBundleEncoder.pushDebugGroup](#gpurenderbundleencoderpushdebuggroup)
    * [GPURenderBundleEncoder.setBindGroup](#gpurenderbundleencodersetbindgroup)
    * [GPURenderBundleEncoder.setIndexBuffer](#gpurenderbundleencodersetindexbuffer)
    * [GPURenderBundleEncoder.setPipeline](#gpurenderbundleencodersetpipeline)
    * [GPURenderBundleEncoder.setVertexBuffer](#gpurenderbundleencodersetvertexbuffer)
  * [GPURenderBundleEncoderDescriptor](#gpurenderbundleencoderdescriptor)
  * [GPURenderPassDescriptor](#gpurenderpassdescriptor)
  * [GPURenderPassEncoder](#gpurenderpassencoder)
    * [GPURenderPassEncoder.beginOcclusionQuery](#gpurenderpassencoderbeginocclusionquery)
    * [GPURenderPassEncoder.draw](#gpurenderpassencoderdraw)
    * [GPURenderPassEncoder.drawIndexed](#gpurenderpassencoderdrawindexed)
    * [GPURenderPassEncoder.drawIndexedIndirect](#gpurenderpassencoderdrawindexedindirect)
    * [GPURenderPassEncoder.drawIndirect](#gpurenderpassencoderdrawindirect)
    * [GPURenderPassEncoder.end_](#gpurenderpassencoderend_)
    * [GPURenderPassEncoder.endOcclusionQuery](#gpurenderpassencoderendocclusionquery)
    * [GPURenderPassEncoder.executeBundles](#gpurenderpassencoderexecutebundles)
    * [GPURenderPassEncoder.insertDebugMarker](#gpurenderpassencoderinsertdebugmarker)
    * [GPURenderPassEncoder.label](#gpurenderpassencoderlabel)
    * [GPURenderPassEncoder.popDebugGroup](#gpurenderpassencoderpopdebuggroup)
    * [GPURenderPassEncoder.pushDebugGroup](#gpurenderpassencoderpushdebuggroup)
    * [GPURenderPassEncoder.setBindGroup](#gpurenderpassencodersetbindgroup)
    * [GPURenderPassEncoder.setBlendConstant](#gpurenderpassencodersetblendconstant)
    * [GPURenderPassEncoder.setIndexBuffer](#gpurenderpassencodersetindexbuffer)
    * [GPURenderPassEncoder.setPipeline](#gpurenderpassencodersetpipeline)
    * [GPURenderPassEncoder.setScissorRect](#gpurenderpassencodersetscissorrect)
    * [GPURenderPassEncoder.setStencilReference](#gpurenderpassencodersetstencilreference)
    * [GPURenderPassEncoder.setVertexBuffer](#gpurenderpassencodersetvertexbuffer)
    * [GPURenderPassEncoder.setViewport](#gpurenderpassencodersetviewport)
  * [GPURenderPipeline](#gpurenderpipeline)
    * [GPURenderPipeline.getBindGroupLayout](#gpurenderpipelinegetbindgrouplayout)
    * [GPURenderPipeline.label](#gpurenderpipelinelabel)
  * [GPURenderPipelineDescriptor](#gpurenderpipelinedescriptor)
  * [GPURequestAdapterOptions](#gpurequestadapteroptions)
  * [GPUSampler](#gpusampler)
    * [GPUSampler.label](#gpusamplerlabel)
  * [GPUSamplerDescriptor](#gpusamplerdescriptor)
  * [GPUShaderModule](#gpushadermodule)
    * [GPUShaderModule.getCompilationInfo](#gpushadermodulegetcompilationinfo)
    * [GPUShaderModule.label](#gpushadermodulelabel)
  * [GPUShaderModuleDescriptor](#gpushadermoduledescriptor)
  * [GPUTexture](#gputexture)
    * [GPUTexture.createView](#gputexturecreateview)
    * [GPUTexture.depthOrArrayLayers](#gputexturedepthorarraylayers)
    * [GPUTexture.destroy](#gputexturedestroy)
    * [GPUTexture.dimension](#gputexturedimension)
    * [GPUTexture.format](#gputextureformat)
    * [GPUTexture.height](#gputextureheight)
    * [GPUTexture.label](#gputexturelabel)
    * [GPUTexture.mipLevelCount](#gputexturemiplevelcount)
    * [GPUTexture.sampleCount](#gputexturesamplecount)
    * [GPUTexture.usage](#gputextureusage)
    * [GPUTexture.width](#gputexturewidth)
  * [GPUTextureDataLayout](#gputexturedatalayout)
  * [GPUTextureDescriptor](#gputexturedescriptor)
  * [GPUTextureView](#gputextureview)
    * [GPUTextureView.label](#gputextureviewlabel)
  * [GPUTextureViewDescriptor](#gputextureviewdescriptor)
* [Enums](#enums)
  * [GPUAddressMode](#gpuaddressmode)
  * [GPUAutoLayoutMode](#gpuautolayoutmode)
  * [GPUBlendFactor](#gpublendfactor)
  * [GPUBlendOperation](#gpublendoperation)
  * [GPUBufferBindingType](#gpubufferbindingtype)
  * [GPUBufferMapAsyncStatus](#gpubuffermapasyncstatus)
  * [GPUBufferMapState](#gpubuffermapstate)
  * [GPUBufferUsage](#gpubufferusage)
  * [GPUCanvasAlphaMode](#gpucanvasalphamode)
  * [GPUColorWrite](#gpucolorwrite)
  * [GPUCompareFunction](#gpucomparefunction)
  * [GPUCompilationMessageType](#gpucompilationmessagetype)
  * [GPUCullMode](#gpucullmode)
  * [GPUDeviceLostReason](#gpudevicelostreason)
  * [GPUErrorFilter](#gpuerrorfilter)
  * [GPUFeatureName](#gpufeaturename)
  * [GPUFilterMode](#gpufiltermode)
  * [GPUFrontFace](#gpufrontface)
  * [GPUIndexFormat](#gpuindexformat)
  * [GPULoadOp](#gpuloadop)
  * [GPUMapMode](#gpumapmode)
  * [GPUMipmapFilterMode](#gpumipmapfiltermode)
  * [GPUPipelineErrorReason](#gpupipelineerrorreason)
  * [GPUPowerPreference](#gpupowerpreference)
  * [GPUPrimitiveTopology](#gpuprimitivetopology)
  * [GPUQueryType](#gpuquerytype)
  * [GPUSamplerBindingType](#gpusamplerbindingtype)
  * [GPUShaderStage](#gpushaderstage)
  * [GPUStencilOperation](#gpustenciloperation)
  * [GPUStorageTextureAccess](#gpustoragetextureaccess)
  * [GPUStoreOp](#gpustoreop)
  * [GPUTextureAspect](#gputextureaspect)
  * [GPUTextureDimension](#gputexturedimension)
  * [GPUTextureFormat](#gputextureformat)
  * [GPUTextureSampleType](#gputexturesampletype)
  * [GPUTextureUsage](#gputextureusage)
  * [GPUTextureViewDimension](#gputextureviewdimension)
  * [GPUVertexFormat](#gpuvertexformat)
  * [GPUVertexStepMode](#gpuvertexstepmode)

## About this document

This document serves as a reference for the WebGPU functions currently available in GML. Please note that these functions are experimental! Some may differ from their standard definitions or be unique to GameMaker. All functions listed in this document are potential subject to change in the future.

If you would like to learn about the WebGPU API in greater detail, please see the following websites: <https://gpuweb.github.io/gpuweb/>, <https://developer.mozilla.org/en-US/docs/Web/API/WebGPU_API>.

## Structs

### GPU

A struct that serves as an entry point to WebGPU functions. Counterpart to JavaScript's `navigator.gpu`. Mainly used to retrieve a [GPUAdapter](#gpuadapter).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPU>

#### GPU.getCurrentTextureView

A static method of struct [GPU](#gpu). Counterpart to JavaScript's `canvas.getCurrentTexture().createView()`. Retrieves a [GPUTextureView](#gputextureview) for the current back buffer.

**Syntax:**

```gml
getCurrentTextureView()
```

**Returns:** [GPUTextureView](#gputextureview)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCanvasContext/getCurrentTexture>, <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/createView>, <https://en.wikipedia.org/wiki/Multiple_buffering#Page_flipping>

#### GPU.getPreferredCanvasFormat

A static method of struct [GPU](#gpu). Returns the texture format used by the [back buffer](#gpugetcurrenttextureview) and the `application_surface`.

**Syntax:**

```gml
getPreferredCanvasFormat()
```

**Returns:** [GPUTextureFormat](#gputextureformat)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPU/getPreferredCanvasFormat>

#### GPU.getResourceTexture

A static method of struct [GPU](#gpu). **This function is specific to GameMaker** and is used to retrieve a [GPUTexture](#gputexture) for a texture returned by one of the `*_get_texture` functions (e.g. `sprite_get_texture`, `surface_get_texture`).

**Syntax:**

```gml
getResourceTexture(texture)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
texture | `Pointer.Texture` | ❌ | The texture to retrieve a `GPUTexture` for.

**Returns:** [GPUTexture](#gputexture)

#### GPU.getResourceTextureView

A static method of struct [GPU](#gpu). **This function is specific to GameMaker** and is used to retrieve a [GPUTextureView](#gputextureview) for a texture returned by one of the `*_get_texture` functions (e.g. `sprite_get_texture`, `surface_get_texture`).

**Syntax:**

```gml
getResourceTextureView(texture)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
texture | `Pointer.Texture` | ❌ | The texture to retrieve a `GPUTextureView` for.

**Returns:** [GPUTextureView](#gputextureview)

**Note:**

This is the same as `GPU.getResourceTexture(texture).createView()`, except it returns an existing `GPUTextureView` instead of creating a new one.

#### GPU.requestAdapter

A static method of struct [GPU](#gpu). Returns a [GPUAdapter](#gpuadapter), which can be further used to retrieve a [GPUDevice](#gpudevice). Currently the `options` argument is ignored and the function always returns the adapter used internally by GameMaker!

**Syntax:**

```gml
requestAdapter([options])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
options | [GPURequestAdapterOptions](#gpurequestadapteroptions) | ✅ | Currently ignored by the function.

**Returns:** [GPUAdapter](#gpuadapter)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPU/requestAdapter>

#### GPU.requestAnimationFrame

A static method of struct [GPU](#gpu). Counterpart to JavaScript's `window.requestAnimationFrame(callback)`, except the callback function is currently called immediately!

**Syntax:**

```gml
requestAnimationFrame(callback)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
callback | `Function` | ❌ | A function that submits commands to the GPU.

**Returns:** N/A

**Note:**

Unlike in JS, you should never call `requestAnimationFrame` inside of the callback function, or your game will be stuck in an endless loop! Use for example the Draw event to call the function every frame!

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/Window/requestAnimationFrame>

#### GPU.wgslLanguageFeatures

A static read-only property of struct [GPU](#gpu). Contains an array of available [WGSL language features](https://gpuweb.github.io/gpuweb/wgsl/#language-extension).

**Type:** `Array<String>`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPU/wgslLanguageFeatures>

### GPUAdapter

A struct used mainly to retrieve a [GPUDevice](#gpudevice), which can be further used to create command encoders, GPU resources and retrieve a [GPUQueue](#gpuqueue). Retrieved with [GPU.requestAdapter](#gpurequestadapter).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUAdapter>

#### GPUAdapter.features

A read-only property of struct [GPUAdapter](#gpuadapter). Contains an array of features supported by the adapter.

**Type:** `Array<String>`

**Links:** <https://gpuweb.github.io/gpuweb/#feature-index>

#### GPUAdapter.info

A read-only property of struct [GPUAdapter](#gpuadapter). Contains a struct with info about the adapter.

**Type:** `Struct`

**Adapter info struct:**

Key | Type | Description
--- | ---- | -----------
`architecture` | `String` | The name of the family or class of GPUs the adapter belongs to, if available. Empty string otherwise.
`description` | `String` | A human readable string describing the adapter as reported by the driver, if available. Empty string otherwise.
`device` | `String` | A vendor-specific identifier for the adapter, if available. Empty string otherwise.
`vendor` | `String` | The name of the vendor of the adapter, if available. Empty string otherwise.

**Links:** <https://www.w3.org/TR/webgpu/#gpuadapterinfo>

#### GPUAdapter.isFallbackAdapter

A read-only property of struct [GPUAdapter](#gpuadapter). Equals `true` if the adapter is a fallback adapter.

**Type:** `Bool`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUAdapter/isFallbackAdapter>

#### GPUAdapter.limits

A read-only property of struct [GPUAdapter](#gpuadapter). Contains a struct that describes limits supported by the adapter.

**Type:** `Struct`

**Limits struct:**

Key | Type | Description
--- | ---- | -----------
`maxBindGroups` | `Real` | The maximum number of [GPUBindGroupLayout](#gpubindgrouplayout)s allowed in `bindGroupLayouts` when creating a [GPUPipelineLayout](#gpupipelinelayout).
`maxBindGroupsPlusVertexBuffers` | `Real` | The maximum number of bind group and vertex buffer slots used simultaneously, counting any empty slots below the highest index. Validated in [createRenderPipeline()](#gpudevicecreaterenderpipeline) and in draw calls.
`maxBindingsPerBindGroup` | `Real` | The number of binding indices available when creating a [GPUBindGroupLayout](#gpubindgrouplayout).
`maxBufferSize` | `Real` | The maximum size of `size` when creating a [GPUBuffer](#gpubuffer).
`maxColorAttachmentBytesPerSample` | `Real` | The maximum number of bytes necessary to hold one sample (pixel or subpixel) of render pipeline output data, across all color attachments.
`maxColorAttachments` | `Real` | The maximum allowed number of color attachments in [GPURenderPipelineDescriptor](#gpurenderpipelinedescriptor)`.fragment.targets`, [GPURenderPassDescriptor](#gpurenderpassdescriptor)`.colorAttachments`, and `GPURenderPassLayout.colorFormats`.
`maxComputeInvocationsPerWorkgroup` | `Real` | The maximum value of the product of the `workgroup_size` dimensions for a compute stage [GPUShaderModule](#gpushadermodule) entry-point.
`maxComputeWorkgroupSizeX` | `Real` | The maximum value of the `workgroup_size` X dimension for a compute stage [GPUShaderModule](#gpushadermodule) entry-point.
`maxComputeWorkgroupSizeY` | `Real` | The maximum value of the `workgroup_size` Y dimensions for a compute stage [GPUShaderModule](#gpushadermodule) entry-point.
`maxComputeWorkgroupSizeZ` | `Real` | The maximum value of the `workgroup_size` Z dimensions for a compute stage [GPUShaderModule](#gpushadermodule) entry-point.
`maxComputeWorkgroupsPerDimension` | `Real` | The maximum value for the arguments of [dispatchWorkgroups(workgroupCountX, workgroupCountY, workgroupCountZ)](#gpucomputepassencoderdispatchworkgroups).
`maxComputeWorkgroupStorageSize` | `Real` | The maximum number of bytes of workgroup storage used for a compute stage [GPUShaderModule](#gpushadermodule) entry-point.
`maxDynamicStorageBuffersPerPipelineLayout` | `Real` | The maximum number of `GPUBindGroupLayoutEntry` entries across a [GPUPipelineLayout](#gpupipelinelayout) which are storage buffers with dynamic offsets. See Exceeds the binding slot limits.
`maxDynamicUniformBuffersPerPipelineLayout` | `Real` | The maximum number of `GPUBindGroupLayoutEntry` entries across a [GPUPipelineLayout](#gpupipelinelayout) which are uniform buffers with dynamic offsets. See Exceeds the binding slot limits.
`maxInterStageShaderComponents` | `Real` | The maximum allowed number of components of input or output variables for inter-stage communication (like vertex outputs or fragment inputs).
`maxInterStageShaderVariables` | `Real` | The maximum allowed number of input or output variables for inter-stage communication (like vertex outputs or fragment inputs).
`maxSampledTexturesPerShaderStage` | `Real` | For each possible [GPUShaderStage](#gpushaderstage) stage, the maximum number of `GPUBindGroupLayoutEntry` entries across a [GPUPipelineLayout](#gpupipelinelayout) which are sampled textures. See Exceeds the binding slot limits.
`maxSamplersPerShaderStage` | `Real` | For each possible [GPUShaderStage](#gpushaderstage) stage, the maximum number of `GPUBindGroupLayoutEntry` entries across a [GPUPipelineLayout](#gpupipelinelayout) which are samplers. See Exceeds the binding slot limits.
`maxStorageBufferBindingSize` | `Real` | The maximum `GPUBufferBinding.size` for bindings with a `GPUBindGroupLayoutEntry` entry for which `entry.buffer?.type` is ["storage"](#gpubufferbindingtype) or ["read-only-storage"](#gpubufferbindingtype).
`maxStorageBuffersPerShaderStage` | `Real` | For each possible [GPUShaderStage](#gpushaderstage) stage, the maximum number of `GPUBindGroupLayoutEntry` entries across a [GPUPipelineLayout](#gpupipelinelayout) which are storage buffers. See Exceeds the binding slot limits.
`maxStorageTexturesPerShaderStage` | `Real` | For each possible [GPUShaderStage](#gpushaderstage) stage, the maximum number of `GPUBindGroupLayoutEntry` entries across a [GPUPipelineLayout](#gpupipelinelayout) which are storage textures. See Exceeds the binding slot limits.
`maxTextureArrayLayers` | `Real` | The maximum allowed value for the `size.depthOrArrayLayers` of a texture created with dimension ["2d"](#gputexturedimension).
`maxTextureDimension1D` | `Real` | The maximum allowed value for the `size.width` of a texture created with dimension ["1d"](#gputexturedimension).
`maxTextureDimension2D` | `Real` | The maximum allowed value for the `size.width` and `size.height` of a texture created with dimension ["2d"](#gputexturedimension).
`maxTextureDimension3D` | `Real` | The maximum allowed value for the `size.width`, `size.height` and `size.depthOrArrayLayers` of a texture created with dimension ["3d"](#gputexturedimension).
`maxUniformBufferBindingSize` | `Real` | The maximum `GPUBufferBinding.size` for bindings with a `GPUBindGroupLayoutEntry` entry for which `entry.buffer?.type` is ["uniform"](#gpubufferbindingtype).
`maxUniformBuffersPerShaderStage` | `Real` | For each possible [GPUShaderStage](#gpushaderstage) stage, the maximum number of `GPUBindGroupLayoutEntry` entries across a [GPUPipelineLayout](#gpupipelinelayout) which are uniform buffers. See Exceeds the binding slot limits.
`maxVertexAttributes` | `Real` | The maximum number of attributes in total across buffers when creating a [GPURenderPipeline](#gpurenderpipeline).
`maxVertexBufferArrayStride` | `Real` | The maximum allowed `arrayStride` when creating a [GPURenderPipeline](#gpurenderpipeline).
`maxVertexBuffers` | `Real` | The maximum number of buffers when creating a [GPURenderPipeline](#gpurenderpipeline).
`minStorageBufferOffsetAlignment` | `Real` | The required alignment for `GPUBufferBinding.offset` and the dynamic offsets provided in [setBindGroup()](#gpurenderpassencodersetbindgroup), for bindings with a `GPUBindGroupLayoutEntry` entry for which `entry.buffer?.type` is ["storage"](#gpubufferbindingtype) or ["read-only-storage"](#gpubufferbindingtype).
`minUniformBufferOffsetAlignment` | `Real` | The required alignment for `GPUBufferBinding.offset` and the dynamic offsets provided in [setBindGroup()](#gpurenderpassencodersetbindgroup), for bindings with a `GPUBindGroupLayoutEntry` entry for which `entry.buffer?.type` is ["uniform"](#gpubufferbindingtype).

**Links:** <https://gpuweb.github.io/gpuweb/#limits>

#### GPUAdapter.requestDevice

A method of struct [GPUAdapter](#gpuadapter). Returns a [GPUDevice](#gpudevice), which can be further used to create command encoders, GPU resources and retrieve a [GPUQueue](#gpuqueue). The `descriptor` argument is currently ignored and the function always returns the device used internally by GameMaker! Features enabled in this device (when available) are: ["timestamp-query"](https://www.w3.org/TR/webgpu/#timestamp-query), ["float32-filterable"](https://www.w3.org/TR/webgpu/#float32-filterable) and ["bgra8unorm-storage"](https://www.w3.org/TR/webgpu/#bgra8unorm-storage). Additionally, the [maxBufferSize](https://www.w3.org/TR/webgpu/#dom-supported-limits-maxbuffersize) limit is set to the maximum value supported by your GPU.

**Syntax:**

```gml
requestDevice([descriptor])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUDeviceDescriptor](#gpudevicedescriptor) | ✅ | Currently ignored by the function.

**Returns:** [GPUDevice](#gpudevice)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUAdapter/requestDevice>

### GPUBindGroup

A struct containing shader bindings, laid out based on a [GPUBindGroupLayout](#gpubindgrouplayout). Created with [GPUDevice.createBindGroup](#gpudevicecreatebindgroup).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBindGroup>

#### GPUBindGroup.label

A write-only property of struct [GPUBindGroup](#gpubindgroup), useful for identifying the bind group in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBindGroup/label>

### GPUBindGroupDescriptor

A struct used in [GPUDevice.createBindGroup](#gpudevicecreatebindgroup) to create a new [GPUBindGroup](#gpubindgroup).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBindGroup#descriptor>

### GPUBindGroupLayout

A struct that defines layout and usage of shader resources in [GPUBindGroup](#gpubindgroup)s. Created with [GPUDevice.createBindGroupLayout](#gpudevicecreatebindgrouplayout).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBindGroupLayout>

#### GPUBindGroupLayout.label

A write-only property of struct [GPUBindGroupLayout](#gpubindgrouplayout), useful for identifying the bind group layout in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBindGroupLayout/label>

### GPUBindGroupLayoutDescriptor

A struct used in [GPUDevice.createBindGroupLayout](#gpudevicecreatebindgrouplayout) to create a new [GPUBindGroupLayout](#gpubindgroup).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBindGroupLayout#descriptor>

### GPUBuffer

A struct containing a buffer. Created with [GPUDevice.createBuffer](#gpudevicecreatebuffer).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer>

#### GPUBuffer.destroy

A method of struct [GPUBuffer](#gpubuffer). Destroys the buffer. You should always use this function when the buffer is no longer needed to avoid memory leaks!

**Syntax:**

```gml
destroy()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer/destroy>

#### GPUBuffer.label

A write-only property of struct [GPUBuffer](#gpubuffer), useful for identifying the buffer in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer/label>

#### GPUBuffer.getMappedRange

A method of struct [GPUBuffer](#gpubuffer). Returns a [GPUMappedRange](#gpumappedrange) containing data of a `GPUBuffer` mapped with [GPUBuffer.mapAsync](#gpubuffermapasync), which is used to read/write data from/to the buffer.

**Syntax:**

```gml
getMappedRange([offset], [size])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
offset | `Real` | ✅ | An offset from the start of the buffer, in bytes. Defaults to 0.
size | `Real` | ✅ | The portion of the mapped buffer to retrieve a mapped range for, in bytes. Defaults to the whole size of the mapped portion of the buffer minus offset.

**Returns:** [GPUMappedRange](#gpumappedrange)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer/getMappedRange>

#### GPUBuffer.mapAsync

A method of struct [GPUBuffer](#gpubuffer). Maps a buffer to CPU memory for reading or writing data. Requires [GPUBufferUsage.MAP_READ](#gpubufferusage) or [GPUBufferUsage.MAP_WRITE](#gpubufferusage) usage.

**Syntax:**

```gml
mapAsync(mode, [callback])
mapAsync(mode, [offset], [size], [callback])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
mode | [GPUMapMode](#gpumapmode) | ❌ | Whether to map the buffer for reading or writing.
offset | `Real` | ✅ | The offset from the start of the buffer to map from, in bytes. Defaults to 0.
size | `Real` | ✅ | The portion of the buffer to map, in bytes. Defaults to the size of the whole buffer minus offset.
callback | `Function` | ✅ | A function that receives [GPUBufferMapAsyncStatus](#gpubuffermapasyncstatus) as the first argument and the buffer as the second argument.

**Returns:** N/A

**Example:**

The following example maps a buffer for writing, checks whether the mapping was successful and writes floats 1, 2, 3 into it, then unmaps the buffer, commiting the changes. Please note that the buffer must have been previously created with [GPUBufferUsage.MAP_WRITE](#gpubufferusage), otherwise it could not be mapped for writing.

```gml
buffer.mapAsync(GPUMapMode.WRITE, function (status, buffer) {
  if (status == GPUBufferMapAsyncStatus.SUCCESS) {
    var mappedRange = buffer.getMappedRange();
    mappedRange.set([1, 2, 3]);
    buffer.unmap();
  }
});
```

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer/mapAsync>

#### GPUBuffer.mapState

A read-only property of struct [GPUBuffer](#gpubuffer). Represents the mapped state of the buffer.

**Type:** [GPUBufferMapState](#gpubuffermapstate)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer/mapState>

#### GPUBuffer.size

A read-only property of struct [GPUBuffer](#gpubuffer). Represents the size of the buffer in bytes.

**Type:** `Real`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer/size>

#### GPUBuffer.unmap

A method of struct [GPUBuffer](#gpubuffer). Unmaps a buffer mapped with [GPUBuffer.mapAsync], committing changes done (if any).

**Syntax:**

```gml
unmap()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer/unmap>

#### GPUBuffer.usage

A read-only property of struct [GPUBuffer](#gpubuffer). Represents the allowed usages of the buffer.

**Type:** [GPUBufferUsage](#gpubufferusage)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer/usage>

### GPUBufferDescriptor

A struct used in [GPUDevice.createBuffer](#gpudevicecreatebuffer) to create a new [GPUBuffer](#gpubuffer).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBuffer#descriptor>

### GPUColor

A struct or an array defining a color. Contained values are in range 0..1.

**Example:**

```gml
// Red color as a struct
var colorStruct = {
  r: 1,
  g: 0,
  b: 0,
  a: 1,
};

// Red color as an array
var colorArray = [1, 0, 0, 1];
```

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setBlendConstant#color>

### GPUCommandBuffer

A struct containing GPU commands, ready to be submitted with [GPUQueue.submit](#gpuqueuesubmit). Created with [GPUCommandEncoder.finish](#gpucommandencoderfinish).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandBuffer>

#### GPUCommandBuffer.label

A write-only property of struct [GPUCommandBuffer](#gpucommandbuffer), useful for identifying the command buffer in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandBuffer/label>

### GPUCommandBufferDescriptor

A struct used in [GPUCommandEncoder.finish](#gpucommandencoderfinish) to create a new [GPUCommandBuffer](#gpucommandbuffer).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/finish#descriptor>

### GPUCommandEncoder

A struct used to create GPU commands. Created with [GPUDevice.createCommandEncoder](#gpudevicecreatecommandencoder).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder>

#### GPUCommandEncoder.beginComputePass

A method of struct [GPUCommandEncoder](#gpucommandencoder). Begins a new compute pass and returns a [GPUComputePassEncoder](#gpucomputepassencoder), using which you can define commands executed during given compute pass.

**Syntax:**

```gml
beginComputePass([descriptor])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUComputePassDescriptor](#gpucomputepassdescriptor) | ✅ | The description of the compute pass to begin.

**Returns:** [GPUComputePassEncoder](#gpucomputepassencoder)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/beginComputePass>

#### GPUCommandEncoder.beginRenderPass

A method of struct [GPUCommandEncoder](#gpucommandencoder). Begins a new render pass and returns a [GPURenderPassEncoder](#gpurenderpassencoder), using which you can define the commands executed during given render pass.

**Syntax:**

```gml
beginRenderPass([descriptor])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPURenderPassDescriptor](#gpurenderpassdescriptor) | ✅ | The description of the render pass to begin.

**Returns:** [GPURenderPassEncoder](#gpurenderpassencoder)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/beginRenderPass>

#### GPUCommandEncoder.clearBuffer

A method of struct [GPUCommandEncoder](#gpucommandencoder). Clears a region of a [GPUBuffer](#gpubuffer) with zeros.

**Syntax:**

```gml
clearBuffer(buffer, [offset], [size])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
buffer | [GPUBuffer](#gpubuffer) | ❌ | The buffer to clear.
offset | `Real` | ✅ | An offset from the start of the buffer to start clearing from, in bytes. Defaults to 0.
size | `Real` | ✅ | The size of the buffer to clear, in bytes. Defaults to the size of the whole buffer minus offset.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/clearBuffer>

#### GPUCommandEncoder.copyBufferToBuffer

A method of struct [GPUCommandEncoder](#gpucommandencoder). Copies data from one [GPUBuffer](#gpubuffer) to another.

**Syntax:**

```gml
copyBufferToBuffer(source, sourceOffset, destination, destinationOffset, size)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
source | [GPUBuffer](#gpubuffer) | ❌ | The buffer to copy data from.
sourceOffset | `Real` | ❌ | An offset from the beginning of the source buffer to start copying data from, in bytes.
destination | [GPUBuffer](#gpubuffer) | ❌ | The buffer to copy data to.
destinationOffset | `Real` | ❌ | An offset from the beginning of the destination buffer to start copying data to, in bytes.
size | `Real` | ❌ | The size of the data to copy, in bytes.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyBufferToBuffer>

#### GPUCommandEncoder.copyBufferToTexture

A method of struct [GPUCommandEncoder](#gpucommandencoder). Copies data from a [GPUBuffer](#gpubuffer) to [GPUTexture](#gputexture).

**Syntax:**

```gml
copyBufferToTexture(source, destination, copySize)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
source | [GPUImageCopyBuffer](#gpuimagecopybuffer) | ❌ | A struct defining the source buffer and the layout of the data to be copied.
destination | [GPUImageCopyTexture](#gpuimagecopytexture) | ❌ | A struct defining the destination texture.
copySize | [GPUExtent3D](#gpuextent3d) | ❌ | A struct defining the width, height and depth/layer count of the data to be copied.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyBufferToTexture>

#### GPUCommandEncoder.copyTextureToBuffer

A method of struct [GPUCommandEncoder](#gpucommandencoder). Copies data from a [GPUTexture](#gputexture) to a [GPUBuffer](#gpubuffer).

**Syntax:**

```gml
copyTextureToBuffer(source, destination, copySize)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
source | [GPUImageCopyTexture](#gpuimagecopytexture) | ❌ | A struct defining the source texture.
destination | [GPUImageCopyBuffer](#gpuimagecopybuffer) | ❌ | A struct defining the destination buffer and the layout of the data to be copied.
copySize | [GPUExtent3D](#gpuextent3d) | ❌ | A struct defining the width, height and depth/layer count of the data to be copied.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyTextureToBuffer>

#### GPUCommandEncoder.copyTextureToTexture

A method of struct [GPUCommandEncoder](#gpucommandencoder). Copies contents of one [GPUTexture](#gputexture) to another.

**Syntax:**

```gml
copyTextureToTexture(source, destination, copySize)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
source | [GPUImageCopyTexture](#gpuimagecopytexture) | ❌ | A struct defining the source texture.
destination | [GPUImageCopyTexture](#gpuimagecopytexture) | ❌ | A struct defining the destination texture.
copySize | [GPUExtent3D](#gpuextent3d) | ❌ | A struct defining the width, height, and depth/layer count to be copied.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyTextureToTexture>

#### GPUCommandEncoder.finish

A method of struct [GPUCommandEncoder](#gpucommandencoder). Encodes created commands and returns a [GPUCommandBuffer](#gpucommandbuffer), which can be then executed using [GPUQueue.submit](#gpuqueuesubmit). After calling this method the command encoder cannot be used again!

**Syntax:**

```gml
finish([descriptor])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUCommandBufferDescriptor](#gpucommandbufferdescriptor) | ✅ | The description of the command buffer to be created.

**Returns:** [GPUCommandBuffer](#gpucommandbuffer)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/finish>

#### GPUCommandEncoder.insertDebugMarker

A method of struct [GPUCommandEncoder](#gpucommandencoder). Marks a specific point in a series of encoded commands with a label.

**Syntax:**

```gml
insertDebugMarker(markerLabel)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
markerLabel | `String` | ❌ | The label of the debug marker.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/insertDebugMarker>

#### GPUCommandEncoder.label

A write-only property of struct [GPUCommandEncoder](#gpucommandencoder), useful for identifying the command encoder in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/label>

#### GPUCommandEncoder.popDebugGroup

A method of struct [GPUCommandEncoder](#gpucommandencoder). Ends a debug group started with [GPUCommandEncoder.pushDebugGroup](#gpucommandencoderpushdebuggroup).

**Syntax:**

```gml
popDebugGroup()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/popDebugGroup>

#### GPUCommandEncoder.pushDebugGroup

A method of struct [GPUCommandEncoder](#gpurenderpassencoder). Starts a debug group, which then contains all subsequent commands until [GPUCommandEncoder.popDebugGroup](#gpucommandencoderpopdebuggroup) is called.

**Syntax:**

```gml
pushDebugGroup(groupLabel)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
groupLabel | `String` | ❌ | The label of the debug group.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/pushDebugGroup>

#### GPUCommandEncoder.resolveQuerySet

A method of struct [GPUCommandEncoder](#gpucommandencoder). Resolves a query set, copying the results into a specified [GPUBuffer](#gpubuffer).

**Syntax:**

```gml
resolveQuerySet(querySet, firstQuery, queryCount, destination, destinationOffset)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
querySet | [GPUQuerySet](#gpuqueryset) | ❌ | The query set to be resolved.
firstQuery | `Real` | ❌ | The index of the first query value to be copied to the buffer.
queryCount | `Real` | ❌ | Number of queries to be copied to the buffer.
destination | [GPUBuffer](#gpubuffer) | ❌ | The buffer to copy to query values to.
destinationOffset | `Real` | ❌ | The offset from the beginning of the buffer to start writing the query values to, in bytes.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/resolveQuerySet>

### GPUComputePassDescriptor

A struct used in [GPUCommandEncoder.beginComputePass](#gpucommandencoderbegincomputepass) to begin a new compute pass.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/beginComputePass#descriptor>

### GPUCommandEncoderDescriptor

A struct used in [GPUDevice.createCommandEncoder](#gpudevicecreatecommandencoder) to create a new [GPUCommandEncoder](#gpucommandencoder).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createCommandEncoder#descriptor>

### GPUComputePassEncoder

A struct that creates compute pass GPU commands. Created with [GPUCommandEncoder.beginComputePass](#gpucommandencoderbegincomputepass).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder>

#### GPUComputePassEncoder.dispatchWorkgroups

A method of struct [GPUComputePassEncoder](#gpucomputepassencoder). Dispatches a grid of workgroups to execute work defined by the current [GPUComputePipeline](#gpucomputepipeline) set by [GPUComputePassEncoder.setPipeline](#gpucomputepassencodersetpipeline).

**Syntax:**

```gml
dispatchWorkgroups(workgroupCountX, [workgroupCountY], [workgroupCountZ])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
workgroupCountX | `Real` | ❌ | The X dimension of the grid of workgroups to dispatch.
workgroupCountY | `Real` | ✅ | The Y dimension of the grid of workgroups to dispatch. Defaults to 1.
workgroupCountZ | `Real` | ✅ | The Z dimension of the grid of workgroups to dispatch. Defaults to 1.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder/dispatchWorkgroups>

#### GPUComputePassEncoder.dispatchWorkgroupsIndirect

A method of struct [GPUComputePassEncoder](#gpucomputepassencoder). Uses a [GPUBuffer](#gpubuffer) as a parameter to dispatch a grid of workgroups to execute work defined by the current [GPUComputePipeline](#gpucomputepipeline) set by [GPUComputePassEncoder.setPipeline](#gpucomputepassencodersetpipeline).

**Syntax:**

```gml
dispatchWorkgroupsIndirect(indirectBuffer, indirectOffset)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
indirectBuffer | [GPUBuffer](#gpubuffer) | ❌ | A buffer containing the X, Y, Z dimensions of the workgroups to dispatch (three 32-bit unsigned integers).
indirectOffset | `Real` | ❌ | An offset from the beginning of the buffer to a position where the workgroup dimensions start.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder/dispatchWorkgroupsIndirect>

#### GPUComputePassEncoder.end_

A method of struct [GPUComputePassEncoder](#gpucomputepassencoder). Equivalent to JavaScript's `end()` (which is a reserved keyword in GML, so an underscore is appended to avoid the name clash). Ends a compute pass.

**Syntax:**

```gml
end_()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder/end>

#### GPUComputePassEncoder.insertDebugMarker

A method of struct [GPUComputePassEncoder](#gpucomputepassencoder). Marks a specific point in a series of encoded compute pass commands with a label.

**Syntax:**

```gml
insertDebugMarker(markerLabel)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
markerLabel | `String` | ❌ | The label of the debug marker.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder/insertDebugMarker>

#### GPUComputePassEncoder.label

A write-only property of struct [GPUComputePassEncoder](#gpucomputepassencoder), useful for identifying the compute pass encoder in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder/label>

#### GPUComputePassEncoder.popDebugGroup

A method of struct [GPUComputePassEncoder](#gpucomputepassencoder). Ends a debug group started with [GPUComputePassEncoder.pushDebugGroup](#gpucomputepassencoderpushdebuggroup).

**Syntax:**

```gml
popDebugGroup()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder/popDebugGroup>

#### GPUComputePassEncoder.pushDebugGroup

A method of struct [GPUComputePassEncoder](#gpucomputepassencoder). Starts a debug group, which then contains all subsequent commands until [GPUComputePassEncoder.popDebugGroup](#gpucomputepassencoderpopdebuggroup) is called.

**Syntax:**

```gml
pushDebugGroup(groupLabel)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
groupLabel | `String` | ❌ | The label of the debug group.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder/pushDebugGroup>

#### GPUComputePassEncoder.setBindGroup

A method of struct [GPUComputePassEncoder](#gpucomputepassencoder). Defines the [GPUBindGroup](#gpubindgroup) used in subsequent commands at given index.

**Syntax:**

```gml
setBindGroup(index, bindGroup, [dynamicOffsets], [dynamicOffsetsStart], [dynamicOffsetsLength])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
index | `Real` | ❌ | The index to set the bind group at.
bindGroup | [GPUBindGroup](#gpubindgroup), `Undefined` | ❌ | The bind group to set. Use `undefined` to unset a previously set bind group for given index.
dynamicOffsets | `Array<Real>` | ✅ | An array of values specifying the offset, in bytes, for each entry in `bindGroup` with `hasDynamicOffset: true` set.
dynamicOffsetsStart | `Real` | ✅ | An offset, in array elements, into `dynamicOffsetsData`, where the dynamic offset data begins. Defaults to 0.
dynamicOffsetsLength | `Real` | ✅ | The number of dynamic offset values to be read from in `dynamicOffsetsData`. Defaults to the length of the array.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder/setBindGroup>

#### GPUComputePassEncoder.setPipeline

A method of struct [GPUComputePassEncoder](#gpucomputepassencoder). Defines the [GPUComputePipeline](#gpucomputepipeline) used in subsequent commands.

**Syntax:**

```gml
setPipeline(pipeline)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
pipeline | [GPUComputePipeline](#gpucomputepipeline) | ❌ | The compute pipeline to use in subsequent commands.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePassEncoder/setPipeline>

### GPUComputePipeline

A struct that defines a compute pipeline stage, used in [GPUComputePassEncoder.setPipeline](#gpucomputepassencodersetpipeline). Created with [GPUDevice.createComputePipeline](#gpudevicecreatecomputepipeline).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePipeline>

#### GPUComputePipeline.getBindGroupLayout

A method of struct [GPUComputePipeline](#gpucomputepipeline). Returns the pipeline's bind group layout at given index. Useful when given pipeline is created with `layout: "auto"`.

**Syntax:**

```gml
getBindGroupLayout(index)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
index | `Real` | ❌ | The index of the bind group layout.

**Returns:** [GPUBindGroupLayout](#gpubindgrouplayout)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePipeline/getBindGroupLayout>

#### GPUComputePipeline.label

A write-only property of struct [GPUComputePipeline](#gpucomputepipeline), useful for identifying the compute pipeline in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUComputePipeline/label>

### GPUComputePipelineDescriptor

A struct used in [GPUDevice.createComputePipeline](#gpudevicecreatecomputepipeline) to create a new [GPUComputePipeline](#gpucomputepipeline).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createComputePipeline#descriptor>

### GPUDevice

A struct used to retrieve a [GPUQueue](#gpuqueue), create [GPUCommandEncoder](#gpucommandencoder) and GPU resources like [GPUBuffer](#gpubuffer), [GPUTexture](#gputexture), [GPUSampler](#gpusampler) and many others. Retrieved with [GPUAdapter.requestDevice](#gpuadapterrequestdevice).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice>

#### GPUDevice.createBindGroup

A method of struct [GPUDevice](#gpudevice). Used to create a new [GPUBindGroup](#gpubindgroup), which is used to pass resources like [GPUBuffer](#gpubuffer), [GPUTextureView](#gputextureview) and [GPUSampler](#gpusampler) to shaders.

**Syntax:**

```gml
createBindGroup(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUBindGroupDescriptor](#gpubindgroupdescriptor) | ❌ | A description of the bind group to be created.

**Returns:** [GPUBindGroup](#gpubindgroup)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBindGroup>

#### GPUDevice.createBindGroupLayout

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPUBindGroupLayout](#gpubindgrouplayout), which defines storage and purpose of GPU resources like buffers, samplers and textures, and is required for creating new [GPUBindGroup](#gpubindgroup)s.

**Syntax:**

```gml
createBindGroupLayout(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUBindGroupLayoutDescriptor](#gpubindgrouplayoutdescriptor) | ❌ | A description of the bind group layout to be created.

**Returns:** [GPUBindGroupLayout](#gpubindgrouplayout)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBindGroupLayout>

#### GPUDevice.createBuffer

A method of struct [GPUDevice](#gpudevice). Used to create a new [GPUBuffer](#gpubuffer), which can be used to store vertex data, shader uniforms etc.

**Syntax:**

```gml
createBuffer(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUBufferDescriptor](#gpubufferdescriptor) | ❌ | A description of the buffer to be created.

**Returns:** [GPUBuffer](#gpubuffer)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBuffer>

#### GPUDevice.createCommandEncoder

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPUCommandEncoder](#gpucommandencoder), which is used to create [GPUCommandBuffer](#gpucommandbuffer)s that are submitted to the GPU via [GPUQueue.submit](#gpuqueuesubmit).

**Syntax:**

```gml
createCommandEncoder([descriptor])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUCommandEncoderDescriptor](#gpucommandencoderdescriptor) | ✅ | A description of the command encoder to be created.

**Returns:** [GPUCommandEncoder](#gpucommandencoder)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createCommandEncoder>

#### GPUDevice.createComputePipeline

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPUComputePipeline](#gpucomputepipeline), which defines a compute pipeline stage.

**Syntax:**

```gml
createComputePipeline(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUComputePipelineDescriptor](#gpucomputepipelinedescriptor) | ❌ | The description of the compute pipeline to be created.

**Returns:** [GPUComputePipeline](#gpucomputepipeline)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createComputePipeline>

#### GPUDevice.createPipelineLayout

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPUPipelineLayout](#gpupipelinelayout), which is a struct required for creating new pipelines. `GPUPipelineLayout` defines the [layout](#gpubindgrouplayout) that a [bind group](#gpubindgroup) must have to be compatible with given pipeline.

**Syntax:**

```gml
createPipelineLayout(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUPipelineLayoutDescriptor](#gpupipelinelayoutdescriptor) | ❌ | The description of the pipeline layout to be created.

**Returns:** [GPUPipelineLayout](#gpupipelinelayout)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createPipelineLayout>

#### GPUDevice.createQuerySet

A method of [GPUDevice](#gpudevice). Creates a new [GPUQuery](#gpuqueryset) that can be used to record results of queries on passes, such as occlusion or timestamp queries.

**Syntax:**

```gml
createQuerySet(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUQuerySetDescriptor](#gpuquerysetdescriptor) | ❌ | The description of the query set to be created.

**Returns:** [GPUQuerySet](#gpuqueryset)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createQuerySet>

#### GPUDevice.createRenderBundleEncoder

A method of [GPUDevice](#gpudevice). Creates a new [GPURenderBundleEncoder](#gpurenderbundleencoder), which is used to encoder render pass commands once into [GPURenderBundle](#gpurenderbundle)s, which can be then executed multiple times using [GPURenderPassEncoder.executeBundles](#gpurenderpassencoderexecutebundles).

**Syntax:**

```gml
createRenderBundleEncoder(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPURenderBundleEncoderDescriptor](#gpurenderbundleencoderdescriptor) | ❌ | The description of the render bundle encoder to be created.

**Returns:** [GPURenderBundleEncoder](#gpurenderbundleencoder)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createRenderBundleEncoder>

#### GPUDevice.createRenderPipeline

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPURenderPipeline](#gpurenderpipeline), which defines vertex and fragment stages of a render pass.

**Syntax:**

```gml
createRenderPipeline(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPURenderPipelineDescriptor](#gpurenderpipelinedescriptor) | ❌ | The description of the render pipeline to be created.

**Returns:** [GPURenderPipeline](#gpurenderpipeline)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createRenderPipeline>

#### GPUDevice.createSampler

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPUSampler](#gpusampler), which controls how shaders sample textures.

**Syntax:**

```gml
createSampler([descriptor])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUSamplerDescriptor](#gpusamplerdescriptor) | ✅ | The description of the sampler to be created.

**Returns:** [GPUSampler](#gpusampler)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createSampler>

#### GPUDevice.createShaderModule

A method of struct [GPUDevice](#gpudevice). Used to create a new [GPUShaderModule](#gpushadermodule) from a WGSL source code.

**Syntax:**

```gml
createShaderModule(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUShaderModuleDescriptor](#gpushadermoduledescriptor) | ✅ | The description of the shader module to be created.

**Returns:** [GPUShaderModule](#gpushadermodule)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createShaderModule>

#### GPUDevice.createTexture

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPUTexture](#gputexture).

**Syntax:**

```gml
createTexture(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUTextureDescriptor](#gputexturedescriptor) | ✅ | The description of the texture to be created.

**Returns:** [GPUTexture](#gputexture)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createTexture>

#### GPUDevice.queue

A static read-only property of struct [GPUDevice](#gpudevice) containing [GPUQueue](#gpuqueue), which can be used to issue commands to the GPU.

**Type:** [GPUQueue](#gpuqueue)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/queue>

### GPUDeviceDescriptor

Currently unused, as the [GPUAdapter.requestDevice](#gpuadapterrequestdevice) method always returns the [GPUDevice](#gpudevice) used internally by GameMaker.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUAdapter/requestDevice#descriptor>

### GPUExtent3D

A struct or an array containing width, height and depth/array layers. Used for example in [GPUCommandEncoder.copyTextureToTexture](#gpucommandencodercopytexturetotexture) for copying data from one [GPUTexture](#gputexture) to another.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyTextureToTexture#copysize>

### GPUImageCopyBuffer

A struct defining source or destination buffer in a texture copy operation.

**See also:** [GPUCommandEncoder.copyBufferToTexture](#gpucommandencodercopybuffertotexture), [GPUCommandEncoder.copyTextureToBuffer](#gpucommandencodercopytexturetobuffer)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyTextureToBuffer#destination>

### GPUImageCopyTexture

A struct defining source or destination texture in a copy operation.

**See also:** [GPUCommandEncoder.copyBufferToTexture](#gpucommandencodercopybuffertotexture), [GPUCommandEncoder.copyTextureToTexture](#gpucommandencodercopytexturetotexture)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyTextureToTexture#copy_texture_object_structure>

### GPUMappedRange

A struct **specific to GameMaker**, that currently serves as a replacement for JS's `ArrayBuffer` and `TypedArray`. Retrieved with [GPUBuffer.getMappedRange](#gpubuffergetmappedrange). Used to read/write data from/to mapped [GPUBuffer](#gpubuffer)s.

**See also:** [GPUBuffer.mapAsync](#gpubuffermapasync)

#### GPUMappedRange.at

A method of struct [GPUMappedRange](#gpumappedrange). Reads a 32-bit float at given index from a mapped range, retrieved with [GPUBuffer.getMappedRange](#gpubuffergetmappedrange).

**Syntax:**

```gml
at(index)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
index | `Real` | ❌ | The index to read a value at.

**Returns:** `Real`

#### GPUMappedRange.fromBuffer

A method of struct [GPUMappedRange](#gpumappedrange). Copies data from a buffer to the mapped range.

**Syntax:**

```gml
fromBuffer(buffer, bufferOffset, size, offset)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
buffer | `Id.Buffer` | ❌ | The buffer to copy data from.
bufferOffset | `Real` | ❌ | The offset from the beginning of the buffer to start copying data from, in bytes.
size | `Real` | ❌ | The size of the data to copy, in bytes.
offset | `Real` | ❌ | The offset from the beginning of the mapped range to start copying data to, in bytes.

**Returns:** N/A

#### GPUMappedRange.set

A method of struct [GPUMappedRange](#gpumappedrange). Writes an array of 32-bit floats into a mapped range, retrieved with [GPUBuffer.getMappedRange](#gpubuffergetmappedrange).

**Syntax:**

```gml
set(array, [targetOffset])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
array | `Array<Real>` | ❌ | Values to write into the mapped range.
targetOffset | `Real` | ✅ | Index within the mapped range to start writing the values at. Defaults to 0.

**Returns:** N/A

#### GPUMappedRange.toBuffer

A method of struct [GPUMappedRange](#gpumappedrange). Copies data from the mapped range to a buffer.

**Syntax:**

```gml
toBuffer(buffer, bufferOffset, size, offset)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
buffer | `Id.Buffer` | ❌ | The buffer to copy data to.
bufferOffset | `Real` | ❌ | The offset from the beginning of the buffer to start copying data to, in bytes.
size | `Real` | ❌ | The size of the data to copy, in bytes.
offset | `Real` | ❌ | The offset from the beginning of the mapped range to start copying data from, in bytes.

**Returns:** N/A

### GPUPipelineLayout

A struct that defines [GPUBindGroupLayout](#gpubindgrouplayout)s used by a pipeline. Created with [GPUDevice.createPipelineLayout](#gpudevicecreatepipelinelayout).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUPipelineLayout>

#### GPUPipelineLayout.label

A write-only property of struct [GPUPipelineLayout](#gpupipelinelayout), useful for identifying the pipeline layout in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUPipelineLayout/label>

### GPUPipelineLayoutDescriptor

A struct used in [GPUDevice.createPipelineLayout](#gpudevicecreatepipelinelayout) to create a new [GPUPipelineLayout](#gpupipelinelayout).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createPipelineLayout#descriptor>

### GPUQuerySet

A struct used to record results of queries on passes, such as occlusion or timestamp queries.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQuerySet>

#### GPUQuerySet.count

A read-only property of struct [GPUQuerySet](#gpuqueryset). Represents the number of queries managed by the query set.

**Type:** `Real`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQuerySet/count>

#### GPUQuerySet.destroy

A method of [GPUQuerySet](#gpuqueryset). Destroys the query set. You should always use this function when the query set is no longer needed to avoid memory leaks!

**Syntax:**

```gml
destroy()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQuerySet/destroy>

#### GPUQuerySet.label

A write-only property of struct [GPUQuerySet](#gpuqueryset), useful for identifying the query set in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQuerySet/label>

#### GPUQuerySet.type

A read-only property of struct [GPUQuerySet](#gpuqueryset). Represents the type of queries managed by the query set.

**Type:** [GPUQueryType](#gpuquerytype)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQuerySet/type>

### GPUQuerySetDescriptor

A struct used in [GPUDevice.createQuerySet](#gpudevicecreatequeryset) to create a new [GPUQuerySet](#gpuqueryset).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createQuerySet#descriptor>

### GPUQueue

A struct used to issue commands to the GPU. Retrieved with [GPUDevice.queue](#gpudevicequeue).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue>

#### GPUQueue.label

A write-only property of struct [GPUQueue](#gpuqueue), useful for identifying the queue in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue/label>

#### GPUQueue.onSubmittedWorkDone

A method of [GPUQueue](#gpuqueue). Executes given function when all work submitted to the GPU via this queue at the point the method is called has been processed.

**Syntax:**

```gml
onSubmittedWorkDone([callback])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
callback | `Function` | ✅ | The function to execute when the work has been processed.

**Example:**

The following example maps two buffers for writing and uses `onSubmittedWorkDone` to wait till they are both mapped, then retrieves their mapped ranges and unmaps the buffers in the end.

```gml
buffer1.mapAsync(GPUMapMode.WRITE);
buffer2.mapAsync(GPUMapMode.WRITE);
device.queue.onSubmittedWorkDone(function () {
  var mappedRange1 = buffer1.getMappedRange();
  var mappedRange2 = buffer2.getMappedRange();
  // Use mapped ranges here...
  mappedRange1.unmap();
  mappedRange2.unmap();
});
```

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue/onSubmittedWorkDone>

#### GPUQueue.submit

A method of struct [GPUQueue](#gpuqueue). Submits an array of [GPUCommandBuffer](#gpucommandbuffer)s to the GPU.

**Syntax:**

```gml
submit(commandBuffers)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
commandBuffers | `Array<`[GPUCommandBuffer](#gpucommandbuffer)`>` | ❌ | An array of `GPUCommandBuffer`s to submit.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue/submit>

#### GPUQueue.writeBuffer

A method of struct [GPUQueue](#gpuqueue). Writes data into a [GPUBuffer](#gpubuffer).

**Syntax:**

```gml
writeBuffer(buffer, bufferOffset, data, [dataOffset], [size])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
buffer | [GPUBuffer](#gpubuffer) | ❌ | The buffer to write the data into. Must be created with the `GPUBufferUsage.COPY_DST` usage!
bufferOffset | `Real` | ❌ | The offset, in bytes, to start writing into the buffer at.
data | `Array<Real>`, `Id.Buffer` | ❌ | An array of 32-bit floats or a buffer containing any of the supported data types.
dataOffset | `Real` | ✅ | An offset (in array elements or bytes, depending on whether `data` is an array or a buffer) to start reading the data from. Defaults to 0.
size | `Real` | ✅ | The size of the data to write (in array elements or bytes, depending on whether `data` is an array or a buffer). Defaults to the size of the array/buffer minus offset.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue/writeBuffer>

#### GPUQueue.writeTexture

A method of [GPUQueue](#gpuqueue). Writes data into a [GPUTexture](#gputexture).

**Syntax:**

```gml
writeTexture(destination, data, dataLayout, size)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
destination | [GPUImageCopyTexture](#gpuimagecopytexture) | ❌ | A struct defining the destination texture.
data | `Array<Real>`, `Id.Buffer` | ❌ | An array of 32-bit unsigned integers or a buffer containing any of the supported data types.
dataOffset | [GPUTextureDataLayout](#gputexturedatalayout) | ❌ | A struct defining the layout of given data.
size | [GPUExtent3D](#gpuextent3d) | ❌ | A struct defining the width, height and depth/layer count of the data to be copied.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue/writeTexture>

### GPURenderBundle

A struct containing encoded render pass commands, ready to be executed with [GPURenderPassEncoder.executeBundles](#gpurenderpassencoderexecutebundles). Created with [GPURenderBundleEncoder.finish](#gpurenderbundleencoderfinish).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundle>

#### GPURenderBundle.label

A write-only property of struct [GPURenderBundle](#gpurenderbundle), useful for identifying the render bundle in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundle/label>

### GPURenderBundleDescriptor

A struct used in [GPURenderBundleEncoder.finish](#gpurenderbundleencoderfinish) to create a new [GPURenderBundle](#gpurenderbundle).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/finish#descriptor>

### GPURenderBundleEncoder

A struct used to encode render pass commands once into [GPURenderBundle](#gpurenderbundle)s, which can be then executed multiple times using [GPURenderPassEncoder.executeBundles](#gpurenderpassencoderexecutebundles).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder>

#### GPURenderBundleEncoder.draw

A method of struct [GPURenderBundleEncoder](#gpurenderbundleencoder). Draws vertices from a vertex buffer previously set using [GPURenderBundleEncoder.setVertexBuffer](#gpurenderbundleencodersetvertexbuffer).

**Syntax:**

```gml
draw(vertexCount, [instanceCount], [firstVertex], [firstInstance])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
vertexCount | `Real` | ❌ | The number of vertices to draw.
instanceCount | `Real` | ✅ | The number of instances to draw. Defaults to 1.
firstVertex | `Real` | ✅ | The index of the first vertex to start drawing form. Defaults to 0.
firstInstance | `Real` | ✅ | The number of the first instance to draw. Defaults to 0.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/draw>

#### GPURenderBundleEncoder.drawIndexed

A method of struct [GPURenderPassEnGPURenderBundleEncodercoder](#gpurenderbundleencoder). Draws an indexed primitive using the index and the vertex buffers specified with [GPURenderBundleEncoder.setIndexBuffer](#gpurenderbundleencodersetindexbuffer) and [GPURenderBundleEncoder.setVertexBuffer](#gpurenderbundleencodersetvertexbuffer).

**Syntax:**

```gml
drawIndexed(indexCount, [instanceCount], [firstIndex], [baseVertex], [firstInstance])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
indexCount | `Real` | ❌ | Number of indices to draw.
instanceCount | `Real` | ✅ | Number of instances to draw. Defaults to 1.
firstIndex | `Real` | ✅ | The offset into the index buffer, in indices, to start drawing from. Defaults to 0.
baseVertex | `Real` | ✅ | A number added to each index value before indexing into the vertex buffer. Defaults to 0.
firstInstance | `Real` | ✅ | The number of the first instance to draw. Defaults to 0.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/drawIndexed>

#### GPURenderBundleEncoder.drawIndexedIndirect

A method of struct [GPURenderBundleEncoder](#gpurenderbundleencoder). Draws an indexed primitive using the index and the vertex buffers specified with [GPURenderBundleEncoder.setIndexBuffer](#gpurenderbundleencodersetindexbuffer) and [GPURenderBundleEncoder.setVertexBuffer](#gpurenderbundleencodersetvertexbuffer), parametrized by contents of a [GPUBuffer](#gpubuffer).

**Syntax:**

```gml
drawIndexedIndirect(indirectBuffer, indirectOffset)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
indirectBuffer | [GPUBuffer](#gpubuffer) | ❌ | A buffer containing the `indexCount`, `instanceCount`, `firstInstance`, `baseVertex`, `firstInstance` arguments as 32-bit unsigned integers.
indirectOffset | `Real` | ❌ | An offset from the beginning of the buffer to a position where the arguments start.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/drawIndexedIndirect>

#### GPURenderBundleEncoder.drawIndirect

A method of struct [GPURenderBundleEncoder](#gpurenderbundleencoder). Draws vertices from a vertex buffer previously set using [GPURenderBundleEncoder.setVertexBuffer](#gpurenderbundleencodersetvertexbuffer), parametrized by contents of a [GPUBuffer](#gpubuffer).

**Syntax:**

```gml
drawIndirect(indirectBuffer, indirectOffset)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
indirectBuffer | [GPUBuffer](#gpubuffer) | ❌ | A buffer containing the `vertexCount`, `instanceCount`, `firstVertex`, `firstInstance` arguments as 32-bit unsigned integers.
indirectOffset | `Real` | ❌ | An offset from the beginning of the buffer to a position where the arguments start.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/drawIndirect>

#### GPURenderBundleEncoder.finish

A method of struct [GPURenderBundleEncoder](#gpurenderbundleencoder). Encodes previously issued commands into a [GPURenderBundle](#gpurenderbundle), which can be then executed multiple times using [GPURenderPassEncoder.executeBundles](#gpurenderpassencoderexecutebundles).

**Syntax:**

```gml
finish(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPURenderBundleDescriptor](#gpurenderbundledescriptor) | ❌ | A description of the render bundle to be created.

**Returns:** [GPURenderBundle](#gpurenderbundle)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/finish>

#### GPURenderBundleEncoder.insertDebugMarker

A method of struct [GPURenderBundleEncoder](#gpurenderbundleencoder). Marks a specific point in a series of encoded render bundle commands with a label.

**Syntax:**

```gml
insertDebugMarker(markerLabel)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
markerLabel | `String` | ❌ | The label of the debug marker.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/insertDebugMarker>

#### GPURenderBundleEncoder.label

A write-only property of struct [GPURenderBundleEncoder](#gpurenderbundleencoder), useful for identifying the render bundle encoder in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/label>

#### GPURenderBundleEncoder.popDebugGroup

A method of struct [GPURenderBundleEncoder](#gpurenderbundleencoder). Ends a debug group started with [GPURenderBundleEncoder.pushDebugGroup](#gpurenderbundleencoderpushdebuggroup).

**Syntax:**

```gml
popDebugGroup()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/popDebugGroup>

#### GPURenderBundleEncoder.pushDebugGroup

A method of struct [GPURenderBundleEncoder](#gpurenderbundleencoder). Starts a debug group, which then contains all subsequent commands until [GPURenderBundleEncoder.popDebugGroup](#gpurenderbundleencoderpopdebuggroup) is called.

**Syntax:**

```gml
pushDebugGroup(groupLabel)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
groupLabel | `String` | ❌ | The label of the debug group.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/pushDebugGroup>

#### GPURenderBundleEncoder.setBindGroup

A method of struct [GPURenderBundleEncoder](#gpurenderbundleencoder). Defines the [GPUBindGroup](#gpubindgroup) used in subsequent commands at given index.

**Syntax:**

```gml
setBindGroup(index, bindGroup, [dynamicOffsets], [dynamicOffsetsStart], [dynamicOffsetsLength])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
index | `Real` | ❌ | The index to set the bind group at.
bindGroup | [GPUBindGroup](#gpubindgroup), `Undefined` | ❌ | The bind group to set. Use `undefined` to unset a previously set bind group for given index.
dynamicOffsets | `Array<Real>` | ✅ | An array of values specifying the offset, in bytes, for each entry in `bindGroup` with `hasDynamicOffset: true` set.
dynamicOffsetsStart | `Real` | ✅ | An offset, in array elements, into `dynamicOffsetsData`, where the dynamic offset data begins. Defaults to 0.
dynamicOffsetsLength | `Real` | ✅ | The number of dynamic offset values to be read from in `dynamicOffsetsData`. Defaults to the length of the array.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/setBindGroup>

#### GPURenderBundleEncoder.setIndexBuffer

A method of [GPURenderBundleEncoder](#gpurenderbundleencoder). Sets or unsets the current [GPUBuffer](#gpubuffer) containing index data used in subsequent indexed draw commands.

**Syntax:**

```gml
setIndexBuffer(buffer, indexFormat, [offset], [size])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
buffer | [GPUBuffer](#gpubuffer), `Undefined` | ❌ | The new index buffer or `undefined` to unset the previously set index buffer.
indexFormat | [GPUIndexFormat](#gpuindexformat) | ❌ | The format of the index data contained in given buffer.
offset | `Real` | ✅ | An offset, in bytes, to where the index buffer begins. Defaults to 0.
size | `Real` | ✅ | The size of the index buffer, in bytes. Defaults to the whole size of the buffer minus offset.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/setIndexBuffer>

#### GPURenderBundleEncoder.setPipeline

A method of struct [GPURenderBundleEncoder](#gpurenderbundleencoder). Defines the [GPURenderPipeline](#gpurenderpipeline) used in subsequent commands.

**Syntax:**

```gml
setPipeline(pipeline)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
pipeline | [GPURenderPipeline](#gpurenderpipeline) | ❌ | The render pipeline to use in subsequent commands.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/setPipeline>

#### GPURenderBundleEncoder.setVertexBuffer

A method of [GPURenderBundleEncoder](#gpurenderbundleencoder). Sets or unsets the current [GPUBuffer](#gpubuffer) for given slot containing vertex data used in subsequent draw commands.

**Syntax:**

```gml
setVertexBuffer(slot, buffer, [offset], [size])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
slot | `Real` | ❌ | The number of the slot to set the vertex buffer for.
buffer | [GPUBuffer](#gpubuffer), `Undefined` | ❌ | A vertex buffer to set for given slot. Use `undefined` to unset a previously set buffer for given slot.
offset | `Real` | ✅ | An offset, in bytes, to where the vertex buffer begins. Defaults to 0.
size | `Real` | ✅ | The size of the vertex buffer, in bytes. Defaults to the whole size of the buffer minus offset.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderBundleEncoder/setVertexBuffer>

### GPURenderBundleEncoderDescriptor

A struct used in [GPUDevice.createRenderBundleEncoder](#gpudevicecreaterenderbundleencoder) to create a new [GPURenderBundleEncoder](#gpurenderbundleencoder).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createRenderBundleEncoder#descriptor>

### GPURenderPassDescriptor

A struct used in [GPUCommandEncoder.beginRenderPass](#gpucommandencoderbeginrenderpass) to begin a new render pass.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/beginRenderPass#descriptor>

### GPURenderPassEncoder

A struct that creates render pass GPU commands. Created with [GPUCommandEncoder.beginRenderPass](#gpucommandencoderbeginrenderpass).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder>

#### GPURenderPassEncoder.beginOcclusionQuery

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Begins an occlusion query at given index of a [GPUQuerySet](#gpuqueryset) specified in a [GPURenderPassDescriptor](#gpurenderpassdescriptor) that was passed to [GPUCommandEncoder.beginRenderPass](#gpucommandencoderbeginrenderpass).

**Syntax:**

```gml
beginOcclusionQuery(queryIndex)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
queryIndex | `Real` | ❌ | The index in the `GPUQuerySet` to begin the occlusion query at.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/beginOcclusionQuery>

#### GPURenderPassEncoder.draw

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Draws vertices from a vertex buffer previously set using [GPURenderPassEncoder.setVertexBuffer](#gpurenderpassencodersetvertexbuffer).

**Syntax:**

```gml
draw(vertexCount, [instanceCount], [firstVertex], [firstInstance])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
vertexCount | `Real` | ❌ | The number of vertices to draw.
instanceCount | `Real` | ✅ | The number of instances to draw. Defaults to 1.
firstVertex | `Real` | ✅ | The index of the first vertex to start drawing form. Defaults to 0.
firstInstance | `Real` | ✅ | The number of the first instance to draw. Defaults to 0.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/draw>

#### GPURenderPassEncoder.drawIndexed

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Draws an indexed primitive using the index and the vertex buffers specified with [GPURenderPassEncoder.setIndexBuffer](#gpurenderpassencodersetindexbuffer) and [GPURenderPassEncoder.setVertexBuffer](#gpurenderpassencodersetvertexbuffer).

**Syntax:**

```gml
drawIndexed(indexCount, [instanceCount], [firstIndex], [baseVertex], [firstInstance])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
indexCount | `Real` | ❌ | Number of indices to draw.
instanceCount | `Real` | ✅ | Number of instances to draw. Defaults to 1.
firstIndex | `Real` | ✅ | The offset into the index buffer, in indices, to start drawing from. Defaults to 0.
baseVertex | `Real` | ✅ | A number added to each index value before indexing into the vertex buffer. Defaults to 0.
firstInstance | `Real` | ✅ | The number of the first instance to draw. Defaults to 0.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/drawIndexed>

#### GPURenderPassEncoder.drawIndexedIndirect

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Draws an indexed primitive using the index and the vertex buffers specified with [GPURenderPassEncoder.setIndexBuffer](#gpurenderpassencodersetindexbuffer) and [GPURenderPassEncoder.setVertexBuffer](#gpurenderpassencodersetvertexbuffer), parametrized by contents of a [GPUBuffer](#gpubuffer).

**Syntax:**

```gml
drawIndexedIndirect(indirectBuffer, indirectOffset)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
indirectBuffer | [GPUBuffer](#gpubuffer) | ❌ | A buffer containing the `indexCount`, `instanceCount`, `firstInstance`, `baseVertex`, `firstInstance` arguments as 32-bit unsigned integers.
indirectOffset | `Real` | ❌ | An offset from the beginning of the buffer to a position where the arguments start.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/drawIndexedIndirect>

#### GPURenderPassEncoder.drawIndirect

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Draws vertices from a vertex buffer previously set using [GPURenderPassEncoder.setVertexBuffer](#gpurenderpassencodersetvertexbuffer), parametrized by contents of a [GPUBuffer](#gpubuffer).

**Syntax:**

```gml
drawIndirect(indirectBuffer, indirectOffset)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
indirectBuffer | [GPUBuffer](#gpubuffer) | ❌ | A buffer containing the `vertexCount`, `instanceCount`, `firstVertex`, `firstInstance` arguments as 32-bit unsigned integers.
indirectOffset | `Real` | ❌ | An offset from the beginning of the buffer to a position where the arguments start.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/drawIndirect>

#### GPURenderPassEncoder.end_

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Equivalent to JavaScript's `end()` (which is a reserved keyword in GML, so an underscore is appended to avoid the name clash). Ends a render pass.

**Syntax:**

```gml
end_()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/end>

#### GPURenderPassEncoder.endOcclusionQuery

A method of [GPURenderPassEncoder](#gpurenderpassencoder). Ends an occlusion query previously started with [GPURenderPassEncoder.beginOcclusionQuery](#gpurenderpassencoderbeginocclusionquery).

**Syntax:**

```gml
endOcclusionQuery()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/endOcclusionQuery>

#### GPURenderPassEncoder.executeBundles

A method of [GPURenderPassEncoder](#gpurenderpassencoder). Executes [GPURenderBundle](#gpurenderbundle)s previously created with [GPURenderBundleEncoder.finish](#gpurenderbundleencoderfinish) as part of this render pass.

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
bundles | `Array<`[GPURenderBundle](#gpurenderbundle)`>` | ❌ | Render bundles to execute.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/executeBundles>

#### GPURenderPassEncoder.insertDebugMarker

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Marks a specific point in a series of encoded render pass commands with a label.

**Syntax:**

```gml
insertDebugMarker(markerLabel)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
markerLabel | `String` | ❌ | The label of the debug marker.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/insertDebugMarker>

#### GPURenderPassEncoder.label

A write-only property of struct [GPURenderPassEncoder](#gpurenderpassencoder), useful for identifying the render pass encoder in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/label>

#### GPURenderPassEncoder.popDebugGroup

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Ends a debug group started with [GPURenderPassEncoder.pushDebugGroup](#gpurenderpassencoderpushdebuggroup).

**Syntax:**

```gml
popDebugGroup()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/popDebugGroup>

#### GPURenderPassEncoder.pushDebugGroup

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Starts a debug group, which then contains all subsequent commands until [GPURenderPassEncoder.popDebugGroup](#gpurenderpassencoderpopdebuggroup) is called.

**Syntax:**

```gml
pushDebugGroup(groupLabel)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
groupLabel | `String` | ❌ | The label of the debug group.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/pushDebugGroup>

#### GPURenderPassEncoder.setBindGroup

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Defines the [GPUBindGroup](#gpubindgroup) used in subsequent commands at given index.

**Syntax:**

```gml
setBindGroup(index, bindGroup, [dynamicOffsets], [dynamicOffsetsStart], [dynamicOffsetsLength])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
index | `Real` | ❌ | The index to set the bind group at.
bindGroup | [GPUBindGroup](#gpubindgroup), `Undefined` | ❌ | The bind group to set. Use `undefined` to unset a previously set bind group for given index.
dynamicOffsets | `Array<Real>` | ✅ | An array of values specifying the offset, in bytes, for each entry in `bindGroup` with `hasDynamicOffset: true` set.
dynamicOffsetsStart | `Real` | ✅ | An offset, in array elements, into `dynamicOffsetsData`, where the dynamic offset data begins. Defaults to 0.
dynamicOffsetsLength | `Real` | ✅ | The number of dynamic offset values to be read from in `dynamicOffsetsData`. Defaults to the length of the array.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setBindGroup>

#### GPURenderPassEncoder.setBlendConstant

A method of [GPURenderPassEncoder](#gpurenderpassencoder). Sets the constant blend color and alpha used with [GPUBlendFactor.Constant](#gpublendfactor) and [GPUBlendFactor.OneMinusConstant](#gpublendfactor) blend factors, as set in the [GPURenderPipelineDescriptor](#gpurenderpipelinedescriptor) used in [GPUDevice.createRenderPipeline](#gpudevicecreaterenderpipeline).

**Syntax:**

```gml
setBlendConstant(color)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
color | [GPUColor](#gpucolor) | ❌ | The new color to use when blending.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setBlendConstant>

#### GPURenderPassEncoder.setIndexBuffer

A method of [GPURenderPassEncoder](#gpurenderpassencoder). Sets or unsets the current [GPUBuffer](#gpubuffer) containing index data used in subsequent indexed draw commands.

**Syntax:**

```gml
setIndexBuffer(buffer, indexFormat, [offset], [size])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
buffer | [GPUBuffer](#gpubuffer), `Undefined` | ❌ | The new index buffer or `undefined` to unset the previously set index buffer.
indexFormat | [GPUIndexFormat](#gpuindexformat) | ❌ | The format of the index data contained in given buffer.
offset | `Real` | ✅ | An offset, in bytes, to where the index buffer begins. Defaults to 0.
size | `Real` | ✅ | The size of the index buffer, in bytes. Defaults to the whole size of the buffer minus offset.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setIndexBuffer>

#### GPURenderPassEncoder.setPipeline

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Defines the [GPURenderPipeline](#gpurenderpipeline) used in subsequent commands.

**Syntax:**

```gml
setPipeline(pipeline)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
pipeline | [GPURenderPipeline](#gpurenderpipeline) | ❌ | The render pipeline to use in subsequent commands.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setPipeline>

#### GPURenderPassEncoder.setScissorRect

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Sets the scissor rectangle used during the rasterization stage.

**Syntax:**

```gml
setScissorRect(x, y, width, height)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
x | `Real` | ❌ | The minimum X coordinate of the scissor rectangle, in pixels.
y | `Real` | ❌ | The minimum Y coordinate of the scissor rectangle, in pixels.
width | `Real` | ❌ | The width of the scissor rectangle, in pixels.
height | `Real` | ❌ | The height of the scissor rectangle, in pixels.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setScissorRect>

#### GPURenderPassEncoder.setStencilReference

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Sets the stencil reference value used during stencil tests.

**Syntax:**

```gml
setStencilReference(reference)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
reference | `Real` | ❌ | The new stencil reference value.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setStencilReference>

#### GPURenderPassEncoder.setVertexBuffer

A method of [GPURenderPassEncoder](#gpurenderpassencoder). Sets or unsets the current [GPUBuffer](#gpubuffer) for given slot containing vertex data used in subsequent draw commands.

**Syntax:**

```gml
setVertexBuffer(slot, buffer, [offset], [size])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
slot | `Real` | ❌ | The number of the slot to set the vertex buffer for.
buffer | [GPUBuffer](#gpubuffer), `Undefined` | ❌ | A vertex buffer to set for given slot. Use `undefined` to unset a previously set buffer for given slot.
offset | `Real` | ✅ | An offset, in bytes, to where the vertex buffer begins. Defaults to 0.
size | `Real` | ✅ | The size of the vertex buffer, in bytes. Defaults to the whole size of the buffer minus offset.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setVertexBuffer>

#### GPURenderPassEncoder.setViewport

A method of [GPURenderPassEncoder](#gpurenderpassencoder). Sets the viewport rectangle used during rasterization stage.

**Syntax:**

```gml
setViewport(x, y, width, height, minDepth, maxDepth)
```

Name | Type | Optional | Description
---- | ---- | -------- | -----------
x | `Real` | ❌ | The minimum X coordinate of the viewport rectangle, in pixels.
y | `Real` | ❌ | The minimum Y coordinate of the viewport rectangle, in pixels.
width | `Real` | ❌ | The width of the viewport rectangle, in pixels.
height | `Real` | ❌ | The height of the viewport rectangle, in pixels.
minDepth | `Real` | ❌ | The minimum depth value of the viewport.
maxDepth | `Real` | ❌ | The maximum depth value of the viewport.

**Params:**

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setViewport>

### GPURenderPipeline

A struct that defines vertex and fragment stages of a render pipeline, used in [GPURenderPassEncoder.setPipeline](#gpurenderpassencodersetpipeline). Created with [GPUDevice.createRenderPipeline](#gpudevicecreaterenderpipeline).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPipeline>

#### GPURenderPipeline.getBindGroupLayout

A method of struct [GPURenderPipeline](#gpurenderpipeline). Returns the pipeline's bind group layout at given index. Useful when given pipeline is created with `layout: "auto"`.

**Syntax:**

```gml
getBindGroupLayout(index)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
index | `Real` | ❌ | The index of the bind group layout.

**Returns:** [GPUBindGroupLayout](#gpubindgrouplayout)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPipeline/getBindGroupLayout>

#### GPURenderPipeline.label

A write-only property of struct [GPURenderPipeline](#gpurenderpipeline), useful for identifying the render pipeline in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPipeline/label>

### GPURenderPipelineDescriptor

A struct used in [GPUDevice.createRenderPipeline](#gpudevicecreaterenderpipeline) to create a new [GPURenderPipeline](#gpurenderpipeline).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createRenderPipeline#descriptor>

### GPURequestAdapterOptions

Currently unused, as the [GPU.requestAdapter](#gpurequestadapter) method always returns the [GPUAdapter](#gpuadapter) used internally by GameMaker.

<https://developer.mozilla.org/en-US/docs/Web/API/GPU/requestAdapter#options>

### GPUSampler

A struct that defines how are textures sampled in a shader. Created with [GPUDevice.createSampler](#gpudevicecreatesampler). Used in [GPUBindGroup](#gpubindgroup)s.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUSampler>

#### GPUSampler.label

A write-only property of struct [GPUSampler](#gpusampler), useful for identifying the sampler in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUSampler/label>

### GPUSamplerDescriptor

A struct used in [GPUDevice.createSampler](#gpudevicecreatesampler) to create a new [GPUSampler](#gpusampler).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createSampler#descriptor>

### GPUShaderModule

A struct that represents a compiled WGSL code. Created with [GPUDevice.createShaderModule](#gpudevicecreateshadermodule). Used in [GPUDevice.createRenderPipeline](#gpudevicecreaterenderpipeline).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUShaderModule>

#### GPUShaderModule.getCompilationInfo

A method of struct [GPUShaderModule](#gpushadermodule). Retrieves compilation info from the `GPUShaderModule`.

**Syntax:**

```gml
getCompilationInfo([callback])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
callback | `Function` | ✅ | A function that receives a struct containing the compilation info as the first argument.

**Returns:** N/A

**Compilation info struct:**

Key | Type | Description
--- | ---- | -----------
`messages` | `Array<Struct>` | An array of compilation message structs.

**Compilation message struct:**

Key | Type | Description
--- | ---- | -----------
`length` | `Real` | The length of the substring the message corresponds to.
`lineNum` | `Real` | The line number in the shader code that the message corresponds to.
`linePos` | `Real` | The position in the shader code line that the message corresponds to.
`message` | `String` | The compilation message string.
`offset` | `Real` | An offset from the start of the shader code to the position that the message corresponds to.
`type` | [GPUCompilationMessageType](#gpucompilationmessagetype) | The type of the message.

**Example:**

The following example compiles a shader, retrieves its compilation info messages and prints them out to the console.

```gml
shader = device.createShaderModule({
  code: shaderCode,
});

shader.getCompilationInfo(function (compilationInfo) {
  var messages = compilationInfo.messages;
  for (var i = 0; i < array_length(messages); ++i) {
    var m = messages[i];
    show_debug_message($"Found {m.type} on line {m.lineNum} at position {m.linePos}: \"{m.message}\"");
  }
});
```

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUShaderModule/getCompilationInfo>

#### GPUShaderModule.label

A write-only property of struct [GPUShaderModule](#gpushadermodule), useful for identifying the shader module in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUShaderModule/label>

### GPUShaderModuleDescriptor

A struct used in [GPUDevice.createShaderModule](#gpudevicecreateshadermodule) to create a new [GPUShaderModule](#gpushadermodule).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createShaderModule#descriptor>

### GPUTexture

A struct that represents a texture. Created with [GPUDevice.createTexture](#gpudevicecreatetexture).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture>

#### GPUTexture.createView

A method of [GPUTexture](#gputexture). Creates and returns a new [GPUTextureView](#gputextureview) for the texture, which can be used for example for sampling of the texture in a shader.

**Syntax:**

```gml
createView([descriptor])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
descriptor | [GPUTextureViewDescriptor](#gputextureviewdescriptor) | ✅ | The description of the texture view to be created. Can be ommited to create a texture view with default properties.

**Returns:** [GPUTextureView](#gputextureview)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/createView>

#### GPUTexture.depthOrArrayLayers

A read-only property of struct [GPUTexture](#gputexture). Represents the depth or layer count of the texture.

**Type:** `Real`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/depthOrArrayLayers>

#### GPUTexture.destroy

A method of struct [GPUTexture](#gputexture). Destroys the texture. You should always use this function when the texture is no longer needed to avoid memory leaks!

**Syntax:**

```gml
destroy()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/destroy>

#### GPUTexture.dimension

A read-only property of struct [GPUTexture](#gputexture).

**Type:** [GPUTextureDimension](#gputexturedimension)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/dimension>

#### GPUTexture.format

A read-only property of struct [GPUTexture](#gputexture). Represents the format of the texture.

**Type:** [GPUTextureFormat](#gputextureformat)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/format>

#### GPUTexture.height

A read-only property of struct [GPUTexture](#gputexture). Represents the height of the texture.

**Type:** `Real`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/height>

#### GPUTexture.label

A write-only property of struct [GPUTexture](#gputexture), useful for identifying the texture in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/label>

#### GPUTexture.mipLevelCount

A read-only property of struct [GPUTexture](#gputexture). Represents the number of mip levels of the texture.

**Type:** `Real`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/mipLevelCount>

#### GPUTexture.sampleCount

A read-only property of struct [GPUTexture](#gputexture). Represents the sample count of the texture.

**Type:** `Real`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/sampleCount>

#### GPUTexture.usage

A read-only property of struct [GPUTexture](#gputexture). Represents the allowed usages of the texture.

**Type:** [GPUTextureUsage](#gputextureusage)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/usage>

#### GPUTexture.width

A read-only property of struct [GPUTexture](#gputexture). Represents the width of the texture.

**Type:** `Real`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/width>

### GPUTextureDataLayout

A struct that describes how texture data is stored in a buffer. Used when copying data into a [GPUTexture](#gputexture).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue/writeTexture#datalayout>

### GPUTextureDescriptor

A struct used in [GPUDevice.createTexture](#gpudevicecreatetexture) to create a new [GPUTexture](#gputexture).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createTexture#descriptor>

### GPUTextureView

A struct that represents a view into a subset of a [GPUTexture](#gputexture). Created with [GPUTexture.createView](#gputexturecreateview). Used for example in [GPUBindGroup](#gpubindgroup)s for sampling of textures in shaders.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTextureView>

#### GPUTextureView.label

A write-only property of struct [GPUTextureView](#gputextureview), useful for identifying the texture view in error messages or debugging tools.

**Type:** `String`

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTextureView/label>

### GPUTextureViewDescriptor

A struct used in [GPUTexture.createView](#gputexturecreateview) to create a new [GPUTextureView](#gputextureview).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/createView#descriptor>

## Enums

### GPUAddressMode

**Members:**

Name | Value
---- | -----
ClampToEdge | `"clamp-to-edge"`
Repeat | `"repeat"`
MirrorRepeat | `"mirror-repeat"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuaddressmode>

### GPUAutoLayoutMode

**Members:**

Name | Value
---- | -----
Auto | `"auto"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuautolayoutmode>

### GPUBlendFactor

**Members:**

Name | Value
---- | -----
Zero | `"zero"`
One | `"one"`
Src | `"src"`
OneMinusSrc | `"one-minus-src"`
SrcAlpha | `"src-alpha"`
OneMinusSrcAlpha | `"one-minus-src-alpha"`
Dst | `"dst"`
OneMinusDst | `"one-minus-dst"`
DstAlpha | `"dst-alpha"`
OneMinusDstAlpha | `"one-minus-dst-alpha"`
SrcAlphaSaturated | `"src-alpha-saturated"`
Constant | `"constant"`
OneMinusConstant | `"one-minus-constant"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpublendfactor>

### GPUBlendOperation

**Members:**

Name | Value
---- | -----
Add | `"add"`
Subtract | `"subtract"`
ReverseSubtract | `"reverse-subtract"`
Min | `"min"`
Max | `"max"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpublendoperation>

### GPUBufferBindingType

**Members:**

Name | Value
---- | -----
Uniform | `"uniform"`
Storage | `"storage"`
ReadOnlyStorage | `"read-only-storage"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpubufferbindingtype>

### GPUBufferMapAsyncStatus

An enumeration **specific to GameMaker** used in callback of [GPUBuffer.mapAsync](#gpubuffermapasync) to tell whether mapping of given buffer was successfull or not.

**Members:**

Name | Value
---- | -----
SUCCESS | `0x00000001`
INSTANCE_DROPPED | `0x00000002`
VALIDATION_ERROR | `0x00000003`
UNKNOWN | `0x00000004`
DEVICE_LOST | `0x00000005`
DESTROYED_BEFORE_CALLBACK | `0x00000006`
UNMAPPED_BEFORE_CALLBACK | `0x00000007`
MAPPING_ALREADY_PENDING | `0x00000008`
OFFSET_OUT_OF_RANGE | `0x00000009`
SIZE_OUT_OF_RANGE | `0x0000000A`

### GPUBufferMapState

**Members:**

Name | Value
---- | -----
Unmapped | `"unmapped"`
Pending | `"pending"`
Mapped | `"mapped"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpubuffermapstate>

### GPUBufferUsage

**Members:**

Name | Value
---- | -----
MAP_READ | `0x0001`
MAP_WRITE | `0x0002`
COPY_SRC | `0x0004`
COPY_DST | `0x0008`
INDEX | `0x0010`
VERTEX | `0x0020`
UNIFORM | `0x0040`
STORAGE | `0x0080`
INDIRECT | `0x0100`
QUERY_RESOLVE | `0x0200`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gpubufferusage>

### GPUCanvasAlphaMode

**Members:**

Name | Value
---- | -----
Opaque | `"opaque"`
Premultiplied | `"premultiplied"`

**Links:** <https://gpuweb.github.io/gpuweb/#gpucanvasalphamode>

### GPUColorWrite

**Members:**

Name | Value
---- | -----
RED | `0x1`
GREEN | `0x2`
BLUE | `0x4`
ALPHA | `0x8`
ALL | `0xF`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gpucolorwrite>

### GPUCompareFunction

**Members:**

Name | Value
---- | -----
Never | `"never"`
Less | `"less"`
Equal | `"equal"`
LessEqual | `"less-equal"`
Greater | `"greater"`
NotEqual | `"not-equal"`
GreaterEqual | `"greater-equal"`
Always | `"always"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpucomparefunction>

### GPUCompilationMessageType

**Members:**

Name | Value
---- | -----
Error | `"error"`
Warning | `"warning"`
Info | `"info"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpucompilationmessagetype>

### GPUCullMode

**Members:**

Name | Value
---- | -----
None | `"none"`
Front | `"front"`
Back | `"back"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpucullmode>

### GPUDeviceLostReason

**Members:**

Name | Value
---- | -----
Unknown | `"unknown"`
Destroyed | `"destroyed"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpudevicelostreason>

### GPUErrorFilter

**Members:**

Name | Value
---- | -----
Validation | `"validation"`
OutOfMemory | `"out-of-memory"`
Internal | `"internal"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuerrorfilter>

### GPUFeatureName

**Members:**

Name | Value
---- | -----
DepthClipControl | `"depth-clip-control"`
Depth32floatStencil8 | `"depth32float-stencil8"`
TextureCompressionBc | `"texture-compression-bc"`
TextureCompressionEtc2 | `"texture-compression-etc2"`
TextureCompressionAstc | `"texture-compression-astc"`
TimestampQuery | `"timestamp-query"`
IndirectFirstInstance | `"indirect-first-instance"`
ShaderF16 | `"shader-f16"`
Rg11b10ufloatRenderable | `"rg11b10ufloat-renderable"`
Bgra8unormStorage | `"bgra8unorm-storage"`
Float32Filterable | `"float32-filterable"`

**Links:** <https://gpuweb.github.io/gpuweb/#gpufeaturename>

### GPUFilterMode

**Members:**

Name | Value
---- | -----
`Nearest`| `"nearest"`
`Linear`| `"linear"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpufiltermode>

### GPUFrontFace

**Members:**

Name | Value
---- | -----
`Ccw`| `"ccw"`
`Cw`| `"cw"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpufrontface>

### GPUIndexFormat

**Members:**

Name | Value
---- | -----
Uint16 | `"uint16"`
Uint32 | `"uint32"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuindexformat>

### GPULoadOp

**Members:**

Name | Value
---- | -----
Load | `"load"`
Clear | `"clear"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuloadop>

### GPUMapMode

**Members:**

Name | Value
---- | -----
READ | `0x0001`
WRITE | `0x0002`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gpumapmode>

### GPUMipmapFilterMode

**Members:**

Name | Value
---- | -----
Nearest | `"nearest"`
Linear | `"linear"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpumipmapfiltermode>

### GPUPipelineErrorReason

**Members:**

Name | Value
---- | -----
Validation | `"validation"`
Internal | `"internal"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpupipelineerrorreason>

### GPUPowerPreference

**Members:**

Name | Value
---- | -----
LowPower | `"low-power"`
HighPerformance | `"high-performance"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpupowerpreference>

### GPUPrimitiveTopology

**Members:**

Name | Value
---- | -----
PointList | `"point-list"`
LineList | `"line-list"`
LineStrip | `"line-strip"`
TriangleList | `"triangle-list"`
TriangleStrip | `"triangle-strip"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuprimitivetopology>

### GPUQueryType

**Members:**

Name | Value
---- | -----
Occlusion | `"occlusion"`
Timestamp | `"timestamp"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuquerytype>

### GPUSamplerBindingType

**Members:**

Name | Value
---- | -----
Filtering | `"filtering"`
NonFiltering | `"non-filtering"`
Comparison | `"comparison"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpusamplerbindingtype>

### GPUShaderStage

**Members:**

Name | Value
---- | -----
VERTEX | `0x1`
FRAGMENT | `0x2`
COMPUTE | `0x4`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gpushaderstage>

### GPUStencilOperation

**Members:**

Name | Value
---- | -----
Keep | `"keep"`
Zero | `"zero"`
Replace | `"replace"`
Invert | `"invert"`
IncrementClamp | `"increment-clamp"`
DecrementClamp | `"decrement-clamp"`
IncrementWrap | `"increment-wrap"`
DecrementWrap | `"decrement-wrap"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpustenciloperation>

### GPUStorageTextureAccess

**Members:**

Name | Value
---- | -----
WriteOnly | `"write-only"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpustoragetextureaccess>

### GPUStoreOp

**Members:**

Name | Value
---- | -----
Store | `"store"`
Discard | `"discard"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpustoreop>

### GPUTextureAspect

**Members:**

Name | Value
---- | -----
All | `"all"`
StencilOnly | `"stencil-only"`
DepthOnly | `"depth-only"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputextureaspect>

### GPUTextureDimension

**Members:**

Name | Value
---- | -----
_1D | `"1d"`
_2D | `"2d"`
_3D | `"3d"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputexturedimension>

### GPUTextureFormat

**Members:**

Name | Value
---- | -----
R8unorm | `"r8unorm"`
R8snorm | `"r8snorm"`
R8uint | `"r8uint"`
R8sint | `"r8sint"`
R16uint | `"r16uint"`
R16sint | `"r16sint"`
R16float | `"r16float"`
Rg8unorm | `"rg8unorm"`
Rg8snorm | `"rg8snorm"`
Rg8uint | `"rg8uint"`
Rg8sint | `"rg8sint"`
R32uint | `"r32uint"`
R32sint | `"r32sint"`
R32float | `"r32float"`
Rg16uint | `"rg16uint"`
Rg16sint | `"rg16sint"`
Rg16float | `"rg16float"`
Rgba8unorm | `"rgba8unorm"`
Rgba8unormSrgb | `"rgba8unorm-srgb"`
Rgba8snorm | `"rgba8snorm"`
Rgba8uint | `"rgba8uint"`
Rgba8sint | `"rgba8sint"`
Bgra8unorm | `"bgra8unorm"`
Bgra8unormSrgb | `"bgra8unorm-srgb"`
Rgb9e5ufloat | `"rgb9e5ufloat"`
Rgb10a2unorm | `"rgb10a2unorm"`
Rg11b10ufloat | `"rg11b10ufloat"`
Rg32uint | `"rg32uint"`
Rg32sint | `"rg32sint"`
Rg32float | `"rg32float"`
Rgba16uint | `"rgba16uint"`
Rgba16sint | `"rgba16sint"`
Rgba16float | `"rgba16float"`
Rgba32uint | `"rgba32uint"`
Rgba32sint | `"rgba32sint"`
Rgba32float | `"rgba32float"`
Stencil8 | `"stencil8"`
Depth16unorm | `"depth16unorm"`
Depth24plus | `"depth24plus"`
Depth24plusStencil8 | `"depth24plus-stencil8"`
Depth32float | `"depth32float"`
Depth32floatStencil8 | `"depth32float-stencil8"`
Bc1RgbaUnorm | `"bc1-rgba-unorm"`
Bc1RgbaUnormSrgb | `"bc1-rgba-unorm-srgb"`
Bc2RgbaUnorm | `"bc2-rgba-unorm"`
Bc2RgbaUnormSrgb | `"bc2-rgba-unorm-srgb"`
Bc3RgbaUnorm | `"bc3-rgba-unorm"`
Bc3RgbaUnormSrgb | `"bc3-rgba-unorm-srgb"`
Bc4RUnorm | `"bc4-r-unorm"`
Bc4RSnorm | `"bc4-r-snorm"`
Bc5RgUnorm | `"bc5-rg-unorm"`
Bc5RgSnorm | `"bc5-rg-snorm"`
Bc6hRgbUfloat | `"bc6h-rgb-ufloat"`
Bc6hRgbFloat | `"bc6h-rgb-float"`
Bc7RgbaUnorm | `"bc7-rgba-unorm"`
Bc7RgbaUnormSrgb | `"bc7-rgba-unorm-srgb"`
Etc2Rgb8unorm | `"etc2-rgb8unorm"`
Etc2Rgb8unormSrgb | `"etc2-rgb8unorm-srgb"`
Etc2Rgb8a1unorm | `"etc2-rgb8a1unorm"`
Etc2Rgb8a1unormSrgb | `"etc2-rgb8a1unorm-srgb"`
Etc2Rgba8unorm | `"etc2-rgba8unorm"`
Etc2Rgba8unormSrgb | `"etc2-rgba8unorm-srgb"`
EacR11unorm | `"eac-r11unorm"`
EacR11snorm | `"eac-r11snorm"`
EacRg11unorm | `"eac-rg11unorm"`
EacRg11snorm | `"eac-rg11snorm"`
Astc4X4Unorm | `"astc-4x4-unorm"`
Astc4X4UnormSrgb | `"astc-4x4-unorm-srgb"`
Astc5X4Unorm | `"astc-5x4-unorm"`
Astc5X4UnormSrgb | `"astc-5x4-unorm-srgb"`
Astc5X5Unorm | `"astc-5x5-unorm"`
Astc5X5UnormSrgb | `"astc-5x5-unorm-srgb"`
Astc6X5Unorm | `"astc-6x5-unorm"`
Astc6X5UnormSrgb | `"astc-6x5-unorm-srgb"`
Astc6X6Unorm | `"astc-6x6-unorm"`
Astc6X6UnormSrgb | `"astc-6x6-unorm-srgb"`
Astc8X5Unorm | `"astc-8x5-unorm"`
Astc8X5UnormSrgb | `"astc-8x5-unorm-srgb"`
Astc8X6Unorm | `"astc-8x6-unorm"`
Astc8X6UnormSrgb | `"astc-8x6-unorm-srgb"`
Astc8X8Unorm | `"astc-8x8-unorm"`
Astc8X8UnormSrgb | `"astc-8x8-unorm-srgb"`
Astc10X5Unorm | `"astc-10x5-unorm"`
Astc10X5UnormSrgb | `"astc-10x5-unorm-srgb"`
Astc10X6Unorm | `"astc-10x6-unorm"`
Astc10X6UnormSrgb | `"astc-10x6-unorm-srgb"`
Astc10X8Unorm | `"astc-10x8-unorm"`
Astc10X8UnormSrgb | `"astc-10x8-unorm-srgb"`
Astc10X10Unorm | `"astc-10x10-unorm"`
Astc10X10UnormSrgb | `"astc-10x10-unorm-srgb"`
Astc12X10Unorm | `"astc-12x10-unorm"`
Astc12X10UnormSrgb | `"astc-12x10-unorm-srgb"`
Astc12X12Unorm | `"astc-12x12-unorm"`
Astc12X12UnormSrgb | `"astc-12x12-unorm-srgb"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputextureformat>

### GPUTextureSampleType

**Members:**

Name | Value
---- | -----
Float | `"float"`
UnfilterableFloat | `"unfilterable-float"`
Depth | `"depth"`
Sint | `"sint"`
Uint | `"uint"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputexturesampletype>

### GPUTextureUsage

**Members:**

Name | Value
---- | -----
COPY_SRC | `0x01`
COPY_DST | `0x02`
TEXTURE_BINDING | `0x04`
STORAGE_BINDING | `0x08`
RENDER_ATTACHMENT | `0x10`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gputextureusage>

### GPUTextureViewDimension

**Members:**

Name | Value
---- | -----
_1D | `"1d"`
_2D | `"2d"`
_2DArray | `"2d-array"`
Cube | `"cube"`
CubeArray | `"cube-array"`
_3D | `"3d"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputextureviewdimension>

### GPUVertexFormat

**Members:**

Name | Value
---- | -----
Uint8x2 | `"uint8x2"`
Uint8x4 | `"uint8x4"`
Sint8x2 | `"sint8x2"`
Sint8x4 | `"sint8x4"`
Unorm8x2 | `"unorm8x2"`
Unorm8x4 | `"unorm8x4"`
Snorm8x2 | `"snorm8x2"`
Snorm8x4 | `"snorm8x4"`
Uint16x2 | `"uint16x2"`
Uint16x4 | `"uint16x4"`
Sint16x2 | `"sint16x2"`
Sint16x4 | `"sint16x4"`
Unorm16x2 | `"unorm16x2"`
Unorm16x4 | `"unorm16x4"`
Snorm16x2 | `"snorm16x2"`
Snorm16x4 | `"snorm16x4"`
Float16x2 | `"float16x2"`
Float16x4 | `"float16x4"`
Float32 | `"float32"`
Float32x2 | `"float32x2"`
Float32x3 | `"float32x3"`
Float32x4 | `"float32x4"`
Uint32 | `"uint32"`
Uint32x2 | `"uint32x2"`
Uint32x3 | `"uint32x3"`
Uint32x4 | `"uint32x4"`
Sint32 | `"sint32"`
Sint32x2 | `"sint32x2"`
Sint32x3 | `"sint32x3"`
Sint32x4 | `"sint32x4"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuvertexformat>

### GPUVertexStepMode

**Members:**

Name | Value
---- | -----
Vertex | `"vertex"`
Instance | `"instance"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuvertexstepmode>
