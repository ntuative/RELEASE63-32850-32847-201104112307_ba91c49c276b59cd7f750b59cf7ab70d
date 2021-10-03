package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_160:Number = 0;
      
      private var var_161:Number = 0;
      
      private var var_2294:Number = 0;
      
      private var var_2297:Number = 0;
      
      private var var_2295:Number = 0;
      
      private var var_2298:Number = 0;
      
      private var var_384:int = 0;
      
      private var var_2296:int = 0;
      
      private var var_331:Array;
      
      private var var_2293:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_331 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_160 = param3;
         this.var_161 = param4;
         this.var_2294 = param5;
         this.var_384 = param6;
         this.var_2296 = param7;
         this.var_2297 = param8;
         this.var_2295 = param9;
         this.var_2298 = param10;
         this.var_2293 = param11;
         this.var_331 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_160;
      }
      
      public function get z() : Number
      {
         return this.var_161;
      }
      
      public function get localZ() : Number
      {
         return this.var_2294;
      }
      
      public function get targetX() : Number
      {
         return this.var_2297;
      }
      
      public function get targetY() : Number
      {
         return this.var_2295;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2298;
      }
      
      public function get dir() : int
      {
         return this.var_384;
      }
      
      public function get dirHead() : int
      {
         return this.var_2296;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2293;
      }
      
      public function get actions() : Array
      {
         return this.var_331.slice();
      }
   }
}
