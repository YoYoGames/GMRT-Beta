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
  * [GPURequestAdapterOptions](#gpurequestadapteroptions)
  * [GPUAdapter](#gpuadapter)
    * [GPUAdapter.requestDevice](#gpuadapterrequestdevice)
  * [GPUDeviceDescriptor](#gpudevicedescriptor)
  * [GPUDevice](#gpudevice)
    * [GPUDevice.createBindGroup](#gpudevicecreatebindgroup)
    * [GPUDevice.createBindGroupLayout](#gpudevicecreatebindgrouplayout)
    * [GPUDevice.createBuffer](#gpudevicecreatebuffer)
    * [GPUDevice.createCommandEncoder](#gpudevicecreatecommandencoder)
    * [GPUDevice.createPipelineLayout](#gpudevicecreatepipelinelayout)
    * [GPUDevice.createRenderPipeline](#gpudevicecreaterenderpipeline)
    * [GPUDevice.createSampler](#gpudevicecreatesampler)
    * [GPUDevice.createShaderModule](#gpudevicecreateshadermodule)
    * [GPUDevice.createTexture](#gpudevicecreatetexture)
    * [GPUDevice.queue](#gpudevicequeue)
  * [GPUBindGroupDescriptor](#gpubindgroupdescriptor)
  * [GPUBindGroup](#gpubindgroup)
  * [GPUBindGroupLayoutDescriptor](#gpubindgrouplayoutdescriptor)
  * [GPUBindGroupLayout](#gpubindgrouplayout)
  * [GPUBufferDescriptor](#gpubufferdescriptor)
  * [GPUBuffer](#gpubuffer)
    * [GPUBuffer.destroy](#gpubufferdestroy)
  * [GPUCommandBufferDescriptor](#gpucommandbufferdescriptor)
  * [GPUCommandBuffer](#gpucommandbuffer)
  * [GPUCommandEncoderDescriptor](#gpucommandencoderdescriptor)
  * [GPUCommandEncoder](#gpucommandencoder)
    * [GPUCommandEncoder.beginRenderPass](#gpucommandencoderbeginrenderpass)
    * [GPUCommandEncoder.copyTextureToTexture](#gpucommandencodercopytexturetotexture)
    * [GPUCommandEncoder.finish](#gpucommandencoderfinish)
  * [GPUExtent3D](#gpuextent3d)
  * [GPUImageCopyTexture](#gpuimagecopytexture)
  * [GPUPipelineLayoutDescriptor](#gpupipelinelayoutdescriptor)
  * [GPUPipelineLayout](#gpupipelinelayout)
  * [GPURenderPassDescriptor](#gpurenderpassdescriptor)
  * [GPURenderPassEncoder](#gpurenderpassencoder)
    * [GPURenderPassEncoder.draw](#gpurenderpassencoderdraw)
    * [GPURenderPassEncoder.end_](#gpurenderpassencoderend_)
    * [GPURenderPassEncoder.setBindGroup](#gpurenderpassencodersetbindgroup)
    * [GPURenderPassEncoder.setPipeline](#gpurenderpassencodersetpipeline)
    * [GPURenderPassEncoder.setVertexBuffer](#gpurenderpassencodersetvertexbuffer)
  * [GPURenderPipelineDescriptor](#gpurenderpipelinedescriptor)
  * [GPURenderPipeline](#gpurenderpipeline)
    * [GPURenderPipeline.getBindGroupLayout](#gpurenderpipelinegetbindgrouplayout)
  * [GPUSamplerDescriptor](#gpusamplerdescriptor)
  * [GPUSampler](#gpusampler)
  * [GPUShaderModuleDescriptor](#gpushadermoduledescriptor)
  * [GPUShaderModule](#gpushadermodule)
  * [GPUTextureDescriptor](#gputexturedescriptor)
  * [GPUTexture](#gputexture)
    * [GPUTexture.createView](#gputexturecreateview)
    * [GPUTexture.destroy](#gputexturedestroy)
  * [GPUTextureViewDescriptor](#gputextureviewdescriptor)
  * [GPUTextureView](#gputextureview)
  * [GPUQueue](#gpuqueue)
    * [GPUQueue.submit](#gpuqueuesubmit)
    * [GPUQueue.writeBuffer](#gpuqueuewritebuffer)
* [Enums](#enums)
  * [GPUAddressMode](#gpuaddressmode)
  * [GPUAutoLayoutMode](#gpuautolayoutmode)
  * [GPUBlendFactor](#gpublendfactor)
  * [GPUBlendOperation](#gpublendoperation)
  * [GPUBufferBindingType](#gpubufferbindingtype)
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

A static method of struct [GPU](#gpu). Counterpart to JavaScript's `canvas.getCurrentTexture().createView()`.

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
`texture` | Pointer.Texture | `false` | The texture to retrieve a `GPUTexture` for.

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
`texture` | Pointer.Texture | `false` | The texture to retrieve a `GPUTextureView` for.

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
`options` | [GPURequestAdapterOptions](#gpurequestadapteroptions) | `true` | Currently ignored by the function.

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
`callback` | Function | `false` | A function that submits commands to the GPU.

**Returns:** N/A

**Note:**

Unlike in JS, you should never call `requestAnimationFrame` inside of the callback function, or your game will be stuck in an endless loop! Use for example the Draw event to call the function every frame!

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/Window/requestAnimationFrame>

#### GPU.wgslLanguageFeatures

A static read-only property of [GPU](#gpu). Contains an array of available [WGSL language features](https://gpuweb.github.io/gpuweb/wgsl/#language-extension) (strings).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPU/wgslLanguageFeatures>

### GPURequestAdapterOptions

Currently unused, as the [GPU.requestAdapter](#gpurequestadapter) method always returns the [GPUAdapter](#gpuadapter) used internally by GameMaker.

<https://developer.mozilla.org/en-US/docs/Web/API/GPU/requestAdapter#options>

### GPUAdapter

A struct used mainly to retrieve a [GPUDevice](#gpudevice), which can be further used to create command encoders, GPU resources and retrieve a [GPUQueue](#gpuqueue). Retrieved with [GPU.requestAdapter](#gpurequestadapter).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUAdapter>

#### GPUAdapter.requestDevice

A method of struct [GPUAdapter](#gpuadapter). Returns a [GPUDevice](#gpudevice), which can be further used to create command encoders, GPU resources and retrieve a [GPUQueue](#gpuqueue). The `descriptor` argument is currently ignored and the function always returns the device used internally by GameMaker!

**Syntax:**

`requestDevice([descriptor])`

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`descriptor` | [GPUDeviceDescriptor](#gpudevicedescriptor) | `true` | Currently ignored by the function.

**Returns:** [GPUDevice](#gpudevice)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUAdapter/requestDevice>

### GPUDeviceDescriptor

Currently unused, as the [GPUAdapter.requestDevice](#gpuadapterrequestdevice) method always returns the [GPUDevice](#gpudevice) used internally by GameMaker.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUAdapter/requestDevice#descriptor>

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
`descriptor` | [GPUBindGroupDescriptor](#gpubindgroupdescriptor) | `false` | A description of the bind group to be created.

**Returns:** [GPUBindGroup](#gpubindgroup)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBindGroup>

#### GPUDevice.createBindGroupLayout

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPUBindGroupLayout](#gpubindgrouplayout), which defines storage and purpose of GPU resources like buffers, samplers and textures, and is required for creating new [GPUBindGroup](#gpubindgroup)s.

**Syntax:**

`createBindGroupLayout(descriptor)`

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`descriptor` | [GPUBindGroupLayoutDescriptor](#gpubindgrouplayoutdescriptor) | `false` | A description of the bind group layout to be created.

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
`descriptor` | [GPUBufferDescriptor](#gpubufferdescriptor) | `false` | A description of the buffer to be created.

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
`descriptor` | [GPUCommandEncoderDescriptor](#gpucommandencoderdescriptor) | `true` | A description of the command encoder to be created.

**Returns:** [GPUCommandEncoder](#gpucommandencoder)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createCommandEncoder>

#### GPUDevice.createPipelineLayout

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPUPipelineLayout](#gpupipelinelayout), which is a struct required for creating new pipelines. `GPUPipelineLayout` defines the [layout](#gpubindgrouplayout) that a [bind group](#gpubindgroup) must have to be compatible with given pipeline.

**Syntax:**

```gml
createPipelineLayout(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`descriptor` | [GPUPipelineLayoutDescriptor](#gpupipelinelayoutdescriptor) | `false` | The description of the pipeline layout to be created.

**Returns:** [GPUPipelineLayout](#gpupipelinelayout)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createPipelineLayout>

#### GPUDevice.createRenderPipeline

A method of struct [GPUDevice](#gpudevice). Creates and returns a new [GPURenderPipeline](#gpurenderpipeline), which defines vertex and fragment stages of a render pass.

**Syntax:**

```gml
createRenderPipeline(descriptor)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`descriptor` | [GPURenderPipelineDescriptor](#gpurenderpipelinedescriptor) | `false` | The description of the render pipeline to be created.

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
`descriptor` | [GPUSamplerDescriptor](#gpusamplerdescriptor) | `true` | The description of the sampler to be created.

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
`descriptor` | [GPUShaderModuleDescriptor](#gpushadermoduledescriptor) | `true` | The description of the shader module to be created.

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
`descriptor` | [GPUTextureDescriptor](#gputexturedescriptor) | `true` | The description of the texture to be created.

**Returns:** [GPUTexture](#gputexture)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createTexture>

#### GPUDevice.queue

A static read-only property of struct [GPUDevice](#gpudevice) containing [GPUQueue](#gpuqueue), which can be used to issue commands to the GPU.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/queue>

### GPUBindGroupDescriptor

A struct used in [GPUDevice.createBindGroup](#gpudevicecreatebindgroup) to create a new [GPUBindGroup](#gpubindgroup).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBindGroup#descriptor>

### GPUBindGroup

A struct containing shader bindings, laid out based on a [GPUBindGroupLayout](#gpubindgrouplayout). Created with [GPUDevice.createBindGroup](#gpudevicecreatebindgroup).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBindGroup>

### GPUBindGroupLayoutDescriptor

A struct used in [GPUDevice.createBindGroupLayout](#gpudevicecreatebindgrouplayout) to create a new [GPUBindGroupLayout](#gpubindgroup).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBindGroupLayout#descriptor>

### GPUBindGroupLayout

A struct that defines layout and usage of shader resources in [GPUBindGroup](#gpubindgroup)s. Created with [GPUDevice.createBindGroupLayout](#gpudevicecreatebindgrouplayout).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBindGroupLayout>

### GPUBufferDescriptor

A struct used in [GPUDevice.createBuffer](#gpudevicecreatebuffer) to create a new [GPUBuffer](#gpubuffer).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createBuffer#descriptor>

### GPUBuffer

A struct containing a buffer. Created with [GPUDevice.createBuffer](#gpudevicecreatebuffer).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer>

#### GPUBuffer.destroy

A method of struct [GPUBuffer](#gpubuffer). Destroys the buffer. You should always use this function when the buffer is no longer needed to avoid memory leaks!

**Syntax:**

```syntax
destroy()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUBuffer/destroy>

### GPUCommandBufferDescriptor

A struct used in [GPUCommandEncoder.finish](#gpucommandencoderfinish) to create a new [GPUCommandBuffer](#gpucommandbuffer).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/finish#descriptor>

### GPUCommandBuffer

A struct containing GPU commands, ready to be submitted with [GPUQueue.submit](#gpuqueuesubmit). Created with [GPUCommandEncoder.finish](#gpucommandencoderfinish).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandBuffer>

### GPUCommandEncoderDescriptor

A struct used in [GPUDevice.createCommandEncoder](#gpudevicecreatecommandencoder) to create a new [GPUCommandEncoder](#gpucommandencoder).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createCommandEncoder#descriptor>

### GPUCommandEncoder

A struct used to create GPU commands. Created with [GPUDevice.createCommandEncoder](#gpudevicecreatecommandencoder).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder>

#### GPUCommandEncoder.copyTextureToTexture

A method of struct [GPUCommandEncoder](#gpucommandencoder). Copies contents of one [GPUTexture](#gputexture) to another.

**Syntax:**

```gml
copyTextureToTexture(source, destination, copySize)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`source` | [GPUImageCopyTexture](#gpuimagecopytexture) | `false` | The texture to copy from.
`destination` | [GPUImageCopyTexture](#gpuimagecopytexture) | `false` | The texture to copy to.
`copySize` | [GPUExtent3D](#gpuextent3d) | `false` | The width, height, and depth/array layer count to be copied.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyTextureToTexture>

#### GPUCommandEncoder.beginRenderPass

A method of struct [GPUCommandEncoder](#gpucommandencoder). Begins a new render pass and returns a [GPURenderPassEncoder](#gpurenderpassencoder), using which you can define the commands execute during given render pass.

**Syntax:**

```gml
beginRenderPass([descriptor])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`descriptor` | [GPURenderPassDescriptor](#gpurenderpassdescriptor) | `true` | The description of the render pass to begin.

**Returns:** [GPURenderPassEncoder](#gpurenderpassencoder)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/beginRenderPass>

#### GPUCommandEncoder.finish

A method of struct [GPUCommandEncoder](#gpucommandencoder). Encodes created commands and returns a [GPUCommandBuffer](#gpucommandbuffer), which can be then executed using [GPUQueue.submit](#gpuqueuesubmit). After calling this method the command encoder cannot be used again!

**Syntax:**

```gml
finish([descriptor])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`descriptor` | [GPUCommandBufferDescriptor](#gpucommandbufferdescriptor) | `true` | The description of the command buffer to be created.

**Returns:** [GPUCommandBuffer](#gpucommandbuffer)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/finish>

### GPUExtent3D

A struct or an array containing width, height and depth/array layers. used for example in [GPUCommandEncoder.copyTextureToTexture](#gpucommandencodercopytexturetotexture) for copying data from one [GPUTexture](#gputexture) to another.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyTextureToTexture#copysize>

### GPUImageCopyTexture

A struct defining source or destination texture in a texture copy operation.

**See also:** [GPUCommandEncoder.copyTextureToTexture](#gpucommandencodercopytexturetotexture)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/copyTextureToTexture#copy_texture_object_structure>

### GPUPipelineLayoutDescriptor

A struct used in [GPUDevice.createPipelineLayout](#gpudevicecreatepipelinelayout) to create a new [GPUPipelineLayout](#gpupipelinelayout).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createPipelineLayout#descriptor>

### GPUPipelineLayout

A struct that defines [GPUBindGroupLayout](#gpubindgrouplayout)s used by a pipeline. Created with [GPUDevice.createPipelineLayout](#gpudevicecreatepipelinelayout).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUPipelineLayout>

### GPURenderPassDescriptor

A struct used in [GPUCommandEncoder.beginRenderPass](#gpucommandencoderbeginrenderpass) to begin a new render pass.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUCommandEncoder/beginRenderPass#descriptor>

### GPURenderPassEncoder

A struct that creates render pass GPU commands. Created with [GPUCommandEncoder.beginRenderPass].

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder>

#### GPURenderPassEncoder.draw

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Draws vertices from a vertex buffer previously set using [GPURenderPassEncoder.setVertexBuffer](#gpurenderpassencodersetvertexbuffer).

**Syntax:**

```gml
draw(vertexCount, [instanceCount], [firstVertex], [firstInstance])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`vertexCount` | Real | `false` | The number of vertices to draw.
`instanceCount` | Real | `true` | The number of instances to draw. Defaults to 1.
`firstVertex` | Real | `true` | The index of the first vertex to start drawing form. Defaults to 0.
`firstInstance` | Real | `true` | The number of the first instance to draw. Defaults to 0.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/draw>

#### GPURenderPassEncoder.end_

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Equivalent to JavaScript's `end()` (which is a reserved keyword in GML, so an underscore is appended to avoid the name clash). Ends a render pass.

**Syntax:**

```gml
end_()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/end>

#### GPURenderPassEncoder.setBindGroup

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Defines the [GPUBindGroup](#gpubindgroup) used in subsequent commands at given index.

**Syntax:**

```gml
setBindGroup(index, bindGroup, [dynamicOffsets], [dynamicOffsetsStart], [dynamicOffsetsLength])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`index` | Real | `false` | The index to set the bind group at.
`bindGroup` | [GPUBindGroup](#gpubindgroup), Undefined | `false` | The bind group to set. Use `undefined` to unset a previously set bind group for given index.
`dynamicOffsets` | Array\<Real\> | `true` | An array of values specifying the offset, in bytes, for each entry in `bindGroup` with `hasDynamicOffset: true` set.
`dynamicOffsetsStart` | Real | `true` | An offset, in array elements, into `dynamicOffsetsData`, where the dynamic offset data begins. Defaults to 0.
`dynamicOffsetsLength` | Real | `true` | The number of dynamic offset values to be read from in `dynamicOffsetsData`. Defaults to the length of the array.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setBindGroup>

#### GPURenderPassEncoder.setPipeline

A method of struct [GPURenderPassEncoder](#gpurenderpassencoder). Defines the [GPURenderPipeline](#gpurenderpipeline) used in subsequent commands.

**Syntax:**

```gml
setPipeline(pipeline)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`pipeline` | [GPURenderPipeline](#gpurenderpipeline) | `false` | The render pipeline to use in subsequent commands.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setPipeline>

#### GPURenderPassEncoder.setVertexBuffer

**Syntax:**

```gml
setVertexBuffer(slot, buffer, [offset], [size])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`slot` | Real | `true` | The number of the slot to set the vertex buffer for.
`buffer` | [GPUBuffer](#gpubuffer), Undefined | `true` | A vertex buffer to set for given slot. Use `undefined` to unset a previously set buffer for given slot.
`offset` | Real | `true` | An offset, in bytes, to where the vertex buffer begins. Defaults to 0.
`size` | Real | `true` | The size of the vertex buffer, in bytes. Defaults to the whole size of the buffer minus offset.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPassEncoder/setVertexBuffer>

### GPURenderPipelineDescriptor

A struct used in [GPUDevice.createRenderPipeline](#gpudevicecreaterenderpipeline) to create a new [GPURenderPipeline](#gpurenderpipeline).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createRenderPipeline#descriptor>

### GPURenderPipeline

A struct that defines vertex and fragment stages of a render pipeline, used in [GPURenderPassEncoder.setPipeline](#gpurenderpassencodersetpipeline). Created with [GPUDevice.createRenderPipeline](#gpudevicecreaterenderpipeline).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPipeline>

#### GPURenderPipeline.getBindGroupLayout

A method of struct [GPURenderPipeline](#gpurenderpipeline). Returns the pipeline's bind group layout at given index. Useful when given pipeline is created with `layout: "auto"`.

`**Syntax:**

```gml
getBindGroupLayout(index)
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`index` | Real | `false` | The index of the bind group layout.

**Returns:** [GPUBindGroupLayout](#gpubindgrouplayout)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPURenderPipeline/getBindGroupLayout>

### GPUSamplerDescriptor

A struct used in [GPUDevice.createSampler](#gpudevicecreatesampler) to create a new [GPUSampler](#gpusampler).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createSampler#descriptor>

### GPUSampler

A struct that defines how are textures sampled in a shader. Created with [GPUDevice.createSampler](#gpudevicecreatesampler). Used in [GPUBindGroup](#gpubindgroup)s.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUSampler>

### GPUShaderModuleDescriptor

A struct used in [GPUDevice.createShaderModule](#gpudevicecreateshadermodule) to create a new [GPUShaderModule](#gpushadermodule).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createShaderModule#descriptor>

### GPUShaderModule

A struct that represents a compiled WGSL code. Created with [GPUDevice.createShaderModule](#gpudevicecreateshadermodule). Used in [GPUDevice.createRenderPipeline](#gpudevicecreaterenderpipeline).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUShaderModule>

### GPUTextureDescriptor

A struct used in [GPUDevice.createTexture](#gpudevicecreatetexture) to create a new [GPUTexture](#gputexture).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUDevice/createTexture#descriptor>

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
`descriptor` | [GPUTextureViewDescriptor](#gputextureviewdescriptor) | `true` | The description of the texture view to be created. Can be ommited to create a texture view with default properties.

**Returns:** [GPUTextureView](#gputextureview)

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/createView>

#### GPUTexture.destroy

A method of struct [GPUTexture](#gputexture). Destroys the texture. You should always use this function when the texture is no longer needed to avoid memory leaks!

**Syntax:**

```syntax
destroy()
```

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/destroy>

### GPUTextureViewDescriptor

A struct used in [GPUTexture.createView](#gputexturecreateview) to create a new [GPUTextureView](#gputextureview).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTexture/createView#descriptor>

### GPUTextureView

A struct that represents a view into a subset of a [GPUTexture](#gputexture). Created with [GPUTexture.createView](#gputexturecreateview). Used for example in [GPUBindGroup](#gpubindgroup)s for sampling of textures in shaders.

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUTextureView>

### GPUQueue

A struct used to issue commands to the GPU. Retrieved with [GPUDevice.queue](#gpudevicequeue).

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue>

#### GPUQueue.submit

A method of struct [GPUQueue](#gpuqueue). Submits an array of [GPUCommandBuffer](#gpucommandbuffer)s to the GPU.

`submit(commandBuffers)`

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
`commandBuffers` | Array\<[GPUCommandBuffer](#gpucommandbuffer)\> | `false` | An array of `GPUCommandBuffer`s to submit.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue/submit>

#### GPUQueue.writeBuffer

A method of struct [GPUQueue](#gpuqueue). Copies data from an array into a buffer.

**Syntax:**

```gml
writeBuffer(buffer, bufferOffset, data, [dataOffset], [size])
```

**Params:**

Name | Type | Optional | Description
---- | ---- | -------- | -----------
buffer | [GPUBuffer](#gpubuffer) | `false` | The buffer to write the data into. Must be created with the `GPUBufferUsage.COPY_DST` usage!
bufferOffset | Real | `false` | The offset, in bytes, to start writing into the buffer at.
data | Array\<Real\> | `false` | An array of numbers to write into the buffer.
dataOffset | Real | `false` | An offset, in array elements, to start reading the data from. Defaults to 0.
size | Real | `false` | The number of array elements to write. Defaults to the size of the array minus offset.

**Returns:** N/A

**Links:** <https://developer.mozilla.org/en-US/docs/Web/API/GPUQueue/writeBuffer>

## Enums

### GPUAddressMode

**Members:**

Name | Value
---- | -----
`ClampToEdge` | `"clamp-to-edge"`
`Repeat` | `"repeat"`
`MirrorRepeat` | `"mirror-repeat"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuaddressmode>

### GPUAutoLayoutMode

**Members:**

Name | Value
---- | -----
`Auto` | `"auto"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuautolayoutmode>

### GPUBlendFactor

**Members:**

Name | Value
---- | -----
`Zero` | `"zero"`
`One` | `"one"`
`Src` | `"src"`
`OneMinusSrc` | `"one-minus-src"`
`SrcAlpha` | `"src-alpha"`
`OneMinusSrcAlpha` | `"one-minus-src-alpha"`
`Dst` | `"dst"`
`OneMinusDst` | `"one-minus-dst"`
`DstAlpha` | `"dst-alpha"`
`OneMinusDstAlpha` | `"one-minus-dst-alpha"`
`SrcAlphaSaturated` | `"src-alpha-saturated"`
`Constant` | `"constant"`
`OneMinusConstant` | `"one-minus-constant"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpublendfactor>

### GPUBlendOperation

**Members:**

Name | Value
---- | -----
`Add` | `"add"`
`Subtract` | `"subtract"`
`ReverseSubtract` | `"reverse-subtract"`
`Min` | `"min"`
`Max` | `"max"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpublendoperation>

### GPUBufferBindingType

**Members:**

Name | Value
---- | -----
`Uniform` | `"uniform"`
`Storage` | `"storage"`
`ReadOnlyStorage` | `"read-only-storage"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpubufferbindingtype>

### GPUBufferMapState

**Members:**

Name | Value
---- | -----
`Unmapped` | `"unmapped"`
`Pending` | `"pending"`
`Mapped` | `"mapped"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpubuffermapstate>

### GPUBufferUsage

**Members:**

Name | Value
---- | -----
`MAP_READ` | `0x0001`
`MAP_WRITE` | `0x0002`
`COPY_SRC` | `0x0004`
`COPY_DST` | `0x0008`
`INDEX` | `0x0010`
`VERTEX` | `0x0020`
`UNIFORM` | `0x0040`
`STORAGE` | `0x0080`
`INDIRECT` | `0x0100`
`QUERY_RESOLVE` | `0x0200`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gpubufferusage>

### GPUCanvasAlphaMode

**Members:**

Name | Value
---- | -----
`Opaque` | `"opaque"`
`Premultiplied` | `"premultiplied"`

**Links:** <https://gpuweb.github.io/gpuweb/#gpucanvasalphamode>

### GPUColorWrite

**Members:**

Name | Value
---- | -----
`RED` | `0x1`
`GREEN` | `0x2`
`BLUE` | `0x4`
`ALPHA` | `0x8`
`ALL` | `0xF`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gpucolorwrite>

### GPUCompareFunction

**Members:**

Name | Value
---- | -----
`Never` | `"never"`
`Less` | `"less"`
`Equal` | `"equal"`
`LessEqual` | `"less-equal"`
`Greater` | `"greater"`
`NotEqual` | `"not-equal"`
`GreaterEqual` | `"greater-equal"`
`Always` | `"always"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpucomparefunction>

### GPUCompilationMessageType

**Members:**

Name | Value
---- | -----
`Error` | `"error"`
`Warning` | `"warning"`
`Info` | `"info"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpucompilationmessagetype>

### GPUCullMode

**Members:**

Name | Value
---- | -----
`None` | `"none"`
`Front` | `"front"`
`Back` | `"back"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpucullmode>

### GPUDeviceLostReason

**Members:**

Name | Value
---- | -----
`Unknown` | `"unknown"`
`Destroyed` | `"destroyed"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpudevicelostreason>

### GPUErrorFilter

**Members:**

Name | Value
---- | -----
`Validation` | `"validation"`
`OutOfMemory` | `"out-of-memory"`
`Internal` | `"internal"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuerrorfilter>

### GPUFeatureName

**Members:**

Name | Value
---- | -----
`DepthClipControl` | `"depth-clip-control"`
`Depth32floatStencil8` | `"depth32float-stencil8"`
`TextureCompressionBc` | `"texture-compression-bc"`
`TextureCompressionEtc2` | `"texture-compression-etc2"`
`TextureCompressionAstc` | `"texture-compression-astc"`
`TimestampQuery` | `"timestamp-query"`
`IndirectFirstInstance` | `"indirect-first-instance"`
`ShaderF16` | `"shader-f16"`
`Rg11b10ufloatRenderable` | `"rg11b10ufloat-renderable"`
`Bgra8unormStorage` | `"bgra8unorm-storage"`
`Float32Filterable` | `"float32-filterable"`

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
`Uint16` | `"uint16"`
`Uint32` | `"uint32"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuindexformat>

### GPULoadOp

**Members:**

Name | Value
---- | -----
`Load` | `"load"`
`Clear` | `"clear"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuloadop>

### GPUMapMode

**Members:**

Name | Value
---- | -----
`READ` | `0x0001`
`WRITE` | `0x0002`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gpumapmode>

### GPUMipmapFilterMode

**Members:**

Name | Value
---- | -----
`Nearest` | `"nearest"`
`Linear` | `"linear"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpumipmapfiltermode>

### GPUPipelineErrorReason

**Members:**

Name | Value
---- | -----
`Validation` | `"validation"`
`Internal` | `"internal"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpupipelineerrorreason>

### GPUPowerPreference

**Members:**

Name | Value
---- | -----
`LowPower` | `"low-power"`
`HighPerformance` | `"high-performance"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpupowerpreference>

### GPUPrimitiveTopology

**Members:**

Name | Value
---- | -----
`PointList` | `"point-list"`
`LineList` | `"line-list"`
`LineStrip` | `"line-strip"`
`TriangleList` | `"triangle-list"`
`TriangleStrip` | `"triangle-strip"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuprimitivetopology>

### GPUQueryType

**Members:**

Name | Value
---- | -----
`Occlusion` | `"occlusion"`
`Timestamp` | `"timestamp"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuquerytype>

### GPUSamplerBindingType

**Members:**

Name | Value
---- | -----
`Filtering` | `"filtering"`
`NonFiltering` | `"non-filtering"`
`Comparison` | `"comparison"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpusamplerbindingtype>

### GPUShaderStage

**Members:**

Name | Value
---- | -----
`VERTEX` | `0x1`
`FRAGMENT` | `0x2`
`COMPUTE` | `0x4`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gpushaderstage>

### GPUStencilOperation

**Members:**

Name | Value
---- | -----
`Keep` | `"keep"`
`Zero` | `"zero"`
`Replace` | `"replace"`
`Invert` | `"invert"`
`IncrementClamp` | `"increment-clamp"`
`DecrementClamp` | `"decrement-clamp"`
`IncrementWrap` | `"increment-wrap"`
`DecrementWrap` | `"decrement-wrap"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpustenciloperation>

### GPUStorageTextureAccess

**Members:**

Name | Value
---- | -----
`WriteOnly` | `"write-only"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpustoragetextureaccess>

### GPUStoreOp

**Members:**

Name | Value
---- | -----
`Store` | `"store"`
`Discard` | `"discard"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpustoreop>

### GPUTextureAspect

**Members:**

Name | Value
---- | -----
`All` | `"all"`
`StencilOnly` | `"stencil-only"`
`DepthOnly` | `"depth-only"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputextureaspect>

### GPUTextureDimension

**Members:**

Name | Value
---- | -----
`_1D` | `"1d"`
`_2D` | `"2d"`
`_3D` | `"3d"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputexturedimension>

### GPUTextureFormat

**Members:**

Name | Value
---- | -----
`R8unorm` | `"r8unorm"`
`R8snorm` | `"r8snorm"`
`R8uint` | `"r8uint"`
`R8sint` | `"r8sint"`
`R16uint` | `"r16uint"`
`R16sint` | `"r16sint"`
`R16float` | `"r16float"`
`Rg8unorm` | `"rg8unorm"`
`Rg8snorm` | `"rg8snorm"`
`Rg8uint` | `"rg8uint"`
`Rg8sint` | `"rg8sint"`
`R32uint` | `"r32uint"`
`R32sint` | `"r32sint"`
`R32float` | `"r32float"`
`Rg16uint` | `"rg16uint"`
`Rg16sint` | `"rg16sint"`
`Rg16float` | `"rg16float"`
`Rgba8unorm` | `"rgba8unorm"`
`Rgba8unormSrgb` | `"rgba8unorm-srgb"`
`Rgba8snorm` | `"rgba8snorm"`
`Rgba8uint` | `"rgba8uint"`
`Rgba8sint` | `"rgba8sint"`
`Bgra8unorm` | `"bgra8unorm"`
`Bgra8unormSrgb` | `"bgra8unorm-srgb"`
`Rgb9e5ufloat` | `"rgb9e5ufloat"`
`Rgb10a2unorm` | `"rgb10a2unorm"`
`Rg11b10ufloat` | `"rg11b10ufloat"`
`Rg32uint` | `"rg32uint"`
`Rg32sint` | `"rg32sint"`
`Rg32float` | `"rg32float"`
`Rgba16uint` | `"rgba16uint"`
`Rgba16sint` | `"rgba16sint"`
`Rgba16float` | `"rgba16float"`
`Rgba32uint` | `"rgba32uint"`
`Rgba32sint` | `"rgba32sint"`
`Rgba32float` | `"rgba32float"`
`Stencil8` | `"stencil8"`
`Depth16unorm` | `"depth16unorm"`
`Depth24plus` | `"depth24plus"`
`Depth24plusStencil8` | `"depth24plus-stencil8"`
`Depth32float` | `"depth32float"`
`Depth32floatStencil8` | `"depth32float-stencil8"`
`Bc1RgbaUnorm` | `"bc1-rgba-unorm"`
`Bc1RgbaUnormSrgb` | `"bc1-rgba-unorm-srgb"`
`Bc2RgbaUnorm` | `"bc2-rgba-unorm"`
`Bc2RgbaUnormSrgb` | `"bc2-rgba-unorm-srgb"`
`Bc3RgbaUnorm` | `"bc3-rgba-unorm"`
`Bc3RgbaUnormSrgb` | `"bc3-rgba-unorm-srgb"`
`Bc4RUnorm` | `"bc4-r-unorm"`
`Bc4RSnorm` | `"bc4-r-snorm"`
`Bc5RgUnorm` | `"bc5-rg-unorm"`
`Bc5RgSnorm` | `"bc5-rg-snorm"`
`Bc6hRgbUfloat` | `"bc6h-rgb-ufloat"`
`Bc6hRgbFloat` | `"bc6h-rgb-float"`
`Bc7RgbaUnorm` | `"bc7-rgba-unorm"`
`Bc7RgbaUnormSrgb` | `"bc7-rgba-unorm-srgb"`
`Etc2Rgb8unorm` | `"etc2-rgb8unorm"`
`Etc2Rgb8unormSrgb` | `"etc2-rgb8unorm-srgb"`
`Etc2Rgb8a1unorm` | `"etc2-rgb8a1unorm"`
`Etc2Rgb8a1unormSrgb` | `"etc2-rgb8a1unorm-srgb"`
`Etc2Rgba8unorm` | `"etc2-rgba8unorm"`
`Etc2Rgba8unormSrgb` | `"etc2-rgba8unorm-srgb"`
`EacR11unorm` | `"eac-r11unorm"`
`EacR11snorm` | `"eac-r11snorm"`
`EacRg11unorm` | `"eac-rg11unorm"`
`EacRg11snorm` | `"eac-rg11snorm"`
`Astc4X4Unorm` | `"astc-4x4-unorm"`
`Astc4X4UnormSrgb` | `"astc-4x4-unorm-srgb"`
`Astc5X4Unorm` | `"astc-5x4-unorm"`
`Astc5X4UnormSrgb` | `"astc-5x4-unorm-srgb"`
`Astc5X5Unorm` | `"astc-5x5-unorm"`
`Astc5X5UnormSrgb` | `"astc-5x5-unorm-srgb"`
`Astc6X5Unorm` | `"astc-6x5-unorm"`
`Astc6X5UnormSrgb` | `"astc-6x5-unorm-srgb"`
`Astc6X6Unorm` | `"astc-6x6-unorm"`
`Astc6X6UnormSrgb` | `"astc-6x6-unorm-srgb"`
`Astc8X5Unorm` | `"astc-8x5-unorm"`
`Astc8X5UnormSrgb` | `"astc-8x5-unorm-srgb"`
`Astc8X6Unorm` | `"astc-8x6-unorm"`
`Astc8X6UnormSrgb` | `"astc-8x6-unorm-srgb"`
`Astc8X8Unorm` | `"astc-8x8-unorm"`
`Astc8X8UnormSrgb` | `"astc-8x8-unorm-srgb"`
`Astc10X5Unorm` | `"astc-10x5-unorm"`
`Astc10X5UnormSrgb` | `"astc-10x5-unorm-srgb"`
`Astc10X6Unorm` | `"astc-10x6-unorm"`
`Astc10X6UnormSrgb` | `"astc-10x6-unorm-srgb"`
`Astc10X8Unorm` | `"astc-10x8-unorm"`
`Astc10X8UnormSrgb` | `"astc-10x8-unorm-srgb"`
`Astc10X10Unorm` | `"astc-10x10-unorm"`
`Astc10X10UnormSrgb` | `"astc-10x10-unorm-srgb"`
`Astc12X10Unorm` | `"astc-12x10-unorm"`
`Astc12X10UnormSrgb` | `"astc-12x10-unorm-srgb"`
`Astc12X12Unorm` | `"astc-12x12-unorm"`
`Astc12X12UnormSrgb` | `"astc-12x12-unorm-srgb"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputextureformat>

### GPUTextureSampleType

**Members:**

Name | Value
---- | -----
`Float` | `"float"`
`UnfilterableFloat` | `"unfilterable-float"`
`Depth` | `"depth"`
`Sint` | `"sint"`
`Uint` | `"uint"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputexturesampletype>

### GPUTextureUsage

**Members:**

Name | Value
---- | -----
`COPY_SRC` | `0x01`
`COPY_DST` | `0x02`
`TEXTURE_BINDING` | `0x04`
`STORAGE_BINDING` | `0x08`
`RENDER_ATTACHMENT` | `0x10`

**Links:** <https://gpuweb.github.io/gpuweb/#namespacedef-gputextureusage>

### GPUTextureViewDimension

**Members:**

Name | Value
---- | -----
`_1D` | `"1d"`
`_2D` | `"2d"`
`_2DArray` | `"2d-array"`
`Cube` | `"cube"`
`CubeArray` | `"cube-array"`
`_3D` | `"3d"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gputextureviewdimension>

### GPUVertexFormat

**Members:**

Name | Value
---- | -----
`Uint8x2` | `"uint8x2"`
`Uint8x4` | `"uint8x4"`
`Sint8x2` | `"sint8x2"`
`Sint8x4` | `"sint8x4"`
`Unorm8x2` | `"unorm8x2"`
`Unorm8x4` | `"unorm8x4"`
`Snorm8x2` | `"snorm8x2"`
`Snorm8x4` | `"snorm8x4"`
`Uint16x2` | `"uint16x2"`
`Uint16x4` | `"uint16x4"`
`Sint16x2` | `"sint16x2"`
`Sint16x4` | `"sint16x4"`
`Unorm16x2` | `"unorm16x2"`
`Unorm16x4` | `"unorm16x4"`
`Snorm16x2` | `"snorm16x2"`
`Snorm16x4` | `"snorm16x4"`
`Float16x2` | `"float16x2"`
`Float16x4` | `"float16x4"`
`Float32` | `"float32"`
`Float32x2` | `"float32x2"`
`Float32x3` | `"float32x3"`
`Float32x4` | `"float32x4"`
`Uint32` | `"uint32"`
`Uint32x2` | `"uint32x2"`
`Uint32x3` | `"uint32x3"`
`Uint32x4` | `"uint32x4"`
`Sint32` | `"sint32"`
`Sint32x2` | `"sint32x2"`
`Sint32x3` | `"sint32x3"`
`Sint32x4` | `"sint32x4"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuvertexformat>

### GPUVertexStepMode

**Members:**

Name | Value
---- | -----
`Vertex` | `"vertex"`
`Instance` | `"instance"`

**Links:** <https://gpuweb.github.io/gpuweb/#enumdef-gpuvertexstepmode>
