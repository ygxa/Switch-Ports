switch (char)
{
    case "PS":
        image_index = 0;
        break;
    
    case "NO":
        image_index = 1;
        break;
    
    case "TV":
        image_index = 3;
        break;
    
    case "FP":
        image_index = 4;
        break;
    
    case "DO":
        image_index = 2;
        break;
}

if (image_xscale > 1)
    image_xscale -= 0.1;

if (sh > 0)
    sh -= 0.1;
