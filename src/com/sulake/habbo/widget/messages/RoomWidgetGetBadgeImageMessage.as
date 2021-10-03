package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_862:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_328:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_862);
         this.var_328 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_328;
      }
   }
}
