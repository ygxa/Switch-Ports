targetX = x;
targetY = y;
smoothMovement = true;
nonSmoothSpeed = 6;
scene = "";
widgetCrashSeq = -4;
seqLayer = -4;
seq = -4;
cooldown = 0;

function crashWidget()
{
    if (widgetCrashSeq != -4)
    {
        seqLayer = layer_create(obj_sansdate.depth + 1);
        seq = layer_sequence_create(seqLayer, x, y, widgetCrashSeq);
        seqMgr = instance_create(obj_sequence_manager);
        
        with (seqMgr)
        {
            sequence = other.seq;
            sequenceLayer = other.seqLayer;
        }
        
        layer_sequence_xscale(seq, 2);
        layer_sequence_yscale(seq, 2);
        layer_sequence_play(seq);
        visible = false;
    }
}
