package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1846:String = "i";
      
      public static const const_1927:String = "s";
      
      public static const const_1996:String = "e";
       
      
      private var _type:String;
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_2488:int;
      
      private var _revision:int;
      
      private var var_2490:int;
      
      private var var_2489:int;
      
      private var var_2492:int;
      
      private var var_927:Array;
      
      private var _title:String;
      
      private var var_1739:String;
      
      private var var_2493:String;
      
      private var var_2491:int;
      
      private var _offerId:int;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String, param13:int, param14:int)
      {
         super();
         this._type = param1;
         this._id = param2;
         this._name = param3;
         this.var_2488 = param4;
         this._revision = param5;
         this.var_2490 = param6;
         this.var_2489 = param7;
         this.var_2492 = param8;
         this.var_927 = param9;
         this._title = param10;
         this.var_1739 = param11;
         this.var_2493 = param12;
         this.var_2491 = param13;
         this._offerId = param14;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get colourIndex() : int
      {
         return this.var_2488;
      }
      
      public function get revision() : int
      {
         return this._revision;
      }
      
      public function get tileSizeX() : int
      {
         return this.var_2490;
      }
      
      public function get tileSizeY() : int
      {
         return this.var_2489;
      }
      
      public function get tileSizeZ() : int
      {
         return this.var_2492;
      }
      
      public function get colours() : Array
      {
         return this.var_927;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get description() : String
      {
         return this.var_1739;
      }
      
      public function get adUrl() : String
      {
         return this.var_2493;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2491;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
   }
}
