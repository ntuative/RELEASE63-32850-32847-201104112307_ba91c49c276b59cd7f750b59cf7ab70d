package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1911:int = 0;
      
      private var var_1912:int = 0;
      
      private var var_1904:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1911;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1912;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1904;
      }
      
      public function flush() : Boolean
      {
         this.var_1911 = 0;
         this.var_1912 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1911 = param1.readInteger();
         this.var_1912 = param1.readInteger();
         this.var_1904 = param1.readInteger();
         return true;
      }
   }
}
