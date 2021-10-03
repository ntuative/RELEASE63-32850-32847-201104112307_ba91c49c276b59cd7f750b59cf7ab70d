package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1459:Boolean;
      
      private var var_2245:int;
      
      private var var_1704:int;
      
      private var var_1703:int;
      
      private var var_2242:int;
      
      private var var_2243:int;
      
      private var var_2244:int;
      
      private var var_2134:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1459;
      }
      
      public function get commission() : int
      {
         return this.var_2245;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1704;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1703;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2243;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2242;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2244;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2134;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1459 = param1.readBoolean();
         this.var_2245 = param1.readInteger();
         this.var_1704 = param1.readInteger();
         this.var_1703 = param1.readInteger();
         this.var_2243 = param1.readInteger();
         this.var_2242 = param1.readInteger();
         this.var_2244 = param1.readInteger();
         this.var_2134 = param1.readInteger();
         return true;
      }
   }
}
