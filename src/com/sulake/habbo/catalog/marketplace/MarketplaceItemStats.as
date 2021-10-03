package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2353:int;
      
      private var var_2422:int;
      
      private var var_2420:int;
      
      private var _dayOffsets:Array;
      
      private var var_1765:Array;
      
      private var var_1764:Array;
      
      private var var_2421:int;
      
      private var var_2423:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2353;
      }
      
      public function get offerCount() : int
      {
         return this.var_2422;
      }
      
      public function get historyLength() : int
      {
         return this.var_2420;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1765;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1764;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2421;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2423;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2353 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2422 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2420 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1765 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1764 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2421 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2423 = param1;
      }
   }
}
