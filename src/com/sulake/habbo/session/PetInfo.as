package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_2039:int;
      
      private var var_1580:int;
      
      private var var_2707:int;
      
      private var var_2337:int;
      
      private var var_2709:int;
      
      private var _energy:int;
      
      private var var_2710:int;
      
      private var _nutrition:int;
      
      private var var_2708:int;
      
      private var var_2320:int;
      
      private var _ownerName:String;
      
      private var var_2398:int;
      
      private var var_485:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_2039;
      }
      
      public function get level() : int
      {
         return this.var_1580;
      }
      
      public function get levelMax() : int
      {
         return this.var_2707;
      }
      
      public function get experience() : int
      {
         return this.var_2337;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2709;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2710;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2708;
      }
      
      public function get ownerId() : int
      {
         return this.var_2320;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2398;
      }
      
      public function get age() : int
      {
         return this.var_485;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_2039 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1580 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2707 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2337 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2709 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2710 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2708 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2320 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2398 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_485 = param1;
      }
   }
}
