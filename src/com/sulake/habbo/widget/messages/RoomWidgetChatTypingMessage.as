package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_863:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_583:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_863);
         this.var_583 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_583;
      }
   }
}
