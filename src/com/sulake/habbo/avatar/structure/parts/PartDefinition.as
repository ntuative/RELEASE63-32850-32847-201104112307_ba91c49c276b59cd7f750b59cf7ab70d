package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2693:String;
      
      private var var_1940:String;
      
      private var var_2694:String;
      
      private var var_1941:Boolean;
      
      private var var_1939:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2693 = String(param1["set-type"]);
         this.var_1940 = String(param1["flipped-set-type"]);
         this.var_2694 = String(param1["remove-set-type"]);
         this.var_1941 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1939 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1939;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1939 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2693;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1940;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2694;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1941;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1941 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1940 = param1;
      }
   }
}
