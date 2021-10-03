package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2437:int;
      
      private var var_1500:String;
      
      private var _objId:int;
      
      private var var_1670:int;
      
      private var _category:int;
      
      private var var_2100:String;
      
      private var var_2438:Boolean;
      
      private var var_2439:Boolean;
      
      private var var_2440:Boolean;
      
      private var var_2358:Boolean;
      
      private var var_2385:int;
      
      private var var_1571:int;
      
      private var var_1878:String = "";
      
      private var var_1841:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2437 = param1;
         this.var_1500 = param2;
         this._objId = param3;
         this.var_1670 = param4;
         this._category = param5;
         this.var_2100 = param6;
         this.var_2438 = param7;
         this.var_2439 = param8;
         this.var_2440 = param9;
         this.var_2358 = param10;
         this.var_2385 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1878 = param1;
         this.var_1571 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2437;
      }
      
      public function get itemType() : String
      {
         return this.var_1500;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1670;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2100;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2438;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2439;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2440;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2358;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2385;
      }
      
      public function get slotId() : String
      {
         return this.var_1878;
      }
      
      public function get songId() : int
      {
         return this.var_1841;
      }
      
      public function get extra() : int
      {
         return this.var_1571;
      }
   }
}
