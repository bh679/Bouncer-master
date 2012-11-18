grassSpeed = 1/300
windStrength= 4

_sprite = argument0
_image_index = argument1
_x = argument2
_y = argument3
_xscale = argument4
_yscale = argument5
_angle = argument6
_blend = argument7
_alpha = argument8
_randomSprite = argument9
var tmpx, tmpy, ran;
tmpx = 0
//show_message(string(_xscale))
lastwx = 0
for(wx = 0; wx < _xscale; wx+=1)
{
    tmpy = 0
    repeat(_yscale)
    {
        if _randomSprite = true
            _index = abs(((sin(tmpx)*10+cos(tmpy)*17)+_image_index) mod 5)
        else
            _index = _image_index
            
        if _sprite = spr_grass
        {
            ran = ((ran1 + i + _index + 5*sin(i) + 3*cos(3*i) + sin(i)) mod 3)
            draw_sprite_ext(_sprite,ran,_x+tmpx+8,_y+tmpy+BLOCKSIZE,1,1+ran,sin(_angle*grassSpeed + tmpx*3 + y)*windStrength,_blend,_alpha)
        }
            
        if _sprite = spr_sand_outline
        {
            //draw_text(10,10,"Wording#####################################################")
            ran = ((ran1 + i + _index + 5*sin(i) + 3*cos(3*i) + sin(i)) mod 1 )
            stretchx = 0
            while(wx < _xscale && round(sin(tmpx+wx+_x+_y)) != 0)
            {
                if wx < _xscale-1
                    stretchx += 1
                wx += 1
            }
            //draw_set_color(c_red)
            draw_text(_x+tmpx,_y+tmpy-BLOCKSIZE,"+"+string(stretchx))
            draw_text(_x+tmpx,_y+tmpy-BLOCKSIZE*2,"<"+string(_xscale))
            draw_sprite_ext(_sprite,ran,_x+tmpx,_y+tmpy+BLOCKSIZE,1+stretchx,1+ran,0,_blend,_alpha)
        }
            
        tmpy += 16
    }
    tmpx += 16 * (stretchx+1)
    lastwx = wx
}



if global.debuggin draw_rectangle(x,y,x+_xscale*16,y+_yscale*16,true)//debuggin
