package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1671:String;
      
      private var var_1782:int;
      
      private var var_2668:Boolean;
      
      private var var_2666:Boolean;
      
      private var var_2662:int;
      
      private var var_2667:int;
      
      private var var_385:ICatalogPage;
      
      private var var_2664:int;
      
      private var var_2665:int;
      
      private var var_2663:int;
      
      private var var_1503:String;
      
      private var var_2661:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1671 = param2;
         this.var_1782 = param3;
         this.var_2668 = param4;
         this.var_2666 = param5;
         this.var_2662 = param6;
         this.var_2667 = param7;
         this.var_2664 = param8;
         this.var_2665 = param9;
         this.var_2663 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get extraParameter() : String
      {
         return this.var_1503;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1503 = param1;
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_195;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1782;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_385;
      }
      
      public function get priceType() : String
      {
         return Offer.const_694;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1671;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_385 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2661;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2661 = param1;
      }
   }
}
