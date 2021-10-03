package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_906;
         param1["bitmap"] = const_875;
         param1["border"] = const_765;
         param1["border_notify"] = const_1749;
         param1["button"] = const_536;
         param1["button_thick"] = const_873;
         param1["button_icon"] = const_1497;
         param1["button_group_left"] = const_872;
         param1["button_group_center"] = const_682;
         param1["button_group_right"] = const_708;
         param1["canvas"] = const_763;
         param1["checkbox"] = const_749;
         param1["closebutton"] = const_1117;
         param1["container"] = const_427;
         param1["container_button"] = const_821;
         param1["display_object_wrapper"] = const_854;
         param1["dropmenu"] = const_541;
         param1["dropmenu_item"] = const_508;
         param1["frame"] = const_418;
         param1["frame_notify"] = const_1491;
         param1["header"] = const_706;
         param1["html"] = const_1090;
         param1["icon"] = const_1044;
         param1["itemgrid"] = const_1226;
         param1["itemgrid_horizontal"] = const_559;
         param1["itemgrid_vertical"] = const_859;
         param1["itemlist"] = const_1254;
         param1["itemlist_horizontal"] = const_404;
         param1["itemlist_vertical"] = const_430;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1561;
         param1["menu"] = const_1634;
         param1["menu_item"] = const_1662;
         param1["submenu"] = const_1088;
         param1["minimizebox"] = const_1510;
         param1["notify"] = const_1471;
         param1["null"] = const_688;
         param1["password"] = const_660;
         param1["radiobutton"] = const_654;
         param1["region"] = const_518;
         param1["restorebox"] = const_1659;
         param1["scaler"] = const_529;
         param1["scaler_horizontal"] = const_1621;
         param1["scaler_vertical"] = const_1479;
         param1["scrollbar_horizontal"] = const_459;
         param1["scrollbar_vertical"] = const_850;
         param1["scrollbar_slider_button_up"] = const_1058;
         param1["scrollbar_slider_button_down"] = const_1137;
         param1["scrollbar_slider_button_left"] = const_1089;
         param1["scrollbar_slider_button_right"] = const_1202;
         param1["scrollbar_slider_bar_horizontal"] = const_1122;
         param1["scrollbar_slider_bar_vertical"] = const_1161;
         param1["scrollbar_slider_track_horizontal"] = const_1110;
         param1["scrollbar_slider_track_vertical"] = const_1073;
         param1["scrollable_itemlist"] = const_1539;
         param1["scrollable_itemlist_vertical"] = const_593;
         param1["scrollable_itemlist_horizontal"] = const_1140;
         param1["selector"] = const_687;
         param1["selector_list"] = const_845;
         param1["submenu"] = const_1088;
         param1["tab_button"] = const_851;
         param1["tab_container_button"] = const_1054;
         param1["tab_context"] = const_507;
         param1["tab_content"] = const_1247;
         param1["tab_selector"] = const_767;
         param1["text"] = const_556;
         param1["input"] = const_867;
         param1["toolbar"] = const_1526;
         param1["tooltip"] = const_419;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
