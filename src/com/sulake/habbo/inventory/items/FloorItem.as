package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2100:String;
      
      protected var var_1571:Number;
      
      protected var var_2878:Boolean;
      
      protected var var_2877:Boolean;
      
      protected var var_2265:Boolean;
      
      protected var var_2144:Boolean;
      
      protected var var_2876:int;
      
      protected var var_2269:int;
      
      protected var var_2268:int;
      
      protected var var_2266:int;
      
      protected var var_1878:String;
      
      protected var var_1841:int;
      
      protected var var_924:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2265 = param5;
         this.var_2877 = param6;
         this.var_2878 = param7;
         this.var_2144 = param8;
         this.var_2100 = param9;
         this.var_1571 = param10;
         this.var_2876 = param11;
         this.var_2269 = param12;
         this.var_2268 = param13;
         this.var_2266 = param14;
         this.var_1878 = param15;
         this.var_1841 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2100;
      }
      
      public function get extra() : Number
      {
         return this.var_1571;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2878;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2877;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2265;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2144;
      }
      
      public function get expires() : int
      {
         return this.var_2876;
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
      
      public function get slotId() : String
      {
         return this.var_1878;
      }
      
      public function get songId() : int
      {
         return this.var_1841;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_924 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_924;
      }
   }
}
