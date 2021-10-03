package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2451:int;
      
      private var var_2452:int;
      
      private var var_1209:int;
      
      private var var_1207:int;
      
      private var var_1904:int;
      
      private var var_2450:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2451 = param1.readInteger();
         this.var_2452 = param1.readInteger();
         this.var_1209 = param1.readInteger();
         this.var_1207 = param1.readInteger();
         this.var_1904 = param1.readInteger();
         this.var_2450 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2451;
      }
      
      public function get charges() : int
      {
         return this.var_2452;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1209;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1207;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2450;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1904;
      }
   }
}
