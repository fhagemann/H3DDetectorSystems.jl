function get_czt_data(hostname::String, time::Number, basename::String)
    cam = PolarisDetector(hostname)
    get_czt_data(cam, time, basename)
end


function get_czt_data(cam::PolarisDetector, time::Number, basename::String)
    task_cam =  open(cam) do dev
        read(dev.data_io, PolarisEvents, max_time = time)
    end
end


function start_sync_pulses(cam::PolarisDetector)
    cam = PolarisDetector(hostname)
    start_sync_pulses(cam)
end


function start_sync_pulses(hostname::String)
    open(cam) do dev
        dev[Val(:sync_pulse_generation)] = true
    end
end


function stop_sync_pulses(cam::PolarisDetector)
    open(cam) do dev
        dev[Val(:sync_pulse_generation)] = false
        dev[Val(:reset_index)] = ()
    end
end


function stop_sync_pulses(hostname::String)
    cam = PolarisDetector(hostname)
    reset_sync_pulse_generation(cam)
end

export get_czt_data
export start_sync_pulses
export stop_sync_pulses
