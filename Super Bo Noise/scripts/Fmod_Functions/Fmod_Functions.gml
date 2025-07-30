function fmod_path_bundle(argument0)
{
    if (os_type == os_switch)
        return string("rom:/" + string(working_directory) + string(argument0));
   // else if (os_type == os_android)
       // return string("file:///android_asset/{0}", argument0);
   // else
        //return string("{0}{1}", working_directory, argument0);
}

function fmod_path_user(argument0)
{
    return string(string(game_save_id) + string(argument0));
}

function fmod_error_string(argument0 = fmod_last_result())
{
    switch (argument0)
    {
        case 0:
            return "No errors.";
        
        case 1:
            return "Tried to call a function on a data type that does not allow this type of functionality (ie calling Sound::lock on a streaming sound).";
        
        case 2:
            return "Error trying to allocate a channel.";
        
        case 3:
            return "The specified channel has been reused to play another sound.";
        
        case 4:
            return "DMA Failure.  See debug output for more information.";
        
        case 5:
            return "DSP connection error.  Connection possibly caused a cyclic dependency or connected dsps with incompatible buffer counts.";
        
        case 6:
            return "DSP return code from a DSP process query callback.  Tells mixer not to call the process callback and therefore not consume CPU.  Use this to optimize the DSP graph.";
        
        case 7:
            return "DSP Format error.  A DSP unit may have attempted to connect to this network with the wrong format, or a matrix may have been set with the wrong size if the target unit has a specified channel map.";
        
        case 8:
            return "DSP is already in the mixer's DSP network. It must be removed before being reinserted or released.";
        
        case 9:
            return "DSP connection error.  Couldn't find the DSP unit specified.";
        
        case 10:
            return "DSP operation error.  Cannot perform operation on this DSP as it is reserved by the system.";
        
        case 11:
            return "DSP return code from a DSP process query callback.  Tells mixer silence would be produced from read, so go idle and not consume CPU.  Use this to optimize the DSP graph.";
        
        case 12:
            return "DSP operation cannot be performed on a DSP of this type.";
        
        case 13:
            return "Error loading file.";
        
        case 14:
            return "Couldn't perform seek operation.  This is a limitation of the medium (ie netstreams) or the file format.";
        
        case 15:
            return "Media was ejected while reading.";
        
        case 16:
            return "End of file unexpectedly reached while trying to read essential data (truncated?).";
        
        case 17:
            return "End of current chunk reached while trying to read data.";
        
        case 18:
            return "File not found.";
        
        case 19:
            return "Unsupported file or audio format.";
        
        case 20:
            return "There is a version mismatch between the FMOD header and either the FMOD Studio library or the FMOD Low Level library.";
        
        case 21:
            return "A HTTP error occurred. This is a catch-all for HTTP errors not listed elsewhere.";
        
        case 22:
            return "The specified resource requires authentication or is forbidden.";
        
        case 23:
            return "Proxy authentication is required to access the specified resource.";
        
        case 24:
            return "A HTTP server error occurred.";
        
        case 25:
            return "The HTTP request timed out.";
        
        case 26:
            return "FMOD was not initialized correctly to support this function.";
        
        case 27:
            return "Cannot call this command after System::init.";
        
        case 28:
            return "An error occurred that wasn't supposed to.  Contact support.";
        
        case 29:
            return "Value passed in was a NaN, Inf or denormalized float.";
        
        case 30:
            return "An invalid object handle was used.";
        
        case 31:
            return "An invalid parameter was passed to this function.";
        
        case 32:
            return "An invalid seek position was passed to this function.";
        
        case 33:
            return "An invalid speaker was passed to this function based on the current speaker mode.";
        
        case 34:
            return "The syncpoint did not come from this sound handle.";
        
        case 35:
            return "Tried to call a function on a thread that is not supported.";
        
        case 36:
            return "The vectors passed in are not unit length, or perpendicular.";
        
        case 37:
            return "Reached maximum audible playback count for this sound's soundgroup.";
        
        case 38:
            return "Not enough memory or resources.";
        
        case 39:
            return "Can't use FMOD_RESULT.OPENMEMORY_POINT on non PCM source data, or non mp3/xma/adpcm data if FMOD_RESULT.CREATECOMPRESSEDSAMPLE was used.";
        
        case 40:
            return "Tried to call a command on a 2d sound when the command was meant for 3d sound.";
        
        case 41:
            return "Tried to use a feature that requires hardware support.";
        
        case 42:
            return "Couldn't connect to the specified host.";
        
        case 43:
            return "A socket error occurred.  This is a catch-all for socket-related errors not listed elsewhere.";
        
        case 44:
            return "The specified URL couldn't be resolved.";
        
        case 45:
            return "Operation on a non-blocking socket could not complete immediately.";
        
        case 46:
            return "Operation could not be performed because specified sound/DSP connection is not ready.";
        
        case 47:
            return "Error initializing output device, but more specifically, the output device is already in use and cannot be reused.";
        
        case 48:
            return "Error creating hardware sound buffer.";
        
        case 49:
            return "A call to a standard soundcard driver failed, which could possibly mean a bug in the driver or resources were missing or exhausted.";
        
        case 50:
            return "Soundcard does not support the specified format.";
        
        case 51:
            return "Error initializing output device.";
        
        case 52:
            return "The output device has no drivers installed.  If pre-init, FMOD_RESULT.OUTPUT_NOSOUND is selected as the output mode.  If post-init, the function just fails.";
        
        case 53:
            return "An unspecified error has been returned from a plugin.";
        
        case 54:
            return "A requested output, dsp unit type or codec was not available.";
        
        case 55:
            return "A resource that the plugin requires cannot be allocated or found. (ie the DLS file for MIDI playback)";
        
        case 56:
            return "A plugin was built with an unsupported SDK version.";
        
        case 57:
            return "An error occurred trying to initialize the recording device.";
        
        case 58:
            return "Reverb properties cannot be set on this channel because a parent channelgroup owns the reverb connection.";
        
        case 59:
            return "Specified instance in FMOD_RESULT.REVERB_PROPERTIES couldn't be set. Most likely because it is an invalid instance number or the reverb doesn't exist.";
        
        case 60:
            return "The error occurred because the sound referenced contains subsounds when it shouldn't have, or it doesn't contain subsounds when it should have.  The operation may also not be able to be performed on a parent sound.";
        
        case 61:
            return "This subsound is already being used by another sound, you cannot have more than one parent to a sound.  Null out the other parent's entry first.";
        
        case 62:
            return "Shared subsounds cannot be replaced or moved from their parent stream, such as when the parent stream is an FSB file.";
        
        case 63:
            return "The specified tag could not be found or there are no tags.";
        
        case 64:
            return "The sound created exceeds the allowable input channel count.  This can be increased using the 'maxinputchannels' parameter in System::setSoftwareFormat.";
        
        case 65:
            return "The retrieved string is too long to fit in the supplied buffer and has been truncated.";
        
        case 66:
            return "Something in FMOD hasn't been implemented when it should be! contact support!";
        
        case 67:
            return "This command failed because System::init or System::setDriver was not called.";
        
        case 68:
            return "A command issued was not supported by this object.  Possibly a plugin without certain callbacks specified.";
        
        case 69:
            return "The version number of this file format is not supported.";
        
        case 70:
            return "The specified bank has already been loaded.";
        
        case 71:
            return "The live update connection failed due to the game already being connected.";
        
        case 72:
            return "The live update connection failed due to the game data being out of sync with the tool.";
        
        case 73:
            return "The live update connection timed out.";
        
        case 74:
            return "The requested event, parameter, bus or vca could not be found.";
        
        case 75:
            return "The Studio::System object is not yet initialized.";
        
        case 76:
            return "The specified resource is not loaded, so it can't be unloaded.";
        
        case 77:
            return "An invalid string was passed to this function.";
        
        case 78:
            return "The specified resource is already locked.";
        
        case 79:
            return "The specified resource is not locked, so it can't be unlocked.";
        
        case 80:
            return "The specified recording driver has been disconnected.";
        
        case 81:
            return "The length provided exceeds the allowable limit.";
        
        default:
            return "Unknown error.";
    }
}

function fmod_handle_async_events()
{
    static _async_buffer = buffer_create(2024, buffer_grow, 1);
    
    var _buffer_address = buffer_get_address(_async_buffer);
    var _buffer_size = buffer_get_size(_async_buffer);
    var _size = fmod_fetch_callbacks(_buffer_address, _buffer_size);
    
    if (_size < 0)
        return buffer_resize(_async_buffer, -_size * 2);
    
    buffer_seek(_async_buffer, buffer_seek_start, 0);
    var _map_array = ext_buffer_unpack(_async_buffer, true);
    var _array_size = array_length(_map_array);
    
    for (var _i = 0; _i < _array_size; _i++)
        event_perform_async(ev_async_social, _map_array[_i]);
}

function FmodVector() constructor
{
    x = 0;
    y = 0;
    z = 0;
}

function FmodCPUUsage() constructor
{
    dsp = 0;
    stream = 0;
    geometry = 0;
    update = 0;
    convolution1 = 0;
    convolution2 = 0;
}

function FmodCPUTimeUsage() constructor
{
    inclusive = 0;
    exclusive = 0;
}

function FmodLoopPoints() constructor
{
    loop_start = 0;
    loop_end = 0;
}

function FmodMinMaxDistance() constructor
{
    min_distance = 0;
    max_distance = 0;
}

function FmodReverbProperties() constructor
{
    decay_time = 1500;
    early_delay = 7;
    late_delay = 11;
    hf_reference = 5000;
    hf_decay_ratio = 50;
    diffusion = 50;
    density = 100;
    low_shelf_frequency = 250;
    low_shelf_gain = 0;
    high_cut = 200000;
    early_late_mix = 0;
    wet_level = -6;
}

function Fmod3DConeSettings() constructor
{
    inside_cone_angle = 0;
    outside_cone_angle = 0;
    outside_volume = 0;
}

function Fmod3DAttributes() constructor
{
    position = new FmodVector();
    velocity = new FmodVector();
    forward = new FmodVector();
    up = new FmodVector();
}

function FmodMemoryStats() constructor
{
    current_alloced = 0;
    max_alloced = 0;
}

function fmod_memory_get_stats(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_memory_get_stats_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_debug_initialize(argument0, argument1 = 0, argument2 = pointer_null)
{
    return fmod_debug_initialize_multiplatform(argument0, argument1, argument2);
}

function FmodSystemCreateSoundExInfo() constructor
{
    length = 0;
    file_offset = 0;
    num_channels = 0;
    default_frequency = 0;
    format = 0;
    decode_buffer_size = 0;
    initial_subsound = 0;
    num_subsounds = 0;
    inclusion_list_num = 0;
    dls_name = pointer_null;
    encryption_key = pointer_null;
    max_polyphony = 64;
    suggested_sound_type = 0;
    file_buffer_size = 0;
    channel_order = 0;
    initial_seek_position = 0;
    initial_seek_pos_type = 0;
    ignore_set_filesystem = 0;
    audio_queue_policy = 0;
    min_midi_granularity = 512;
    non_block_thread_id = 0;
}

function fmod_system_create_sound(argument0, argument1, argument2 = {})
{
    var _args = [[argument2, undefined]];
    
    if (!is_string(argument0))
        argument0 = buffer_get_address(argument0);
    
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_system_create_sound_multiplatform(argument0, argument1, _args_buffer_address);
}

function fmod_system_create_stream(argument0, argument1, argument2 = {})
{
    var _args = [[argument2, undefined]];
    
    if (!is_string(argument0))
        argument0 = buffer_get_address(argument0);
    
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_system_create_stream_multiplatform(argument0, argument1, _args_buffer_address);
}

function FmodSystemAdvancedSettings() constructor
{
    max_mpeg_codecs = 32;
    max_adpcm_codecs = 32;
    max_xma_codecs = 32;
    max_vorbis_codecs = 32;
    max_at9_codecs = 32;
    max_fadpcm_codecs = 32;
    max_pcm_codecs = 32;
    asio_num_channels = 0;
    vol0_virtual_vol = 0;
    default_decode_buffer_size = 400;
    profile_port = 9264;
    geometry_max_fade_time = 500;
    distance_filter_center_freq = 1500;
    reverb_3d_instance = 0;
    dsp_buffer_pool_size = 8;
    resampler_method = 0;
    random_seed = 0;
    max_convolution_threads = 3;
    max_opus_codecs = 32;
}

function fmod_system_set_advanced_settings(argument0)
{
    var _args = [[argument0, undefined]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_system_set_advanced_settings_multiplatform(_args_buffer_address);
}

function fmod_system_get_advanced_settings()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_advanced_settings_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_system_play_sound(argument0, argument1, argument2 = undefined)
{
    argument2 ??= fmod_system_get_master_channel_group();
    return fmod_system_play_sound_multiplatform(argument0, argument2, argument1);
}

function fmod_system_play_dsp(argument0, argument1, argument2 = undefined)
{
    argument2 ??= fmod_system_get_master_channel_group();
    return fmod_system_play_dsp_multiplatform(argument0, argument2, argument1);
}

function fmod_system_get_default_mix_matrix(argument0, argument1, argument2)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_default_mix_matrix_multiplatform(argument0, argument1, argument2, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystemDriverInfo() constructor
{
    index = 0;
    name = "";
    guid = "";
    system_rate = 0;
    speaker_mode = 0;
    speaker_mode_channels = 0;
}

function fmod_system_get_driver_info(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_driver_info_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystemSoftwareFormat() constructor
{
    sample_rate = 0;
    speaker_mode = 0;
    num_raw_speakers = 0;
}

function fmod_system_get_software_format()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_software_format_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystemDSPBufferSize() constructor
{
    buff_size = 0;
    num_buffers = 0;
}

function fmod_system_get_dsp_buffer_size()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_dsp_buffer_size_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystemStreamBufferSize() constructor
{
    file_buffer_size = 0;
    file_buffer_size_type = 0;
}

function fmod_system_get_stream_buffer_size()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_stream_buffer_size_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystemSpeakerPosition() constructor
{
    x = 0;
    y = 0;
    active = false;
}

function fmod_system_get_speaker_position(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_speaker_position_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystem3DSettings() constructor
{
    doppler_scale = 0;
    distance_factor = 0;
    rolloff_scale = 0;
}

function fmod_system_get_3d_settings()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_3d_settings_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystemChannelsPlaying() constructor
{
    doppler_scale = 0;
    distance_factor = 0;
    rolloff_scale = 0;
}

function fmod_system_get_channels_playing()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_channels_playing_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_system_get_cpu_usage()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_cpu_usage_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystemFileUsage() constructor
{
    sample_bytes_read = 0;
    stream_bytes_read = 0;
    other_bytes_read = 0;
}

function fmod_system_get_file_usage()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_file_usage_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
}

function fmod_system_set_3d_listener_attributes(argument0, argument1, argument2, argument3, argument4)
{
    var _args = [[argument1, 8], [argument2, 8], [argument3, 8], [argument4, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_system_set_3d_listener_attributes_multiplatform(argument0, _args_buffer_address);
}

function fmod_system_get_3d_listener_attributes(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_3d_listener_attributes_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_system_attach_channel_group_to_port(argument0, argument1, argument2, argument3 = true)
{
    var _args = [[argument0, 6], [argument1, 12], [argument2, 12], [argument3, 10]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_system_attach_channel_group_to_port_multiplatform(_args_buffer_address);
}

function FmodSystemRecordNumDrivers() constructor
{
    num_drivers = 0;
    num_connected = 0;
}

function fmod_system_get_record_num_drivers()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_record_num_drivers_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystemRecordDriverInfo() constructor
{
    name = "";
    guid = "";
    system_rate = 0;
    speaker_mode = 0;
    speaker_mode_channels = 0;
    state = 0;
}

function fmod_system_get_record_driver_info(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_record_driver_info_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodSystemGeometryOcclusion() constructor
{
    direct = 0;
    reverb = 0;
    listener = new FmodVector();
    source = new FmodVector();
}

function fmod_system_get_geometry_occlusion()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_geometry_occlusion_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_system_set_reverb_properties(argument0, argument1)
{
    var _args = [[argument1, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_system_set_reverb_properties_multiplatform(argument0, _args_buffer_address);
}

function fmod_system_get_reverb_properties(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_system_get_reverb_properties_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_system_load_geometry(argument0, argument1)
{
    var _args = [[argument0, 253]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_system_load_geometry_multiplatform(_args_buffer_address, argument1);
}

function fmod_system_update()
{
    fmod_handle_async_events();
    return fmod_system_update_multiplatform();
}

function fmod_channel_get_loop_points(argument0, argument1, argument2)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_get_loop_points_multiplatform(argument0, argument1, argument2, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_channel_group_add_group(argument0, argument1, argument2 = true)
{
    return fmod_channel_group_add_group_multiplatform(argument0, argument1, argument2);
}

function fmod_channel_control_set_3d_attributes(argument0, argument1, argument2)
{
    var _args = [[argument1, 8], [argument2, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_channel_control_set_3d_attributes_multiplatform(argument0, _args_buffer_address);
}

function FmodControl3DAttributes() constructor
{
    pos = new FmodVector();
    vel = new FmodVector();
}

function fmod_channel_control_get_3d_attributes(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_3d_attributes_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_channel_control_set_3d_cone_orientation(argument0, argument1)
{
    var _args = [[argument1, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_channel_control_set_3d_cone_orientation_multiplatform(argument0, _args_buffer_address);
}

function fmod_channel_control_get_3d_cone_orientation(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_3d_cone_orientation_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_channel_control_get_3d_cone_settings(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_3d_cone_settings_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_channel_control_set_3d_custom_rolloff(argument0, argument1)
{
    var _args = [[argument1, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_channel_control_set_3d_custom_rolloff_multiplatform(argument0, _args_buffer_address);
}

function fmod_channel_control_get_3d_custom_rolloff(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_3d_custom_rolloff_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? [];
}

function FmodControl3DDistanceFilter() constructor
{
    custom = false;
    custom_level = 0;
    center_freq = 0;
}

function fmod_channel_control_get_3d_distance_filter(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_3d_distance_filter_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodControl3DMinMaxDistance() constructor
{
    min_dist = 0;
    max_dist = 0;
}

function fmod_channel_control_get_3d_min_max_distance(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_3d_min_max_distance_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodControl3DOcclusion() constructor
{
    direct = 0;
    reverb = 0;
}

function fmod_channel_control_get_3d_occlusion(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_3d_occlusion_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_channel_control_set_mix_levels_input(argument0, argument1)
{
    var _args = [[argument1, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_channel_control_set_mix_levels_input_multiplatform(argument0, _args_buffer_address);
}

function fmod_channel_control_set_mix_matrix(argument0, argument1, argument2, argument3, argument4 = 0)
{
    var _args = [[argument1 ?? [], 8], [argument2, 6], [argument3, 6], [argument4, 6]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_channel_control_set_mix_matrix_multiplatform(argument0, _args_buffer_address);
}

function FmodControlMixMatrix() constructor
{
    matrix = [];
    out_channels = 0;
    in_channels = 0;
}

function fmod_channel_control_get_mix_matrix(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_mix_matrix_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function FmodControlDSPClock() constructor
{
    dsp_clock = 0;
    parent_clock = 0;
}

function fmod_channel_control_get_dsp_clock(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_dsp_clock_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_channel_control_set_delay(argument0, argument1 = 0, argument2 = 0, argument3 = true)
{
    var _args = [[argument1, 12], [argument2, 12], [argument3, 10]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_channel_control_set_delay_multiplatform(argument0, _args_buffer_address);
}

function FmodControlDelay() constructor
{
    dsp_clock_start = 0;
    dsp_clock_end = 0;
    stop_channels = false;
}

function fmod_channel_control_get_delay(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_delay_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_channel_control_add_fade_point(argument0, argument1, argument2)
{
    var _args = [[argument1, 12], [clamp(argument2, 0, infinity), 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_channel_control_add_fade_point_multiplatform(argument0, _args_buffer_address);
}

function fmod_channel_control_set_fade_point_ramp(argument0, argument1, argument2)
{
    var _args = [[argument1, 12], [clamp(argument2, 0, infinity), 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_channel_control_set_fade_point_ramp_multiplatform(argument0, _args_buffer_address);
}

function fmod_channel_control_remove_fade_points(argument0, argument1, argument2)
{
    var _args = [[argument1, 12], [argument2, 12]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_channel_control_remove_fade_points_multiplatform(argument0, _args_buffer_address);
}

function FmodControlFadePoints() constructor
{
    num_points = 0;
    point_dsp_clock = [];
    point_volume = [];
}

function fmod_channel_control_get_fade_points(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_channel_control_get_fade_points_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_dsp_add_input(argument0, argument1, argument2 = 0)
{
    return fmod_dsp_add_input_multiplatform(argument0, argument1, argument2);
}

function FmodDSPConnectionData() constructor
{
    dsp_ref = 0;
    dsp_connection_ref = 0;
}

function fmod_dsp_get_input(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_input_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_dsp_get_output(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_output_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_dsp_set_parameter_data(argument0, argument1, argument2, argument3 = undefined)
{
    argument3 ??= buffer_get_size(argument2);
    fmod_dsp_set_parameter_data_multiplatform(argument0, argument1, buffer_get_address(argument2), argument3);
}

function fmod_dsp_get_parameter_data(argument0, argument1, argument2, argument3 = undefined)
{
    argument3 ??= buffer_get_size(argument2);
    return fmod_dsp_get_parameter_data_multiplatform(argument0, argument1, buffer_get_address(argument2), argument3);
}

function FmodDspParameterDescValue() constructor
{
    default_val = 0;
    maximum = 0;
    minimum = 0;
}

function FmodDspParameterDesc() constructor
{
    type = 0;
    name = "";
    label = "";
    description = "";
    int_value = new FmodDspParameterDescValue();
    float_value = new FmodDspParameterDescValue();
    bool_value = new FmodDspParameterDescValue();
}

function fmod_dsp_get_parameter_info(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_parameter_info_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodDspParameterDesc();
}

function FmodDSPChannelFormat() constructor
{
    channel_mask = 0;
    num_channels = 0;
    speaker_mode = 0;
}

function fmod_dsp_get_channel_format(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_channel_format_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodDSPChannelFormat();
}

function fmod_dsp_get_output_channel_format(argument0, argument1, argument2, argument3)
{
    var _args = [[argument1, 5], [argument2, 6], [argument3, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_output_channel_format_multiplatform(argument0, _args_buffer_address, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodDSPChannelFormat();
}

function FmodDSPMeteringInfo() constructor
{
    num_samples = 0;
    peak_level = [];
    rms_level = [];
    num_channels = 0;
}

function FmodDSPInOutMeteringInfo() constructor
{
    in = new FmodDSPMeteringInfo();
    out = new FmodDSPMeteringInfo();
}

function fmod_dsp_get_metering_info(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_metering_info_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodDSPInOutMeteringInfo();
}

function FmodDSPMeteringEnableInfo() constructor
{
    enabled_in = false;
    enabled_out = false;
}

function fmod_dsp_get_metering_enabled(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_metering_enabled_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodDSPMeteringEnableInfo();
}

function FmodDSPWetDryMixInfo() constructor
{
    pre_wet = 0;
    post_wet = 0;
    dry = 0;
}

function fmod_dsp_get_wet_dry_mix(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_wet_dry_mix_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? FmodDSPWetDryMixInfo();
}

function FmodDSPInfo() constructor
{
    name = "";
    version = 0;
    channels = 0;
    config_width = 0;
    config_height = 0;
}

function fmod_dsp_get_info(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_info_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodDSPInfo();
}

function fmod_dsp_get_cpu_usage(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_get_cpu_usage_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodCPUTimeUsage();
}

function fmod_dsp_disconnect_from(argument0, argument1 = 0, argument2 = 0)
{
    return fmod_dsp_disconnect_from_mutliplatform(argument0, argument1, argument2);
}

function fmod_dsp_connection_set_mix_matrix(argument0, argument1, argument2, argument3, argument4 = 0)
{
    var _args = [[argument1, 8], [argument2, 6], [argument3, 6], [argument4, 6]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_dsp_connection_set_mix_matrix_multiplatform(argument0, _args_buffer_address);
}

function FmodDSPConnectionMixMatrix() constructor
{
    matrix = [];
    out_channels = 0;
    in_channels = 0;
}

function fmod_dsp_connection_get_mix_matrix(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_dsp_connection_get_mix_matrix_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodDSPConnectionMixMatrix();
}

function FmodGeometryPolygonAttributes() constructor
{
    direct_occlusion = 0;
    reverb_occlusion = 0;
    double_sided = false;
}

function fmod_geometry_get_polygon_attributes(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_geometry_get_polygon_attributes_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodGeometryPolygonAttributes();
}

function fmod_geometry_set_polygon_vertex(argument0, argument1, argument2, argument3)
{
    var _args = [[argument3, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_geometry_set_polygon_vertex_multiplatform(argument0, argument1, argument2, _args_buffer_address);
}

function fmod_geometry_get_polygon_vertex(argument0, argument1, argument2)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_geometry_get_polygon_vertex_multiplatform(argument0, argument1, argument2, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodVector();
}

function fmod_geometry_set_position(argument0, argument1)
{
    var _args = [[argument1, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_geometry_set_position_multiplatform(argument0, _args_buffer_address);
}

function fmod_geometry_get_position(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_geometry_get_position_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodVector();
}

function fmod_geometry_set_rotation(argument0, argument1, argument2)
{
    var _args = [[argument1, 8], [argument2, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_geometry_set_rotation_multiplatform(argument0, _args_buffer_address);
}

function FmodGeometryRotation() constructor
{
    forward = new FmodVector();
    up = new FmodVector();
}

function fmod_geometry_get_rotation(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_geometry_get_rotation_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodGeometryRotation();
}

function fmod_geometry_set_scale(argument0, argument1)
{
    var _args = [[argument1, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_geometry_set_scale_multiplatform(argument0, _args_buffer_address);
}

function fmod_geometry_get_scale(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_geometry_get_scale_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodVector();
}

function fmod_geometry_add_polygon(argument0, argument1, argument2, argument3, argument4)
{
    var _args = [[argument1, 8], [argument2, 8], [argument3, 10], [argument4, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_geometry_add_polygon_multiplatform(argument0, _args_buffer_address);
}

function FmodMaxPolygonsInfo() constructor
{
    max_polygons = 0;
    max_vertices = 0;
}

function fmod_geometry_get_max_polygons(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_geometry_get_max_polygons_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodMaxPolygonsInfo();
}

function fmod_geometry_save(argument0, argument1)
{
    var _args = [[argument1, 253]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_geometry_save_multiplatform(argument0, _args_buffer_address);
}

function fmod_reverb_3d_set_3d_attributes(argument0, argument1, argument2, argument3)
{
    var _args = [[argument1, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_reverb_3d_set_3d_attributes_multiplatform(argument0, _args_buffer_address, argument2, argument3);
}

function FmodReverb3DAttributes() : FmodMinMaxDistance() constructor
{
    position = new FmodVector();
}

function fmod_reverb_3d_get_3d_attributes(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_reverb_3d_get_3d_attributes_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodReverb3DAttributes();
}

function fmod_reverb_3d_get_properties(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_reverb_3d_get_properties_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodReverbProperties();
}

function FmodSoundFormat() constructor
{
    type = 0;
    format = 0;
    channels = 0;
    bits = 0;
}

function fmod_sound_get_format(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_format_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodSoundFormat();
}

function FmodSoundNumTags() constructor
{
    num_tags = 0;
    num_tags_updated = 0;
}

function fmod_sound_get_num_tags(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_num_tags_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodSoundNumTags();
}

function FmodSoundTag() constructor
{
    name = "";
    type = 0;
    update = 0;
    data_len = 0;
    data_type = 0;
}

function fmod_sound_get_tag(argument0, argument1, argument2)
{
    var _args = [[argument2, 253]];
    var _args_buffer_address = ext_pack_args(_args);
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_tag_multiplatform(argument0, argument1, _args_buffer_address, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodSoundTag();
}

function fmod_sound_get_3d_cone_settings(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_3d_cone_settings_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new Fmod3DConeSettings();
}

function fmod_sound_set_3d_custom_rolloff(argument0, argument1)
{
    var _args = [[argument1, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_sound_set_3d_custom_rolloff_multiplatform(argument0, _args_buffer_address);
}

function fmod_sound_get_3d_custom_rolloff(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_3d_custom_rolloff_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? [];
}

function fmod_sound_get_3d_min_max_distance(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_3d_min_max_distance_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodMinMaxDistance();
}

function FmodSoundDefaults() constructor
{
    frequency = 0;
    priority = 0;
}

function fmod_sound_get_defaults(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_defaults_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodSoundDefaults();
}

function fmod_sound_get_loop_points(argument0, argument1, argument2)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_loop_points_multiplatform(argument0, argument1, argument2, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodLoopPoints();
}

function FmodSoundOpenState() constructor
{
    open_state = 0;
    percent_buffered = 0;
    starving = false;
    disk_busy = false;
}

function fmod_sound_get_open_state(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_open_state_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodSoundOpenState();
}

function fmod_sound_read_data(argument0, argument1, argument2, argument3)
{
    var _args = [[argument1, 253], [argument2, 5], [argument3, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_sound_read_data_multiplatform(argument0, _args_buffer_address);
}

function FmodSoundLockChunck() constructor
{
    length = 0;
    patch_address = pointer_null;
}

function FmodSoundLock() constructor
{
    buffer1 = new FmodSoundLockChunck();
    buffer2 = new FmodSoundLockChunck();
}

function fmod_sound_lock(argument0, argument1, argument2, argument3, argument4)
{
    var _args = [[argument1, 5], [argument2, 5], [argument3, 253], [argument4, 253]];
    var _args_buffer_address = ext_pack_args(_args);
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_lock_multiplatform(argument0, _args_buffer_address, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodSoundLock();
}

function fmod_sound_unlock(argument0, argument1, argument2, argument3, argument4 = undefined, argument5 = undefined, argument6 = undefined)
{
    var _args = [[argument1, 253], [argument2, 5], [argument3, 252], [argument4, 253], [argument5, 5], [argument6, 252]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_sound_unlock_multiplatform(argument0, _args_buffer_address);
}

function FmodSyncPoint() constructor
{
    name = "";
    offset = 0;
}

function fmod_sound_get_sync_point(argument0, argument1, argument2)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_sound_get_sync_point_multiplatform(argument0, argument1, argument2, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodSyncPoint();
}

function FmodStudioMemoryUsage() constructor
{
    inclusive = 0;
    exclusive = 0;
    sample_data = 0;
}

function FmodStudioParameter() constructor
{
    value = 0;
    final_value = 0;
}

function FmodStudioParameterId() constructor
{
    data1 = 0;
    data2 = 0;
}

function fmod_studio_bus_set_port_index(argument0, argument1)
{
    var _args = [[argument1, 12]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_bus_set_port_index_multiplatform(argument0, _args_buffer_address);
}

function fmod_studio_bus_get_port_index(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_bus_get_port_index_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_studio_bus_get_cpu_usage(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_bus_get_cpu_usage_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodCPUUsage();
}

function fmod_studio_bus_get_memory_usage(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_bus_get_memory_usage_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioMemoryUsage();
}

function FmodCommandReplayCurrentCommand() constructor
{
    command_index = 0;
    command_time = 0;
}

function fmod_studio_command_replay_get_current_command(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_command_replay_get_current_command_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodCommandReplayCurrentCommand();
}

function FmodCommandReplayCommandInfo() constructor
{
    command_name = "";
    parent_command_index = 0;
    frame_time = 0;
    instance_type = 0;
    output_type = 0;
    instance_handle = 0;
    output_handle = 0;
}

function fmod_studio_command_replay_get_command_info(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_command_replay_get_command_info_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodCommandReplayCommandInfo();
}

function fmod_studio_event_description_get_min_max_distance(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_description_get_min_max_distance_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodMinMaxDistance();
}

function FmodStudioUserProperty() constructor
{
    name = "";
    type = 1;
    string_value = "";
    int_value = 0;
    bool_value = false;
    float_value = 1;
}

function fmod_studio_event_description_get_user_property(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_description_get_user_property_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioUserProperty();
}

function fmod_studio_event_description_get_user_property_by_index(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_description_get_user_property_by_index_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioUserProperty();
}

function FmodStudioEventInstanceVolume() constructor
{
    volume = 0;
    final_volume = 0;
}

function fmod_studio_event_instance_get_volume(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_instance_get_volume_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioEventInstanceVolume();
}

function fmod_studio_event_instance_set_3d_attributes(argument0, argument1)
{
	/*
    var _args = [[argument1, 8]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_event_instance_set_3d_attributes_multiplatform(argument0, _args_buffer_address);
	*/
}

function fmod_studio_event_instance_get_3d_attributes(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_instance_get_3d_attributes_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new Fmod3DAttributes();
}

function fmod_studio_event_instance_get_min_max_distance(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_instance_get_min_max_distance_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodMinMaxDistance();
}

function fmod_studio_event_instance_get_parameter_by_name(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_instance_get_parameter_by_name_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioParameter();
}

function fmod_studio_event_instance_set_parameter_by_name(argument0, argument1, argument2, argument3 = false)
{
    return fmod_studio_event_instance_set_parameter_by_name_multiplatform(argument0, argument1, argument2, argument3);
}

function fmod_studio_event_instance_set_parameter_by_id(argument0, argument1, argument2, argument3 = false)
{
    var _args = [[argument1, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_event_instance_set_parameter_by_id_multiplatform(argument0, _args_buffer_address, argument2, argument3);
}

function fmod_studio_event_instance_set_parameter_by_id_with_label(argument0, argument1, argument2, argument3 = false)
{
    var _args = [[_paramater_id, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_event_instance_set_parameter_by_id_with_label_multiplatform(argument0, _args_buffer_address, argument2, argument3);
}

function fmod_studio_event_instance_get_parameter_by_id(argument0, argument1)
{
    var _args = [[argument1, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_instance_get_parameter_by_id_multiplatform(argument0, _args_buffer_address, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioParameter();
}

function fmod_studio_event_instance_get_cpu_usage(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_instance_get_cpu_usage_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodCPUUsage();
}

function fmod_studio_event_instance_get_memory_usage(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_instance_get_memory_usage_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioMemoryUsage();
}

function fmod_studio_system_load_bank_memory(argument0, argument1, argument2, argument3)
{
    return fmod_studio_system_load_bank_memory_multiplatform(buffer_get_address(argument0), argument1, argument2, argument3);
}

function fmod_studio_system_set_listener_attributes(argument0, argument1, argument2 = undefined)
{
	/*
    var _args = [[argument1, 8]];
    
    if (!is_undefined(argument2))
        array_push(_args, [argument2, 8]);
    
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_system_set_listener_attributes_multiplatform(argument0, _args_buffer_address);
	*/
}

function FmodStudioListenerAttributes() constructor
{
    attributes = new Fmod3DAttributes();
    attenuation = new FmodVector();
}

function fmod_studio_system_get_listener_attributes(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_listener_attributes_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioListenerAttributes();
}

function fmod_studio_system_get_parameter_by_id(argument0)
{
    var _args = [[argument0, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_parameter_by_id_multiplatform(_args_buffer_address, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value;
}

function fmod_studio_system_set_parameter_by_id(argument0, argument1, argument2)
{
    var _args = [[argument0, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_system_set_parameter_by_id_multiplatform(_args_buffer_address, argument1, argument2);
}

function fmod_studio_system_set_parameter_by_id_with_label(argument0, argument1, argument2 = false)
{
    var _args = [[argument0, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_system_set_parameter_by_id_with_label_multiplatform(_args_buffer_address, argument1, argument2);
}

function fmod_studio_system_get_parameter_by_name(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_parameter_by_name_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioParameter();
}

function fmod_studio_system_get_parameter_label_by_id(argument0, argument1)
{
    var _args = [[argument0, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_system_get_parameter_label_by_id_multiplatform(_args_buffer_address, argument1);
}

function FmodStudioBufferInfo() constructor
{
    current_usage = 0;
    peak_usage = 0;
    capacity = 0;
    stall_count = 0;
    stall_time = 0;
}

function FmodStudioBufferUsage() constructor
{
    command_queue = FmodStudioBufferInfo();
}

function fmod_studio_system_get_buffer_usage()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_buffer_usage_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioBufferUsage();
}

function fmod_studio_system_get_memory_usage()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_memory_usage_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioMemoryUsage();
}

function FmodStudioCPUUsage() constructor
{
    core = new FmodCPUUsage();
    studio = 
    {
        update: 0
    };
}

function fmod_studio_system_get_cpu_usage()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_cpu_usage_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioCPUUsage();
}

function fmod_studio_system_get_bank_list()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_bank_list_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? [];
}

function fmod_studio_system_get_parameter_description_by_name(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_parameter_description_by_name_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioParameterDescription();
}

function fmod_studio_system_get_parameter_description_by_id(argument0)
{
    var _args = [[argument0, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_parameter_description_by_id_multiplatform(_args_buffer_address, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioParameterDescription();
}

function fmod_studio_system_get_parameter_description_list()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_parameter_description_list_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? [];
}

function FmodStudioAdvancedSettings() constructor
{
    command_queue_size = 32768;
    handle_initial_size = 65536;
    studio_update_period = 20;
    idle_sampledata_pool_size = 262144;
    streaming_schedule_delay = 8192;
    encryption_key = pointer_null;
}

function fmod_studio_system_set_advanced_settings(argument0)
{
    var _args = [[argument0.command_queue_size, 5], [argument0.handle_initial_size, 5], [argument0.studio_update_period, 6], [argument0.idle_sample_data_pool_size, 6], [argument0.streaming_schedule_delay, 5], [argument0.encryption_key, 11]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_system_set_advanced_settings_multiplatform(_args_buffer_address);
}

function fmod_studio_system_get_advanced_settings()
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_advanced_settings_multiplatform(_return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioAdvancedSettings();
}

function FmodStudioSoundInfo() constructor
{
    ext_info = new FmodSystemCreateSoundExInfo();
    name_or_data = "";
    mode = 0;
    sub_sound_index = 0;
}

function fmod_studio_system_get_sound_info(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_system_get_sound_info_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioSoundInfo();
}

function fmod_studio_system_set_parameter_by_name(argument0, argument1, argument2 = false)
{
    return fmod_studio_system_set_parameter_by_name_multiplatform(argument0, argument1, argument2);
}

function fmod_studio_system_set_parameter_by_name_with_label(argument0, argument1, argument2 = false)
{
    return fmod_studio_system_set_parameter_by_name_with_label_multiplatform(argument0, argument1, argument2);
}

function fmod_studio_system_update()
{
    fmod_handle_async_events();
    return fmod_studio_system_update_multiplatform();
}

function fmod_studio_bank_get_event_description_list(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_bank_get_event_description_list_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? [];
}

function fmod_studio_bank_get_bus_list(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_bank_get_bus_list_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? [];
}

function fmod_studio_bank_get_vca_list(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_bank_get_vca_list_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? [];
}

function FmodStudioStringInfo() constructor
{
    path = "";
    guid = "";
}

function fmod_studio_bank_get_string_info(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_bank_get_string_info_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioStringInfo();
}

function FmodStudioParameterDescription() constructor
{
    name = "";
    parameter_id = new FmodStudioParameterId();
    minimum = 0;
    maximum = 0;
    default_value = 0;
    type = 0;
    flags = 0;
    guid = 0;
}

function fmod_studio_event_description_get_instance_list(argument0)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_description_get_instance_list_multiplatform(argument0, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? [];
}

function fmod_studio_event_description_get_parameter_description_by_id(argument0, argument1)
{
    var _args = [[argument1, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_description_get_parameter_description_by_id_multiplatform(argument0, _args_buffer_address, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioParameterDescription();
}

function fmod_studio_event_description_get_parameter_label_by_id(argument0, argument1, argument2)
{
    var _args = [[argument1, 5]];
    var _args_buffer_address = ext_pack_args(_args);
    return fmod_studio_event_description_get_parameter_label_by_id_multiplatform(argument0, _args_buffer_address, argument2);
}

function fmod_studio_event_description_get_parameter_description_by_index(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_description_get_parameter_description_by_index_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioParameterDescription();
}

function fmod_studio_event_description_get_parameter_description_by_name(argument0, argument1)
{
    var _return_buffer_address = ext_return_buffer_address();
    fmod_studio_event_description_get_parameter_description_by_name_multiplatform(argument0, argument1, _return_buffer_address);
    var _return_value = ext_buffer_unpack(ext_return_buffer());
    return _return_value ?? new FmodStudioParameterDescription();
}
