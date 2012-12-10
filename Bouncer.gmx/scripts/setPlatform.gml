


switch(os_type)
{
    case os_ios: global.platform = iOS
         break;
    case os_browser: global.platform = html5
         break;
    case os_windows: global.platform = Windows
         break;
    case os_macosx: global.platform = Mac
         break;
    default: global.platform = html5
}
   global.platform = iOS
switch(global.platform)
{
    case iOS: global.detail = GRAPHICHIGHEST
         break;
    case html5: global.detail = GRAPHICLOWEST
         break;
    case Windows: global.detail = GRAPHICHIGHEST
         break;
    case Mac: global.detail = GRAPHICHIGHEST
         break;
    default: global.detail = GRAPHICMID
}
