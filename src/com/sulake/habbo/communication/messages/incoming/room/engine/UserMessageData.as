package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1052:String = "M";
      
      public static const const_1477:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_160:Number = 0;
      
      private var var_161:Number = 0;
      
      private var var_384:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_1006:String = "";
      
      private var var_650:String = "";
      
      private var var_2196:String = "";
      
      private var var_2167:int;
      
      private var var_2198:int = 0;
      
      private var var_2195:String = "";
      
      private var var_2197:int = 0;
      
      private var var_2194:int = 0;
      
      private var var_2344:String = "";
      
      private var var_177:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_177 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_177)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_160;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_177)
         {
            this.var_160 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_161;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_177)
         {
            this.var_161 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_384;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_384 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_177)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_177)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_1006;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_177)
         {
            this.var_1006 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_650;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_177)
         {
            this.var_650 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2196;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_177)
         {
            this.var_2196 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2167;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_2167 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2198;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_2198 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2195;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_177)
         {
            this.var_2195 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2197;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_2197 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2194;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_2194 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2344;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_177)
         {
            this.var_2344 = param1;
         }
      }
   }
}
