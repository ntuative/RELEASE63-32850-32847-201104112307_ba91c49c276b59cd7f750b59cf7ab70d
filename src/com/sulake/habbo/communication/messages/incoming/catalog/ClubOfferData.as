package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1671:String;
      
      private var var_1782:int;
      
      private var var_2668:Boolean;
      
      private var var_2666:Boolean;
      
      private var var_2662:int;
      
      private var var_2667:int;
      
      private var var_2664:int;
      
      private var var_2665:int;
      
      private var var_2663:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1671 = param1.readString();
         this.var_1782 = param1.readInteger();
         this.var_2668 = param1.readBoolean();
         this.var_2666 = param1.readBoolean();
         this.var_2662 = param1.readInteger();
         this.var_2667 = param1.readInteger();
         this.var_2664 = param1.readInteger();
         this.var_2665 = param1.readInteger();
         this.var_2663 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1671;
      }
      
      public function get price() : int
      {
         return this.var_1782;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2668;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2666;
      }
      
      public function get periods() : int
      {
         return this.var_2662;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2667;
      }
      
      public function get year() : int
      {
         return this.var_2664;
      }
      
      public function get month() : int
      {
         return this.var_2665;
      }
      
      public function get day() : int
      {
         return this.var_2663;
      }
   }
}
