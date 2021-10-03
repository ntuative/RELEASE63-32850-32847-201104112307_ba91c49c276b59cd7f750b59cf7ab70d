package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1580:int;
      
      private var var_328:String;
      
      private var var_2225:int;
      
      private var var_2226:int;
      
      private var var_2053:int;
      
      private var var_2227:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1580 = param1.readInteger();
         this.var_328 = param1.readString();
         this.var_2225 = param1.readInteger();
         this.var_2226 = param1.readInteger();
         this.var_2053 = param1.readInteger();
         this.var_2227 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_328;
      }
      
      public function get level() : int
      {
         return this.var_1580;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2225;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2226;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2053;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2227;
      }
   }
}
