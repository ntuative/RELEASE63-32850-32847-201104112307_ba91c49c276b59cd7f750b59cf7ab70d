package com.sulake.habbo.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_399:String = "RWWCIDE_CHAT_INPUT_CONTENT";
      
      public static const const_826:String = "whisper";
      
      public static const const_1235:String = "shout";
       
      
      private var var_2158:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_399,param3,param4);
         this.var_2158 = param1;
         this._userName = param2;
      }
      
      public function get messageType() : String
      {
         return this.var_2158;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}
