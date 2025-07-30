function ScrCPU_StartPath()
{
    var _zon = instance_nearest(x, y, o_cpupath_zone);
    
    with (_zon)
    {
        switch (area)
        {
            case "A":
                with (instance_create_layer(x, y, layer, o_cpu_findme_path))
                    phase = 0;
                
                break;
            
            case "B":
                with (instance_create_layer(x, y, layer, o_cpu_findme_path))
                    phase = 1;
                
                break;
            
            case "C":
                with (instance_create_layer(x, y, layer, o_cpu_findme_path))
                    phase = 2;
                
                break;
            
            case "D":
                with (instance_create_layer(x, y, layer, o_cpu_findme_path))
                    phase = 3;
                
                break;
            
            case "E":
                with (instance_create_layer(x, y, layer, o_cpu_findme_path))
                    phase = 4;
                
                break;
        }
    }
}
