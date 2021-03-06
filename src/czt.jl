function get_czt_data(hostname::String, time::Number, basename::String)
    cam = PolarisDetector(hostname)
    get_czt_data(cam, time, basename)
end


function get_czt_data(cam::PolarisDetector, time::Number, basename::String)

    time = Float64(time)

    task_cam =  open(cam) do dev
        read(dev.data_io, PolarisEvents, max_time = time)
    end

    data_raw = Table(convert(NamedTuple, task_cam))

    filename = basename*"-CZT.h5"
    HDF5.h5open(filename, "w") do output
        writedata(output, "data_raw", data_raw)
    end
end


function start_sync_pulses(hostname::String)
    cam = PolarisDetector(hostname)
    start_sync_pulses(cam)
end


function start_sync_pulses(cam::PolarisDetector)
    open(cam) do dev
        dev[Val(:sync_pulse_generation)] = true
    end
    nothing
end


function stop_sync_pulses(hostname::String)
    cam = PolarisDetector(hostname)
    stop_sync_pulses(cam)
end


function stop_sync_pulses(cam::PolarisDetector)
    open(cam) do dev
        dev[Val(:sync_pulse_generation)] = false
        dev[Val(:reset_index)] = ()
    end
    nothing
end



export get_czt_data
export start_sync_pulses
export stop_sync_pulses
