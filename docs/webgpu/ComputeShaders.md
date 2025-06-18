# ComputeShaders

## Table of Contents

* [Structs](#structs)
  * [ComputeBuffer](#computebuffer)
    * [ComputeBuffer.destroy](#computebufferdestroy)
    * [ComputeBuffer.fromBuffer](#computebufferfrombuffer)
    * [ComputeBuffer.fromFloatArray](#computebufferfromfloatarray)
    * [ComputeBuffer.fromIntArray](#computebufferfromintarray)
    * [ComputeBuffer.isMutable](#computebufferismutable)
    * [ComputeBuffer.isReadable](#computebufferisreadable)
    * [ComputeBuffer.size](#computebuffersize)
    * [ComputeBuffer.toBuffer](#computebuffertobuffer)
    * [ComputeBuffer.toFloatArray](#computebuffertofloatarray)
    * [ComputeBuffer.toIntArray](#computebuffertointarray)
  * [ComputeShader](#computeshader)
    * [ComputeShader.__addUniform](#computeshader__adduniform)
    * [ComputeShader.destroy](#computeshaderdestroy)
    * [ComputeShader.dispatch](#computeshaderdispatch)
    * [ComputeShader.dispatchAsync](#computeshaderdispatchasync)
    * [ComputeShader.dispatchIndirect](#computeshaderdispatchindirect)
    * [ComputeShader.dispatchIndirectAsync](#computeshaderdispatchindirectasync)
    * [ComputeShader.getCompilationInfo](#computeshadergetcompilationinfo)
    * [ComputeShader.getUniform](#computeshadergetuniform)
    * [ComputeShader.isCompiled](#computeshaderiscompiled)
    * [ComputeShader.setBuffer](#computeshadersetbuffer)
    * [ComputeShader.setFloat](#computeshadersetfloat)
    * [ComputeShader.setFloatArray](#computeshadersetfloatarray)
    * [ComputeShader.setFloatBuffer](#computeshadersetfloatbuffer)
    * [ComputeShader.setInt](#computeshadersetint)
    * [ComputeShader.setIntArray](#computeshadersetintarray)
    * [ComputeShader.setIntBuffer](#computeshadersetintbuffer)
    * [ComputeShader.setMatrix](#computeshadersetmatrix)
    * [ComputeShader.setMatrixArray](#computeshadersetmatrixarray)
    * [ComputeShader.setTexture](#computeshadersettexture)
    * [ComputeShader.workgroupSizeX](#computeshaderworkgroupsizex)
    * [ComputeShader.workgroupSizeY](#computeshaderworkgroupsizey)
    * [ComputeShader.workgroupSizeZ](#computeshaderworkgroupsizez)
  * [ShaderUniform](#shaderuniform)
    * [ShaderUniform.binding](#shaderuniformbinding)
    * [ShaderUniform.group](#shaderuniformgroup)
    * [ShaderUniform.name](#shaderuniformname)
    * [ShaderUniform.offset](#shaderuniformoffset)
    * [ShaderUniform.size](#shaderuniformsize)
    * [ShaderUniform.subtype](#shaderuniformsubtype)
    * [ShaderUniform.type](#shaderuniformtype)
* [Enums](#enums)
  * [ShaderUniformType](#shaderuniformtype)

## Structs

### ComputeBuffer

A struct representing a GPU buffer used for transferring data between the CPU and compute shaders. It can also be utilized in [indirect dispatch](#computeshaderdispatchindirect) to define the number of workgroups to be spawned.

**Syntax:**

```gml
new ComputeBuffer(size, [isReadable], [isMutable])
```

**Params:**

Name        | Type    | Optional | Description
------------|---------|----------|------------
size        | `Real`  | ❌       | Size of the buffer in bytes.
isReadable  | `Bool`  | ✅       | Indicates if the buffer can be read back by the CPU. Defaults to `false`.
isMutable   | `Bool`  | ✅       | Indicates if data can be uploaded to the buffer from the CPU after the initial upload. Defaults to `false`.

**Returns:** [ComputeBuffer](#computebuffer)

**Note:**

The `isReadable` and `isMutable` parameters default to `false` to optimize storage and performance. Modify these only when necessary.

#### ComputeBuffer.destroy

**Syntax:**

A method of the [ComputeBuffer](#computebuffer) struct that releases the buffer and frees its allocated memory.

```gml
destroy()
```

**Returns:** N/A

#### ComputeBuffer.fromBuffer

A method of the [ComputeBuffer](#computebuffer) struct that uploads data from a CPU buffer to the GPU buffer. This can be used for the initial data upload or for subsequent uploads if the buffer was created with `isMutable` set to `true`. This is a blocking call, meaning the function waits until the operation completes.

**Syntax:**

```gml
fromBuffer(buffer, [bufferOffset], [size], [offset])
```

**Params:**

Name          | Type        | Optional | Description
--------------|-------------|----------|------------
buffer        | `Id.Buffer` | ❌       | The source buffer to copy data from.
bufferOffset  | `Real`      | ✅       | Byte offset within the source buffer to start copying from. Defaults to 0.
size          | `Real`      | ✅       | Number of bytes to copy. Defaults to the entire buffer size minus offset.
offset        | `Real`      | ✅       | Byte offset within the compute buffer to start copying to. Defaults to 0.

**Returns:** N/A

**Example:**

```gml
var bufferSize = buffer_sizeof(buffer_f32) * 4; // Fits four 32-bit floats

// Create a CPU buffer and write sequence of floats into it
var sourceBuffer = buffer_create(bufferSize, buffer_fixed, 1);
buffer_write(sourceBuffer, buffer_f32, 0.5);
buffer_write(sourceBuffer, buffer_f32, 1.5);
buffer_write(sourceBuffer, buffer_f32, 2.5);
buffer_write(sourceBuffer, buffer_f32, 3.5);

// Create an immutable GPU buffer and upload its initial data
immutableBuffer = new ComputeBuffer(bufferSize);
immutableBuffer.fromBuffer(sourceBuffer);
//immutableBuffer.fromBuffer(sourceBuffer); // This would cause an error!

// Create a GPU buffer that cannot be read on the CPU, but can be muted
mutableBuffer = new ComputeBuffer(bufferSize, false, true);
mutableBuffer.fromBuffer(sourceBuffer); // Initial upload
// We could change the contents of sourceBuffer here...
mutableBuffer.fromBuffer(sourceBuffer); // Works! Subsequent uploads allowed

// Don't forget to destroy the buffers when they're no longer needed
buffer_delete(sourceBuffer);
immutableBuffer.destroy();
mutableBuffer.destroy();
```

#### ComputeBuffer.fromFloatArray

A method of the [ComputeBuffer](#computebuffer) struct that uploads an array of floats to the GPU buffer. This can be used for the initial data upload or for subsequent uploads if the buffer was created with `isMutable` set to `true`. This is a blocking call, meaning the function waits until the operation completes.

**Syntax:**

```gml
fromFloatArray(array, [arrayOffset], [count], [offset])
```

**Params:**

Name        | Type     | Optional | Description
------------|----------|----------|------------
array       | `Array`  | ❌       | Source array to copy values from.
arrayOffset | `Real`   | ✅       | Index in the source array to begin copying from. Defaults to 0.
count       | `Real`   | ✅       | Number of values to copy. Defaults to the array's full size minus offset.
offset      | `Real`   | ✅       | Byte offset within the compute buffer to start copying to. Defaults to 0.

**Returns:** N/A

**Example:**

```gml
var bufferSize = buffer_sizeof(buffer_f32) * 4; // Fits four 32-bit floats

// Create an array of floats
var sourceArray = [0.5, 1.5, 2.5, 3.5];

// Create an immutable GPU buffer and upload its initial data
immutableBuffer = new ComputeBuffer(bufferSize);
immutableBuffer.fromFloatArray(sourceBuffer);
//immutableBuffer.fromFloatArray(sourceBuffer); // This would cause an error!

// Create a GPU buffer that cannot be read on the CPU, but can be muted
mutableBuffer = new ComputeBuffer(bufferSize, false, true);
mutableBuffer.fromFloatArray(sourceBuffer); // Initial upload
// We could change the contents of sourceBuffer here...
mutableBuffer.fromFloatArray(sourceBuffer); // Works! Subsequent uploads allowed

// Don't forget to destroy the buffers when they're no longer needed
immutableBuffer.destroy();
mutableBuffer.destroy();
```

#### ComputeBuffer.fromIntArray

A method of the [ComputeBuffer](#computebuffer) struct that uploads an array of integers to the GPU buffer. This can be used for the initial data upload or for subsequent uploads if the buffer was created with `isMutable` set to `true`. This is a blocking call, meaning the function waits until the operation completes.

**Syntax:**

```gml
fromIntArray(array, [arrayOffset], [count], [offset])
```

**Params:**

Name        | Type     | Optional | Description
------------|----------|----------|------------
array       | `Array`  | ❌       | Source array to copy values from.
arrayOffset | `Real`   | ✅       | Index in the source array to begin copying from. Defaults to 0.
count       | `Real`   | ✅       | Number of values to copy. Defaults to the array's full size minus offset.
offset      | `Real`   | ✅       | Byte offset within the compute buffer to start copying to. Defaults to 0.

**Returns:** N/A

**Example:**

```gml
var bufferSize = buffer_sizeof(buffer_s32) * 4; // Fits four 32-bit signed integers

// Create an array of floats
var sourceArray = [0, 1, 2, 3];

// Create an immutable GPU buffer and upload its initial data
immutableBuffer = new ComputeBuffer(bufferSize);
immutableBuffer.fromIntArray(sourceBuffer);
//immutableBuffer.fromIntArray(sourceBuffer); // This would cause an error!

// Create a GPU buffer that cannot be read on the CPU, but can be muted
mutableBuffer = new ComputeBuffer(bufferSize, false, true);
mutableBuffer.fromIntArray(sourceBuffer); // Initial upload
// We could change the contents of sourceBuffer here...
mutableBuffer.fromIntArray(sourceBuffer); // Works! Subsequent uploads allowed

// Don't forget to destroy the buffers when they're no longer needed
immutableBuffer.destroy();
mutableBuffer.destroy();
```

#### ComputeBuffer.isMutable

A read-only property of the [ComputeBuffer](#computebuffer) struct that indicates whether data can be uploaded to the buffer after the initial upload using the methods [fromBuffer](#computebufferfrombuffer), [fromFloatArray](#computebufferfromfloatarray), or [fromIntArray](#computebufferfromintarray) (`true`), or not (`false`).

**Type:** `Bool`

**Example:**

```gml
buffer1 = new ComputeBuffer(bufferSize, false, true);
show_debug_message($"Mutable: {buffer1.isMutable}"); // Prints "Mutable: 1"
buffer2 = new ComputeBuffer(bufferSize, false, false);
show_debug_message($"Mutable: {buffer2.isMutable}"); // Prints "Mutable: 0"

buffer1.fromFloatArray(arrayOfFloats); // Initial upload
buffer1.fromFloatArray(arrayOfFloats); // Works!

buffer2.fromFloatArray(arrayOfFloats); // Initial upload
buffer2.fromFloatArray(arrayOfFloats); // ERROR - buffer2 is not mutable!
```

#### ComputeBuffer.isReadable

A read-only property of the [ComputeBuffer](#computebuffer) struct that indicates whether the buffer can be read by the CPU using the methods [toBuffer](#computebuffertobuffer), [toFloatArray](#computebuffertofloatarray), or [toIntArray](#computebuffertointarray) (`true`), or not (`false`).

**Type:** `Bool`

**Example:**

```gml
buffer1 = new ComputeBuffer(bufferSize, true);
show_debug_message($"Readable: {buffer1.isReadable}"); // Prints "Readable: 1"
buffer2 = new ComputeBuffer(bufferSize, false);
show_debug_message($"Readable: {buffer2.isReadable}"); // Prints "Readable: 0"

var buffer1Data = buffer1.toFloatArray(); // Works!
var buffer2Data = buffer2.toFloatArray(); // ERROR - buffer2 is not readable!
```

#### ComputeBuffer.size

A read-only property of the [ComputeBuffer](#computebuffer) struct that holds the size of the buffer in bytes.

**Type:** `Real`

**Example:**

The following example creates a buffer that fits the entire contents of  `computeBuffer`.

```gml
buffer_create(computeBuffer.size, buffer_fixed, 1);
```

#### ComputeBuffer.toBuffer

A method of the [ComputeBuffer](#computebuffer) struct that copies data from the buffer into a CPU buffer, if the buffer was created with `isReadable` set to `true`, otherwise ends with an error. This is a blocking call, meaning the function waits until the operation completes.

**Syntax:**

```gml
toBuffer(buffer, [bufferOffset], [size], [offset])
```

**Params:**

Name          | Type        | Optional | Description
--------------|-------------|----------|------------
buffer        | `Id.Buffer` | ❌       | The destination buffer to copy data to.
bufferOffset  | `Real`      | ✅       | Byte offset within the destination buffer to start copying to. Defaults to 0.
size          | `Real`      | ✅       | Number of bytes to copy. Defaults to the entire compute buffer size minus offset.
offset        | `Real`      | ✅       | Byte offset within the compute buffer to start copying from. Defaults to 0.

**Returns:** N/A

**Example:**

```gml
if (computeBufer.isReadable) {
  var destinationBuffer = buffer_create(computeBuffer.size, buffer_fixed, 1);
  computeBuffer.toBuffer(destinationBuffer);
  // Use data from destinationBuffer...
  buffer_delete(destinationBuffer);
}
```

#### ComputeBuffer.toFloatArray

A method of the [ComputeBuffer](#computebuffer) struct that copies data interpreted as integers from the buffer to an array, provided the buffer was created with `isReadable` set to `true`, otherwise ends with an error. This is a blocking call, meaning the function waits until the operation completes.

**Syntax:**

```gml
toFloatArray(buffer, [count], [offset])
```

**Params:**

Name          | Type        | Optional | Description
--------------|-------------|----------|------------
count         | `Real`      | ✅       | Number of integers to copy. Defaults to the maximum number of integers that can fit in the compute buffer from the specified offset.
offset        | `Real`      | ✅       | Byte offset within the compute buffer to start copying from. Defaults to 0.

**Returns:** `Array<Real>`

**Example:**

```gml
if (computeBuffer.isReadable) {
  var intArray = computeBuffer.toIntArray();
  // Use data from intArray...
}
```

#### ComputeBuffer.toIntArray

A method of the [ComputeBuffer](#computebuffer) struct that copies data interpreted as floats from the buffer to an array, provided the buffer was created with `isReadable` set to `true`, otherwise ends with an error. This is a blocking call, meaning the function waits until the operation completes.

**Syntax:**

```gml
toIntArray(buffer, [count], [offset])
```

**Params:**

Name          | Type        | Optional | Description
--------------|-------------|----------|------------
count         | `Real`      | ✅       | Number of floats to copy. Defaults to the maximum number of floats that can fit in the compute buffer from the specified offset.
offset        | `Real`      | ✅       | Byte offset within the compute buffer to start copying from. Defaults to 0.

**Returns:** `Array<Real>`

**Example:**

```gml
if (computeBuffer.isReadable) {
  var floatArray = computeBuffer.toFloatArray();
  // Use data from floatArray...
}
```

### ComputeShader

A struct representing a compute shader.

**Syntax:**

```gml
new ComputeShader(code, [main], [constants])
```

**Params:**

Name      | Type     | Optional | Description
----------|----------|----------|------------
code      | `String` | ❌       | The source code of the compute shader in [WGSL](https://www.w3.org/TR/WGSL/).
main      | `String` | ✅       | The name of the compute shader's entry point. Defaults to "main".
constants | `Struct` | ✅       | A struct that defines the names of constants within the compute shader to be redefined along with their new values.

**Returns:** [ComputeShader](#computeshader)

#### ComputeShader.__addUniform

A method of the [ComputeShader](#computeshader) struct that adds a uniform to the compute shader, allowing it to be retrieved using [ComputeShader.getUniform](#computeshadergetuniform). **Note: This is a temporary solution until automatic shader parsing is implemented.**

**Syntax:**

```gml
__addUniform(desc)
```

**Params:**

Name      | Type     | Optional | Description
----------|----------|----------|------------
desc      | `Struct` | ❌       | A struct that contains the description of the uniform. Refer to the section below for its details.

**Shader uniform description struct:**

Key     | Type                                    | Optional | Description
--------|-----------------------------------------|----------|------------
name    | `String`                                | ❌       | The name of the uniform.
type    | [ShaderUniformType](#shaderuniformtype) | ❌       | The type of the shader uniform.
subtype | [ShaderUniformType](#shaderuniformtype) | ✅       | If the type is ARRAY, this specifies the type of values contained in the array; otherwise, it is unused. Defaults to NONE.
group   | `Real`                                  | ❌       | The uniform's bind group index, as defined with `@group(N)` in the compute shader.
binding | `Real`                                  | ❌       | The uniform's binding index, as defined with `@binding(N)` in the compute shader.
size    | `Real`                                  | ✅       | The size of the uniform in bytes. Required only when the type is ARRAY. Defaults to 0.
offset  | `Real`                                  | ✅       | The offset from the start of the struct that contains this uniform. Defaults to 0.

**Returns:** N/A

#### ComputeShader.destroy

A method of the [ComputeShader](#computeshader) struct that destroys the compute shader.

**Syntax:**

```gml
destroy()
```

**Returns:** N/A

#### ComputeShader.dispatch

A method of the [ComputeShader](#computeshader) struct that submits the compute shader for execution using given number of workgroups along the X, Y, and Z axes. This is a blocking call, meaning the function waits until the compute shader finishes.

**Syntax:**

```gml
dispatch(x, [y], [z])
```

**Params:**

Name    | Type    | Optional | Description
--------|---------|----------|---------------------------------------------------------
x       | `Real`  | ❌       | The number of workgroups to dispatch along the X axis.
y       | `Real`  | ✅       | The number of workgroups to dispatch along the Y axis. Defaults to 1.
z       | `Real`  | ✅       | The number of workgroups to dispatch along the Z axis. Defaults to 1.

**Returns:** N/A

#### ComputeShader.dispatchAsync

A method of the [ComputeShader](#computeshader) struct that submits the compute shader for execution using given number of workgroups along the X, Y, and Z axes. This function is not blocking, instead it takes a callback function that is executed when the compute shader finishes.

**Syntax:**

```gml
dispatchAsync(x, [y], [z], [callback])
```

**Params:**

Name     | Type       | Optional | Description
---------|------------|----------|---------------------------------------------------------
x        | `Real`     | ❌       | The number of workgroups to dispatch along the X axis.
y        | `Real`     | ✅       | The number of workgroups to dispatch along the Y axis. Defaults to 1.
z        | `Real`     | ✅       | The number of workgroups to dispatch along the Z axis. Defaults to 1.
callback | `Function` | ✅       | The function to execute when the compute shader finishes.

**Returns:** N/A

#### ComputeShader.dispatchIndirect

A method of the [ComputeShader](#computeshader) struct that submits the compute shader for execution, reading the X, Y and Z dimensions of workgroups to be spawned from a [ComputeBuffer](#computebuffer). This is a blocking call, meaning the function waits until the compute shader finishes.

**Syntax:**

```gml
dispatchIndirect(buffer, offset)
```

**Params:**

Name   | Type                            | Optional | Description
-------|---------------------------------|----------|------------
buffer | [ComputeBuffer](#computebuffer) | ❌       | The compute buffer containing the X, Y, and Z dimensions for the workgroups. These values must be stored as three consecutive 32-bit unsigned integers.
offset | `Real`                          | ❌       | The byte offset within the compute buffer where the workgroup dimensions start.

**Returns:** N/A

#### ComputeShader.dispatchIndirectAsync

A method of the [ComputeShader](#computeshader) struct that submits the compute shader for execution, reading the X, Y and Z dimensions of workgroups to be spawned from a [ComputeBuffer](#computebuffer). This function is not blocking, instead it takes a callback function that is executed when the compute shader finishes.

**Syntax:**

```gml
dispatchIndirectAsync(buffer, offset, [callback])
```

**Params:**

Name     | Type                            | Optional | Description
---------|---------------------------------|----------|------------
buffer   | [ComputeBuffer](#computebuffer) | ❌       | The compute buffer containing the X, Y, and Z dimensions for the workgroups. These values must be stored as three consecutive 32-bit unsigned integers.
offset   | `Real`                          | ❌       | The byte offset within the compute buffer where the workgroup dimensions start.
callback | `Function`                      | ✅       | The function to execute when the compute shader finishes.

**Returns:** N/A

#### ComputeShader.getCompilationInfo

A method of the [ComputeShader](#computeshader) struct that retrieves an array of info, warning and error messages generated during the shader's compilation.

**Syntax:**

```gml
getCompilationInfo()
```

**Returns:** `Array`

Each entry of the returned array is struct with the following keys:

* `type` - The type of message. Possible values are "info", "warning", or "error".
* `message` - The message text.
* `lineNumber` - The line in the shader's source code that the message refers.
* `linePosition` - The position on the line that the message refers to.

#### ComputeShader.getUniform

A method of the [ComputeShader](#computeshader) struct that retrieves a [ShaderUniform](#shaderuniform) by its name. The returned uniform can then be used in `ComputeShader.set*` methods to modify its value.

**Syntax:**

```gml
getUniform(name)
```

**Params:**

Name | Type     | Optional | Description
-----|----------|----------|------------
name | `String` | ❌       | The name of the uniform.

**Returns:** [ShaderUniform](#shaderuniform)

#### ComputeShader.isCompiled

A read-only property of the [ComputeShader](#computeshader) struct that tells whether the shader was successfully compiled (`true`) or not (`false`).

**Type:** `Bool`

#### ComputeShader.setBuffer

A method of the [ComputeShader](#computeshader) struct that binds a [ComputeBuffer](#computebuffer) to the specified [ShaderUniform](#shaderuniform). This updates the uniform with the new buffer, allowing it to be used during compute shader execution.

**Syntax:**

```gml
setBuffer(uniform, buffer)
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform whose value will be updated.
buffer  | [ComputeBuffer](#computebuffer) | ❌       | The compute buffer to bind as the new value for the uniform.

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.setFloat

A method of the [ComputeShader](#computeshader) struct that sets a floating-point value for the specified [ShaderUniform](#shaderuniform). This updates the uniform with the provided float, allowing it to be used during compute shader execution.

**Syntax:**

```gml
setFloat(uniform, value)
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform to be updated with a new value.
value   | `Real`                          | ❌       | The new floating-point value to assign to the uniform.

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.setFloatArray

A method of the [ComputeShader](#computeshader) struct that sets an array of floating-point values for the specified [ShaderUniform](#shaderuniform). The provided array is uploaded to the uniform, allowing it to be used during compute shader execution.

**Syntax:**

```gml
setFloatArray(uniform, array, [offset], [count])
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform to be updated with the new array of values.
array   | `Array<Real>`                   | ❌       | The new array of floating-point values to assign to the uniform.
offset  | `Real`                          | ✅       | The offset within the array indicating where to start reading values. Defaults to 0 if not specified.
count   | `Real`                          | ✅       | The number of values to read from the array. Defaults to the length of the array minus offset if not specified.

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.setFloatBuffer

A method of the [ComputeShader](#computeshader) struct that reads an array of floating-point values from a CPU-side buffer and sets them for the specified [ShaderUniform](#shaderuniform). The `offset` parameter specifies the starting position within the buffer, and `count` defines the number of floats to be read and uploaded to the uniform for use during compute shader execution.

**Syntax:**

```gml
setFloatBuffer(uniform, buffer, offset, count)
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform to be updated with the new array of values.
buffer  | `Id.Buffer`                     | ❌       | The buffer from which to read an array of floating-point values.
offset  | `Real`                          | ❌       | The byte offset within the buffer indicating where to start reading values.
count   | `Real`                          | ❌       | The number of floating-point values to read from the buffer.

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.setInt

A method of the [ComputeShader](#computeshader) struct that sets an integer value for the specified [ShaderUniform](#shaderuniform). This updates the uniform with the provided integer, allowing it to be used during compute shader execution.

**Syntax:**

```gml
setInt(uniform, value)
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform whose value will be updated.
value   | `Real`                          | ❌       | The new integer value to assign to the uniform.

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.setIntArray

A method of the [ComputeShader](#computeshader) struct that sets an array of integer values for the specified [ShaderUniform](#shaderuniform). The provided array is uploaded to the uniform, allowing it to be used during compute shader execution.

**Syntax:**

```gml
setIntArray(uniform, array, [offset], [count])
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform to be updated with the new array of values.
array   | `Array<Real>`                   | ❌       | The new array of integer values to assign to the uniform.
offset  | `Real`                          | ✅       | The offset within the array indicating where to start reading values. Defaults to 0 if not specified.
count   | `Real`                          | ✅       | The number of values to read from the array. Defaults to the length of the array minus offset if not specified.

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.setIntBuffer

A method of the [ComputeShader](#computeshader) struct that reads an array of integer values from a CPU-side buffer and sets them for the specified [ShaderUniform](#shaderuniform). The `offset` parameter specifies the starting position within the buffer, and `count` defines the number of integers to be read and uploaded to the uniform for use during compute shader execution.

**Syntax:**

```gml
setIntBuffer(uniform, buffer, offset, count)
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform to be updated with the new array of values.
buffer  | `Id.Buffer`                     | ❌       | The buffer from which to read an array of integer values.
offset  | `Real`                          | ❌       | The byte offset within the buffer indicating where to start reading values.
count   | `Real`                          | ❌       | The number of integer values to read from the buffer.

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.setMatrix

A method of the [ComputeShader](#computeshader) struct that updates specified [ShaderUniform](#shaderuniform) with the current transform matrix.

**Syntax:**

```gml
setMatrix(uniform)
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform to be updated with the matrix.

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.setMatrixArray

A method of the [ComputeShader](#computeshader) struct that updates specified [ShaderUniform](#shaderuniform) with given matrix.

**Syntax:**

```gml
setMatrixArray(uniform, matrix)
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform to be updated with the matrix.
matrix  | `Array<Real>`                   | ❌       | The matrix to update the uniform with. Must be an array of 16 numbers!

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.setTexture

A method of the [ComputeShader](#computeshader) struct that binds a texture to the specified [ShaderUniform](#shaderuniform). This updates the uniform with the provided texture, allowing it to be accessed during compute shader execution.

**Syntax:**

```gml
setTexture(uniform, texture)
```

**Params:**

Name    | Type                            | Optional | Description
--------|---------------------------------|----------|-------------
uniform | [ShaderUniform](#shaderuniform) | ❌       | The shader uniform to be updated with the new texture.
texture | `Pointer.Texture`               | ❌       | The texture to bind to the specified uniform.

**Returns:** N/A

**See also:** [ComputeShader.getUniform](#computeshadergetuniform)

#### ComputeShader.workgroupSizeX

A read-only property of the [ComputeShader](#computeshader) struct that represents the size of the workgroup along the X axis, as defined in the shader's source code. **Note: This is not currently implemented and always equals 1!**

**Type:** `Real`

#### ComputeShader.workgroupSizeY

A read-only property of the [ComputeShader](#computeshader) struct that represents the size of the workgroup along the Y axis, as defined in the shader's source code. **Note: This is not currently implemented and always equals 1!**

**Type:** `Real`

#### ComputeShader.workgroupSizeZ

A read-only property of the [ComputeShader](#computeshader) struct that represents the size of the workgroup along the Z axis, as defined in the shader's source code. **Note: This is not currently implemented and always equals 1!**

**Type:** `Real`

### ShaderUniform

A struct that represents a shader uniform. It can be retrieved using [ComputeShader.getUniform](#computeshadergetuniform) and used in `ComputeShader.set*` methods to modify the value of the uniform.

#### ShaderUniform.binding

A read-only property of the [ShaderUniform](#shaderuniform) struct that contains the uniform's binding index.

**Type:** `Real`

#### ShaderUniform.group

A read-only property of the [ShaderUniform](#shaderuniform) struct that contains the uniform's bind group index.

**Type:** `Real`

#### ShaderUniform.name

A read-only property of the [ShaderUniform](#shaderuniform) struct that contains the uniform's name.

**Type:** `String`

#### ShaderUniform.offset

A read-only property of the [ShaderUniform](#shaderuniform) struct that indicates the uniform's offset, in bytes, from the start of the containing struct.

**Type:** `Real`

#### ShaderUniform.size

A read-only property of the [ShaderUniform](#shaderuniform) struct that specifies the uniform's size in bytes.

**Type:** `Real`

#### ShaderUniform.subtype

A read-only property of the [ShaderUniform](#shaderuniform) struct that indicates the type of values contained in an ARRAY uniform; otherwise, it is unused.

**Type:** [ShaderUniformType](#shaderuniformtype)

#### ShaderUniform.type

A read-only property of the [ShaderUniform](#shaderuniform) struct that specifies the type of the uniform.

**Type:** [ShaderUniformType](#shaderuniformtype)

## Enums

### ShaderUniformType

Name    | Value | Description
--------|-------|------------
INVALID | 0     | Indicates that the shader uniform is not valid. Currently unused.
NONE    | 1     | Type not specified. Can only be used in [ShaderUniform.subtype](#shaderuniformsubtype), provided [ShaderUniform.type](#shaderuniformtype) is not ARRAY.
INT32   | 2     | Represents a 32-bit signed integer.
FLOAT32 | 3     | Represents a 32-bit floating-point value.
ARRAY   | 4     | An array of values, with the type defined by [ShaderUniform.subtype](#shaderuniformsubtype).
MAT4    | 5     | Represents a 4x4 matrix of 32-bit floating-point values.
TEXTURE | 6     | Represents a texture.
BUFFER  | 7     | Represents a [compute buffer](#computebuffer).
