package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_775:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2474:int;
      
      private var var_2473:int;
      
      private var _color:uint;
      
      private var var_1168:int;
      
      private var var_2475:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_775);
         this.var_2474 = param1;
         this.var_2473 = param2;
         this._color = param3;
         this.var_1168 = param4;
         this.var_2475 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2474;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2473;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1168;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2475;
      }
   }
}
