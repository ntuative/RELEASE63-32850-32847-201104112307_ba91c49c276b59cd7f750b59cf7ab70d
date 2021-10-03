package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_391:int = 0;
      
      private var var_1609:int = 0;
      
      private var var_1610:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_391;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1609;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1610;
      }
      
      public function flush() : Boolean
      {
         this.var_391 = 0;
         this.var_1609 = 0;
         this.var_1610 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_391 = param1.readInteger();
         this.var_1609 = param1.readInteger();
         this.var_1610 = param1.readString();
         return true;
      }
   }
}
