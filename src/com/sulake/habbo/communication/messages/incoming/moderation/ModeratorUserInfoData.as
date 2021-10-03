package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2280:int;
      
      private var var_2283:int;
      
      private var var_795:Boolean;
      
      private var var_2281:int;
      
      private var var_2285:int;
      
      private var var_2284:int;
      
      private var var_2282:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2280 = param1.readInteger();
         this.var_2283 = param1.readInteger();
         this.var_795 = param1.readBoolean();
         this.var_2281 = param1.readInteger();
         this.var_2285 = param1.readInteger();
         this.var_2284 = param1.readInteger();
         this.var_2282 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2280;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2283;
      }
      
      public function get online() : Boolean
      {
         return this.var_795;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2281;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2285;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2284;
      }
      
      public function get banCount() : int
      {
         return this.var_2282;
      }
   }
}
