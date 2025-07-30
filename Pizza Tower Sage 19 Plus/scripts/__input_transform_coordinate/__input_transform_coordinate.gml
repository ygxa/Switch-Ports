__input_transform_coordinate(0, 0, 2, 2, undefined);

function __input_transform_coordinate(argument0, argument1, argument2, argument3, argument4 = undefined)
{
    static _result = 
    {
        x: 0,
        y: 0
    };
    static _windowW = undefined;
    static _windowH = undefined;
    static _appSurfW = undefined;
    static _appSurfH = undefined;
    static _appSurfDrawL = undefined;
    static _appSurfDrawT = undefined;
    static _appSurfDrawW = undefined;
    static _appSurfDrawH = undefined;
    static _recacheTime = -infinity;
    
    if (argument2 != argument3)
    {
        var _viewA, _viewX, _viewW, _viewY, _viewH;
        
        if (argument2 == 0 || argument3 == 0)
        {
            if (argument4 == undefined && view_enabled && view_visible[0])
                argument4 = view_camera[0];
            
            if (argument4 != undefined)
            {
                _viewX = camera_get_view_x(argument4);
                _viewY = camera_get_view_y(argument4);
                _viewW = camera_get_view_width(argument4);
                _viewH = camera_get_view_height(argument4);
                _viewA = camera_get_view_angle(argument4);
            }
            else
            {
                _viewX = 0;
                _viewY = 0;
                _viewW = room_width;
                _viewH = room_height;
                _viewA = 0;
            }
        }
        
        if (argument2 == 2 || argument3 == 2)
        {
            if (_appSurfW != surface_get_width(application_surface) || _appSurfH != surface_get_height(application_surface))
            {
                _appSurfW = surface_get_width(application_surface);
                _appSurfH = surface_get_height(application_surface);
                _recacheTime = -infinity;
            }
            
            if (current_time > _recacheTime)
            {
                _recacheTime = infinity;
                var _array = application_get_position();
                _appSurfDrawL = _array[0];
                _appSurfDrawT = _array[1];
                _appSurfDrawW = _array[2] - _appSurfDrawL;
                _appSurfDrawH = _array[3] - _appSurfDrawT;
            }
            
            if (_windowW != window_get_width() || _windowH != window_get_height())
            {
                _windowW = window_get_width();
                _windowH = window_get_height();
                _recacheTime = current_time + 200;
            }
        }
        
        if (argument2 == 0)
        {
            if (_viewA == 0)
            {
                argument0 = (argument0 - _viewX) / _viewW;
                argument1 = (argument1 - _viewY) / _viewH;
            }
            else
            {
                _viewX += (_viewW / 2);
                _viewY += (_viewH / 2);
                var _sin = dsin(-_viewA);
                var _cos = dcos(-_viewA);
                var _x0 = argument0 - _viewX;
                var _y0 = argument1 - _viewY;
                argument0 = (((_x0 * _cos) - (_y0 * _sin)) + (_viewW / 2)) / _viewW;
                argument1 = ((_x0 * _sin) + (_y0 * _cos) + (_viewH / 2)) / _viewH;
            }
            
            if (argument3 == 1)
            {
                argument0 *= display_get_gui_width();
                argument1 *= display_get_gui_height();
            }
            else if (argument3 == 2)
            {
                argument0 = (_appSurfDrawW * argument0) + _appSurfDrawL;
                argument1 = (_appSurfDrawH * argument1) + _appSurfDrawT;
            }
            else
            {
                __input_error("Unhandled output coordinate system (", argument3, ")");
            }
        }
        else if (argument2 == 1)
        {
            argument0 /= display_get_gui_width();
            argument1 /= display_get_gui_height();
            
            if (argument3 == 0)
            {
                if (_viewA == 0)
                {
                    argument0 = (_viewW * argument0) + _viewX;
                    argument1 = (_viewH * argument1) + _viewY;
                }
                else
                {
                    _viewX += (_viewW / 2);
                    _viewY += (_viewH / 2);
                    var _sin = dsin(_viewA);
                    var _cos = dcos(_viewA);
                    var _x0 = (argument0 * _viewW) - (_viewW / 2);
                    var _y0 = (argument1 * _viewH) - (_viewH / 2);
                    argument0 = ((_x0 * _cos) - (_y0 * _sin)) + _viewX;
                    argument1 = (_x0 * _sin) + (_y0 * _cos) + _viewY;
                }
            }
            else if (argument3 == 2)
            {
                argument0 = (_appSurfDrawW * argument0) + _appSurfDrawL;
                argument1 = (_appSurfDrawH * argument1) + _appSurfDrawT;
            }
            else
            {
                __input_error("Unhandled output coordinate system (", argument3, ")");
            }
        }
        else if (argument2 == 2)
        {
            argument0 = (argument0 - _appSurfDrawL) / _appSurfDrawW;
            argument1 = (argument1 - _appSurfDrawT) / _appSurfDrawH;
            
            if (argument3 == 1)
            {
                argument0 *= display_get_gui_width();
                argument1 *= display_get_gui_height();
            }
            else if (argument3 == 0)
            {
                if (_viewA == 0)
                {
                    argument0 = (_viewW * argument0) + _viewX;
                    argument1 = (_viewH * argument1) + _viewY;
                }
                else
                {
                    _viewX += (_viewW / 2);
                    _viewY += (_viewH / 2);
                    var _sin = dsin(_viewA);
                    var _cos = dcos(_viewA);
                    var _x0 = (argument0 * _viewW) - (_viewW / 2);
                    var _y0 = (argument1 * _viewH) - (_viewH / 2);
                    argument0 = ((_x0 * _cos) - (_y0 * _sin)) + _viewX;
                    argument1 = (_x0 * _sin) + (_y0 * _cos) + _viewY;
                }
            }
            else
            {
                __input_error("Unhandled output coordinate system (", argument3, ")");
            }
        }
        else
        {
            __input_error("Unhandled input coordinate system (", argument2, ")");
        }
    }
    
    _result.x = argument0;
    _result.y = argument1;
    return _result;
}
