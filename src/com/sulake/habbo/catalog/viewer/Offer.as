package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1553:String = "pricing_model_unknown";
      
      public static const const_411:String = "pricing_model_single";
      
      public static const const_365:String = "pricing_model_multi";
      
      public static const const_571:String = "pricing_model_bundle";
      
      public static const PRICE_TYPE_NONE:String = "price_type_none";
      
      public static const const_694:String = "price_type_credits";
      
      public static const const_1170:String = "price_type_activitypoints";
      
      public static const const_1190:String = "price_type_credits_and_activitypoints";
       
      
      private var var_802:String;
      
      private var var_1208:String;
      
      private var _offerId:int;
      
      private var var_1905:String;
      
      private var var_1209:int;
      
      private var var_1207:int;
      
      private var var_1904:int;
      
      private var var_385:ICatalogPage;
      
      private var var_656:IProductContainer;
      
      private var var_1503:String = "";
      
      private var var_2634:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this._offerId = param1;
         this.var_1905 = param2;
         this.var_1209 = param3;
         this.var_1207 = param4;
         this.var_1904 = param5;
         this.var_385 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get extraParameter() : String
      {
         return this.var_1503;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1503 = param1;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_385;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1905;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1209;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1207;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1904;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_656;
      }
      
      public function get pricingModel() : String
      {
         return this.var_802;
      }
      
      public function get priceType() : String
      {
         return this.var_1208;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2634;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2634 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1905 = "";
         this.var_1209 = 0;
         this.var_1207 = 0;
         this.var_1904 = 0;
         this.var_385 = null;
         if(this.var_656 != null)
         {
            this.var_656.dispose();
            this.var_656 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_802)
         {
            case const_411:
               this.var_656 = new SingleProductContainer(this,param1);
               break;
            case const_365:
               this.var_656 = new MultiProductContainer(this,param1);
               break;
            case const_571:
               this.var_656 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_802);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_802 = const_411;
            }
            else
            {
               this.var_802 = const_365;
            }
         }
         else if(param1.length > 1)
         {
            this.var_802 = const_571;
         }
         else
         {
            this.var_802 = const_1553;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1209 > 0 && this.var_1207 > 0)
         {
            this.var_1208 = const_1190;
         }
         else if(this.var_1209 > 0)
         {
            this.var_1208 = const_694;
         }
         else if(this.var_1207 > 0)
         {
            this.var_1208 = const_1170;
         }
         else
         {
            this.var_1208 = PRICE_TYPE_NONE;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_385.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_656.products)
         {
            _loc4_ = this.var_385.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
