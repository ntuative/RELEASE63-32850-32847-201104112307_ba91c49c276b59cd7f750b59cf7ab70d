package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const const_794:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const const_583:String = "RWPCM_PET_COMMAND";
       
      
      private var var_2039:int = 0;
      
      private var var_176:String;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         this.var_2039 = param2;
         this.var_176 = param3;
      }
      
      public function get petId() : int
      {
         return this.var_2039;
      }
      
      public function get value() : String
      {
         return this.var_176;
      }
   }
}
