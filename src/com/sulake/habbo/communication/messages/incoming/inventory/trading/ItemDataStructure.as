package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2272:int;
      
      private var var_1500:String;
      
      private var var_2270:int;
      
      private var var_2271:int;
      
      private var _category:int;
      
      private var var_2100:String;
      
      private var var_1571:int;
      
      private var var_2267:int;
      
      private var var_2269:int;
      
      private var var_2268:int;
      
      private var var_2266:int;
      
      private var var_2265:Boolean;
      
      private var var_2937:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2272 = param1;
         this.var_1500 = param2;
         this.var_2270 = param3;
         this.var_2271 = param4;
         this._category = param5;
         this.var_2100 = param6;
         this.var_1571 = param7;
         this.var_2267 = param8;
         this.var_2269 = param9;
         this.var_2268 = param10;
         this.var_2266 = param11;
         this.var_2265 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2272;
      }
      
      public function get itemType() : String
      {
         return this.var_1500;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2270;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2271;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2100;
      }
      
      public function get extra() : int
      {
         return this.var_1571;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2267;
      }
      
      public function get creationDay() : int
      {
         return this.var_2269;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2268;
      }
      
      public function get creationYear() : int
      {
         return this.var_2266;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2265;
      }
      
      public function get songID() : int
      {
         return this.var_1571;
      }
   }
}
