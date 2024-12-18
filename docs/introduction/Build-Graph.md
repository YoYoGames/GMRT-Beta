## Overview

GMRT uses build graphs to avoid coding the platform, build type, and "mode" specific logic, while keeping the raw actions and services the same across all configurations.
This allows GMRT's build process to be configured by users to make changes or to add entirely new steps and jobs to their build.

## BuildGraph

The build graphs are xml files which define a set of jobs, steps, and actions to be performed.

Below is a list of elements which can be defined within a build graph

### Job
Jobs define a set of steps to be performed to achieve a specific result. Jobs to perform are passed into gmrt via the command line and are executed in sequence.
Jobs perform their underlying steps concurrently where possible

Built-in Attributes:
* `Name` - Job name. Used to identify the job and is used when invoking GMRT to specify which jobs are performed
* `Platforms` - `;` delimited set of host platforms on which the job can be run

### Step
Steps define a set of actions to produce one or more results. They may be performed concurrently to other steps. They may require one or more results from actions in other steps in order to start. These "requirements" define the build graph itself for a specific job.
Steps perform their underlying actions in sequence.

Built-in Attributes:
* `Name` - Step name
* `Requires` - `;` delimited set of requirement tags

### Action
Actions are intended to be no state simple actions (though thats not currently true for some - see CompileYYP) which can optionally produce a result. These results can then be required by other steps to begin their processing. Along with the Step requirements, these define the actual nodes and connections of the build graph.

Built-in Attributes:
* `Produces` - A tag which to use to store the action result for use by steps

### Property
A property is a constant defined in the graph for use across the build graph. The same property name can be used in the global scope, job scope, or step scopes and the closet version will be used.

Properties can be referenced by the build graph's templating system. To use a property within a field you can simply define `${PropertyName}` and it will be replaced when the attribute or field is parsed.

Built-in Attributes:
* `Name` - Property name
* `Value` - Property value

### Option
Options are properties with 2 main differences:
* They can only be defined in the global scope of the build graph
* They can be set by automatically created command line options, meaning their values can be passed into GMRT via command line.

Built-in Attributes:
* `Name` - Option name
* `DefaultValue` - Option default value
* `OptionString` - The string to use for the cli options. for example `OptionString='user-email'` will allow for `--user-email=hello` to be used as a command line option for GMRT
* `Pattern` - defines a regex pattern to validate the incoming value and will return an error if the given value does not match the regex

### Tags
Tags cannot be created directly in the build graph, but are used by `Steps` and `Actions` to define the nodes and edges of the build graph.
Tags are string values proceeded by a `#`, e.g. `#BuildTargetResult`.
They are used to define a referenceable ID to the results of actions
They can also be used by the templating system, which will attempt to convert their assigned result to a string value, e.g. `${#BuildTargetResult}`

### Example build graph
```
    <Job Name='Initialise-Build-Target' Platforms='Win64'>
        <Step Name='Initialise-Build-Target'>
            <BuildTargetInitialise Produces='#BuildTargetResult' TargetId='wasm32-browser'/>
        </Step>
        <Step Name='Log-Config' Requires='#BuildTargetResult'>
            <Log Message='#BuildTargetResult'/>
        </Step>
    </Job>
```
This build graph will initialise a build target configuration for the given target id, and then log that target.

Looking at the first action:
`<BuildTargetInitialise Produces='#BuildTargetResult' TargetId='wasm32-browser'/>`
We can see that the `Produces` attribute is set to `#BuildTargetResult`.
`#BuildTargetResult` here is a tag, which can be referenced within the build graph
This is a builtin attribute for all actions. When an action returns its result, it can pass any object back as the result. If nothing is set but the `Produces` is set, then `true` is simply stored instead for that given tag.

Looking at the next step:
`<Step Name='Log-Config' Requires='#BuildTargetResult'>`
We can see that the `Requires` attribute is set to this tag. This indices that the step cannot be started until the `#BuildTargetResult` tag is filled. A step can require multiple tags by `;` delimiting the requirements e.g. `#BuildTargetResult;#CompileResult`

Taking the Log action:
`<Log Message='#BuildTargetResult'/>`
This is an atomic action `Log` which simply prints out a message, it has a `Message` attribute which is the message to be printed.
Here we can see that we're passing in the tagged item `#BuildTargetResult`. In this `Log` action, the value `#BuildTargetResult` will be converted to a string but that may not be the case for other arguments.

## Services

Services are internal components of GMRT and are used by actions. The main goal of services is to provide some distinction between actions and tools used to perform them. They area also intended to be locked while in use, preventing concurrency issues between multiple actions.

An example of this would be the GMCompiler. GMCompiler is not necessarily defined with concurrency in mind, but multiple actions may need to invoke it, which may potentially happen at the same time as the scripts are compiled for a project, but also for extensions.
The GMCService wraps the GMCompiler's functionality behind a service, and provides a way to access that service which locks to service from use until the current action has been completed.

## List of Build Actions

### BuildTargetInitialise
Initialises the build configuration
  - TargetId
  - ConfigTemplates

### BuildTargetConfigSetValue
Sets a specific build configuration property
  - Name
  - Value
  - IsTemplateProperty
  - IsDictionaryProperty
  - DictionaryKey

### CompileYYP
Compiles a given yyp project to a wad.json file and a list of script files
Produces a YYCCompileResult object
  - BuildType
  - ScriptBuildType
  - ScriptExecutionMode
  - ToolchainBinDir
  - ToolchainLibDir
  - BuildCMakeProject
  - TemplatePath
  - AssetCacheDir
  - IsPackageBuild

### GenerateExtensionModules
Generates a GMRT for an extension
  - YYCCompileResult
  - GMCAdditionalArgs

### BuildWAD
Calls the given asset compiler with the given YYCCompileResult to build one or more .wad files
  - YYCCompileResult
  - AssetCompilerPath
  - AssetCompilerAdditionalArgs

### InitialiseGMCompiler
Initialises the GMCompiler (GMC) with the given properties. Produces a Compiler object which can be reused
  - YYCCompileResult
  - GMCAdditionalArgs
  - ScriptExecutionMode
  - BuildType
  - ScriptBuildType
  - ToolchainLibDir

### CompileScriptsAndLinkExecutable
Runs the given Compiler with the scripts extracted into the YYCCompileResult and links the executable
  - Compiler
  - YYCCompileResult

### CompileScriptsToObj
Runs the given Compiler with the scripts extracted into the YYCCompileResult to object files only
  - Compiler
  - YYCCompileResult

### CompileScriptsToGMIR
Runs the given Compiler with the scripts extracted into the YYCCompileResult to GMIR files only
  - Compiler
  - YYCCompileResult

### BuildInterpreter
Builds or copies a gmrt generic interpreter (Runner) to the project build directory
  - Compiler
  - GenericInterpreterDir

### GenerateRunCommandScript
Creates a run command script for the given compiler target. This is used for targets such as emscripten, where it requires external tools to invoke execution of the built output
  - Compiler

### LinkExecutable
Links object files located within the build compile output directory
  - Compiler

### CMakeGenerate
Generates a CMake project capable of compiling and linking script files. This is used to generate a project such as a Visual Studio solution. Use with the CMakeBuild action to invoke cmake build on the generated project, or build the project directly
  - GMCMode
  - YYCCompileResult
  - CMakePath
  - GMCAdditionalArgs
  - ScriptExecutionMode
  - BuildType
  - ScriptBuildType
  - Generator
  - GeneratorPath
  - ClangPath
  - ToolchainBinDir
  - ToolchainLibDir

### CMakeBuild
Calls cmake build on a generated CMake project
  - CMakePath

### BuildAppImage
Builds an AppImage file from the built files within the project build directory
  - BaseAppDir
  - PatchelfPath
  - GensquashfsPath
  - RuntimePath
  - SquashfsCompression

### RunExecutable
Runs the executable in the project build directory
  - AttachDebugger

### PackageExecutable
Packages an executable to a zip file
  - OutputPackagePath

### ParseTargetOptions
Parses the IDE Target options passed into GMRT
  - TargetOptionsPath
  - UserEmail

### SSHUploadFile
Uploads a file using ssh to a target host. Produces an Upload Result object containing the destination of the uploaded file on the host
  - Source
  - Hostname
  - Username
  - Password
  - TemporaryDestination
  - Destination

### SSHRunCommand
Runs a given ssh command
  - Command
  - Hostname
  - Username
  - Password

### Log
Logs a message. The verbosity level defines under what GMRT verbosity the message will be logged
  - Message
  - VerbosityLevel

### PathCombine
Combines a given string and resolves it to a valid path. Parts of the path should be separated by a `;`
  - Paths

### BuildComplete
Logs an output with informs the IDE that the build has been completed. This stops the build timer in the IDE

### Stop
Stops the build. Concurrent process may still finish before fully stopping

### Clean
Clean the build output directory and the asset cache directory