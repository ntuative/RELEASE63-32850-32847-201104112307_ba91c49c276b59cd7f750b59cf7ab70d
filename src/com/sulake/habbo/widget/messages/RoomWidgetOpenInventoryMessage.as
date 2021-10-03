package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_709:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1072:String = "inventory_effects";
      
      public static const const_1107:String = "inventory_badges";
      
      public static const const_1633:String = "inventory_clothes";
      
      public static const const_1617:String = "inventory_furniture";
       
      
      private var var_2223:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_709);
         this.var_2223 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2223;
      }
   }
}
