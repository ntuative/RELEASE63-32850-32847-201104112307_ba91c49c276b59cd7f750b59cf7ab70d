package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1926:Boolean;
      
      private var var_2669:int;
      
      private var var_413:Boolean;
      
      private var var_1225:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1926;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2669;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1225;
      }
      
      public function get owner() : Boolean
      {
         return this.var_413;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1225 != null)
         {
            this.var_1225.dispose();
            this.var_1225 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1926 = param1.readBoolean();
         if(this.var_1926)
         {
            this.var_2669 = param1.readInteger();
            this.var_413 = param1.readBoolean();
         }
         else
         {
            this.var_1225 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
