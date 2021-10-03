package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_2039:int;
      
      private var var_1573:Array;
      
      private var var_1094:Array;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_2039;
      }
      
      public function get allCommands() : Array
      {
         return this.var_1573;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_1094;
      }
      
      public function flush() : Boolean
      {
         this.var_2039 = -1;
         this.var_1573 = null;
         this.var_1094 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_2039 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1573 = new Array();
         while(_loc2_-- > 0)
         {
            this.var_1573.push(param1.readInteger());
         }
         var _loc3_:int = param1.readInteger();
         this.var_1094 = new Array();
         while(_loc3_-- > 0)
         {
            this.var_1094.push(param1.readInteger());
         }
         return true;
      }
   }
}
