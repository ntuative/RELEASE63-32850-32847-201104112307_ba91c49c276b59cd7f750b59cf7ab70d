package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_426:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1195:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1155:String = "RWOCM_PIXELS";
      
      public static const const_1217:String = "RWOCM_CREDITS";
       
      
      private var var_2433:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_426);
         this.var_2433 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2433;
      }
   }
}
