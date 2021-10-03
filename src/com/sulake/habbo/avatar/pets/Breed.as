package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var _id:int;
      
      private var var_2359:String = "";
      
      private var var_975:String;
      
      private var var_1458:Boolean;
      
      private var var_2358:Boolean = true;
      
      private var var_2356:int;
      
      private var var_2357:String;
      
      public function Breed(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         this.var_2356 = parseInt(param1.@pattern);
         this.var_975 = String(param1.@gender);
         this.var_1458 = Boolean(parseInt(param1.@colorable));
         this.var_2359 = String(param1.@localizationKey);
         if(param1.@sellable && param1.@sellable == "0")
         {
            this.var_2358 = false;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get gender() : String
      {
         return this.var_975;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1458;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2358;
      }
      
      public function get patternId() : int
      {
         return this.var_2356;
      }
      
      public function get avatarFigureString() : String
      {
         return this.var_2357;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         this.var_2357 = param1;
      }
      
      public function get localizationKey() : String
      {
         return this.var_2359;
      }
   }
}
