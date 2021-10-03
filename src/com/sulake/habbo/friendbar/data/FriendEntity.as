package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_975:int;
      
      private var var_795:Boolean;
      
      private var var_1700:Boolean;
      
      private var var_650:String;
      
      private var var_1442:int;
      
      private var var_1699:String;
      
      private var var_1701:String;
      
      private var var_1702:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1702 = param3;
         this.var_1699 = param4;
         this.var_975 = param5;
         this.var_795 = param6;
         this.var_1700 = param7;
         this.var_650 = param8;
         this.var_1442 = param9;
         this.var_1701 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_975;
      }
      
      public function get online() : Boolean
      {
         return this.var_795;
      }
      
      public function get allowFollow() : Boolean
      {
         return this.var_1700;
      }
      
      public function get figure() : String
      {
         return this.var_650;
      }
      
      public function get categoryId() : int
      {
         return this.var_1442;
      }
      
      public function get motto() : String
      {
         return this.var_1699;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1701;
      }
      
      public function get realName() : String
      {
         return this.var_1702;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_975 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_795 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_1700 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_650 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1442 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1699 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1701 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1702 = param1;
      }
   }
}
