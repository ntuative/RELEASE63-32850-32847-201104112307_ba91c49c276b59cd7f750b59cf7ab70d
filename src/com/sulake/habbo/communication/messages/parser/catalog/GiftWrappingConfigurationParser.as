package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2137:Boolean;
      
      private var var_2136:int;
      
      private var var_1604:Array;
      
      private var var_822:Array;
      
      private var var_821:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2137;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2136;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1604;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_822;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_821;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1604 = [];
         this.var_822 = [];
         this.var_821 = [];
         this.var_2137 = param1.readBoolean();
         this.var_2136 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1604.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_822.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_821.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
