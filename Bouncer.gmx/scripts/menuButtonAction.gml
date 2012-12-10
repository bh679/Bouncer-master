tmpMenuItem = argument0

//////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////            MAIN MENU
/////////////////////////////////////////////////////////////////////////////////////

//play
if tmpMenuItem = STRPLAY
{
    Levels.roomindex = 1
    do
    {
        Levels.roomindex+= 1
    }
    until(Levels.unlocked[Levels.roomindex+1] = false)
    with(obj_new_level)
        {instance_destroy()}
    room = Levels.level[Levels.roomindex]
} else

//options menu
if tmpMenuItem = STROPTIONS
{
    obj_menu.menuItem[0] = STRVIDEO
    obj_menu.menuItem[1] = STRAUDIO
    obj_menu.menuItem[2] = STRCREDITS
    obj_menu.menuItem[3] = STRUPDATE
    obj_menu.menuItem[4] = STRMENU
    if global.release
       obj_menu.menuItem[5] = ''
    else
        obj_menu.menuItem[5] = STRDEBUGGIN
} else

//stages menu
if tmpMenuItem = STRSTAGES
{
    obj_menu.menu = "stages"
    obj_menu.menuItem[0] = STRSTAGE + " 1"
    obj_menu.menuItem[1] = STRSTAGE + " 2"
    obj_menu.menuItem[2] = STRSTAGE + " 3"
    obj_menu.menuItem[3] = STRSTAGE + " 4"
    obj_menu.menuItem[4] = STRSTAGE + " 5"
    obj_menu.menuItem[5] = STRMENU
} else

//hide
if tmpMenuItem = STRHIDE
{
    obj_menu.menuItem[0] = ''
    obj_menu.menuItem[1] = ''
    obj_menu.menuItem[2] = ''
    obj_menu.menuItem[3] = ''
    obj_menu.menuItem[4] = ''
    obj_menu.menuItem[5] = ''
    obj_menu.menu = "hidden"
} else

//exit game
if tmpMenuItem = STREXIT
{
    game_end();
} else



//////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////            OPTIONS MENU
/////////////////////////////////////////////////////////////////////////////////////

//back to main menu
if tmpMenuItem = STRMENU
{
    obj_menu.menu = "main"
    obj_menu.menuItem[0] = ''
    obj_menu.menuItem[1] = STRPLAY
    obj_menu.menuItem[2] = STRSTAGES
    obj_menu.menuItem[3] = STROPTIONS
    if global.platform != iOS and global.platform != html5
    {
       obj_menu.menuItem[4] = STRHIDE
       obj_menu.menuItem[5] = STREXIT
    }
    else if global.platform != html5
    {
       obj_menu.menuItem[4] = STRHIDE
       obj_menu.menuItem[5] = ''
    }
    else
    {
        obj_menu.menuItem[4] = ''
        obj_menu.menuItem[5] = ''
    }
} else

//credits
if tmpMenuItem = STRCREDITS
{
    obj_menu.menuItem[0] = ''
    obj_menu.menuItem[1] = ''
    obj_menu.menuItem[2] = ''
    obj_menu.menuItem[3] = ''
    obj_menu.menuItem[4] = ''
    obj_menu.menuItem[5] = ''
    obj_menu.menu = "credits"
    instance_create(0,0,obj_credits)
} else

//auido menu
if tmpMenuItem = STRAUDIO
{
    obj_menu.menuItem[0] = ''
    obj_menu.menuItem[1] = STRMUTE
    obj_menu.menuItem[2] = STRVOICES
    obj_menu.menuItem[3] = STRMENU
    obj_menu.menuItem[4] = ''
    obj_menu.menuItem[5] = ''
} else

//video menu
if tmpMenuItem = STRVIDEO
{
    obj_menu.menuItem[0] = ''
    obj_menu.menuItem[1] = STRGRAPHICS
    if global.platform != iOS
    {
       obj_menu.menuItem[2] = STRFULLSCREEN
       obj_menu.menuItem[3] = STRMENU
    }
    else
    {
       obj_menu.menuItem[2] = STRMENU
       obj_menu.menuItem[3] = ''
    }
       
    if global.release
       obj_menu.menuItem[4] = ''
    else
        obj_menu.menuItem[4] = STRPLATFORM
    obj_menu.menuItem[5] = ''
} else

//platform
if tmpMenuItem = STRPLATFORM
{
    obj_menu.menuItem[0] = Html5
    obj_menu.menuItem[1] = Windows
    obj_menu.menuItem[2] = Mac
    obj_menu.menuItem[3] = iOS
    obj_menu.menuItem[4] = STRMENU
    obj_menu.menuItem[5] = ''
} else

//update
if tmpMenuItem = STRUPDATE
{
    url_open("http://bouncer.brennanhatton.com")
} else

//update
if tmpMenuItem = STRDEBUGGIN
{
    if global.debuggin = true
       global.debuggin = false
    else
        global.debuggin = true
} else



//////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////            VIDEO MENU
/////////////////////////////////////////////////////////////////////////////////////

//set graphics details
if tmpMenuItem = STRGRAPHICS
{
    obj_menu.menuItem[0] = ''//STRLOWEST
    obj_menu.menuItem[1] = STRLOWEST//STRLOW
    obj_menu.menuItem[2] = STRMEDIUM//STRMEDIUM
    obj_menu.menuItem[3] = STRHIGHEST//STRHIGH
    obj_menu.menuItem[4] = STRMENU//STRHIGHEST
    obj_menu.menuItem[5] = ''//STRMENU
} else

//fullscreen
if tmpMenuItem = STRFULLSCREEN
{
    window_set_fullscreen((window_get_fullscreen()+1) mod 2)
} else

//Graphics lowest
if tmpMenuItem = STRLOWEST
{
    changeGraphics(GRAPHICLOWEST)
} else

//Graphics low
if tmpMenuItem = STRLOW
{
    changeGraphics(GRAPHICLOW)
} else

//Graphics mid
if tmpMenuItem = STRMEDIUM
{
    changeGraphics(GRAPHICMID)
} else

//Graphics high
if tmpMenuItem = STRHIGH
{
    changeGraphics(GRAPHICHIGH)
} else

//Graphics highest
if tmpMenuItem = STRHIGHEST
{
    changeGraphics(GRAPHICHIGHEST)
} else



//////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////            PLATFORM MENU
/////////////////////////////////////////////////////////////////////////////////////

//iOS
if tmpMenuItem = iOS
{
    global.platform = iOS
} else

//Windwos
if tmpMenuItem = Windows
{
    global.platform = Windows
} else

//Mac
if tmpMenuItem = Mac
{
    global.platform = Mac
} else

//Mac
if tmpMenuItem = Html5
{
    global.platform = html5
} else



//////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////            AUDIO MENU
/////////////////////////////////////////////////////////////////////////////////////

//sound
if tmpMenuItem = STRMUTE
{

    if global.soundOn = true
    {
        global.soundOn = false
        sound_stop(global.backmusic);
        sound_stop_all();
        sound_global_volume(0)
    }
    else
    {
        global.soundOn = true
        bg_music()
        sound_global_volume(1)
    }
} else

//voices
if tmpMenuItem = STRVOICES
{
    if global.voices = true
        global.voices = false
    else
        global.voices = true
} else



//////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////            STAGES MENU
/////////////////////////////////////////////////////////////////////////////////////

i = 1
repeat(9)
{
    if tmpMenuItem = STRSTAGE + " " + string(i)
    {
        openStage(i);
    }
    i += 1
}



