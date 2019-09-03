# This file is a part of H3DDetectorSystems.jl, licensed under the MIT License (MIT).

__precompile__(true)

module H3DDetectorSystems

using Sockets

using ArraysOfArrays
using BufferedStreams
using Tables
using TypedTables
using Unitful

using LegendDataTypes: readdata, writedata
using LegendHDF5IO
import HDF5

include("polaris_data.jl")
include("datastream.jl")
include("polaris_detector.jl")
include("czt.jl")

end # module
