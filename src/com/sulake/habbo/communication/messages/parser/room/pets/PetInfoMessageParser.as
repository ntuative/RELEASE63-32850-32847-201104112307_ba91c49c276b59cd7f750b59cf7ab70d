package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2039:int;
      
      private var _name:String;
      
      private var var_1580:int;
      
      private var var_2855:int;
      
      private var var_2337:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_650:String;
      
      private var var_2854:int;
      
      private var var_2852:int;
      
      private var var_2853:int;
      
      private var var_2398:int;
      
      private var var_2320:int;
      
      private var _ownerName:String;
      
      private var var_485:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_2039;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1580;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2855;
      }
      
      public function get experience() : int
      {
         return this.var_2337;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_650;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2854;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2852;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2853;
      }
      
      public function get respect() : int
      {
         return this.var_2398;
      }
      
      public function get ownerId() : int
      {
         return this.var_2320;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_485;
      }
      
      public function flush() : Boolean
      {
         this.var_2039 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_2039 = param1.readInteger();
         this._name = param1.readString();
         this.var_1580 = param1.readInteger();
         this.var_2855 = param1.readInteger();
         this.var_2337 = param1.readInteger();
         this.var_2854 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2852 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2853 = param1.readInteger();
         this.var_650 = param1.readString();
         this.var_2398 = param1.readInteger();
         this.var_2320 = param1.readInteger();
         this.var_485 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
