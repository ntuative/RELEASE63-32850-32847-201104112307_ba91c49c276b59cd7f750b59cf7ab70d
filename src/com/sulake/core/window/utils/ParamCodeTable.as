package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_203;
         param1["bound_to_parent_rect"] = const_102;
         param1["child_window"] = const_1118;
         param1["embedded_controller"] = const_1256;
         param1["resize_to_accommodate_children"] = const_71;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_719;
         param1["mouse_dragging_target"] = const_271;
         param1["mouse_dragging_trigger"] = const_375;
         param1["mouse_scaling_target"] = const_327;
         param1["mouse_scaling_trigger"] = const_527;
         param1["horizontal_mouse_scaling_trigger"] = const_253;
         param1["vertical_mouse_scaling_trigger"] = const_227;
         param1["observe_parent_input_events"] = const_1053;
         param1["optimize_region_to_layout_size"] = const_509;
         param1["parent_window"] = const_1211;
         param1["relative_horizontal_scale_center"] = const_187;
         param1["relative_horizontal_scale_fixed"] = const_140;
         param1["relative_horizontal_scale_move"] = const_429;
         param1["relative_horizontal_scale_strech"] = const_370;
         param1["relative_scale_center"] = const_1094;
         param1["relative_scale_fixed"] = const_805;
         param1["relative_scale_move"] = const_1105;
         param1["relative_scale_strech"] = const_1091;
         param1["relative_vertical_scale_center"] = const_201;
         param1["relative_vertical_scale_fixed"] = const_139;
         param1["relative_vertical_scale_move"] = const_268;
         param1["relative_vertical_scale_strech"] = const_308;
         param1["on_resize_align_left"] = const_944;
         param1["on_resize_align_right"] = const_466;
         param1["on_resize_align_center"] = const_495;
         param1["on_resize_align_top"] = const_745;
         param1["on_resize_align_bottom"] = const_576;
         param1["on_resize_align_middle"] = const_565;
         param1["on_accommodate_align_left"] = const_1181;
         param1["on_accommodate_align_right"] = const_572;
         param1["on_accommodate_align_center"] = const_711;
         param1["on_accommodate_align_top"] = const_1141;
         param1["on_accommodate_align_bottom"] = const_611;
         param1["on_accommodate_align_middle"] = const_677;
         param1["route_input_events_to_parent"] = const_490;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1210;
         param1["scalable_with_mouse"] = const_1068;
         param1["reflect_horizontal_resize_to_parent"] = const_467;
         param1["reflect_vertical_resize_to_parent"] = const_607;
         param1["reflect_resize_to_parent"] = const_289;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1055;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
