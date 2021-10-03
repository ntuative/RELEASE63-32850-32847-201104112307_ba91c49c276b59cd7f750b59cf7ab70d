package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_736:int = 1;
      
      public static const const_783:int = 2;
      
      public static const const_923:int = 3;
      
      public static const const_1142:int = 4;
      
      public static const const_720:int = 5;
      
      public static const const_1079:int = 6;
       
      
      private var _type:int;
      
      private var var_1235:int;
      
      private var var_2287:String;
      
      private var var_2525:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1235 = param2;
         this.var_2287 = param3;
         this.var_2525 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2287;
      }
      
      public function get time() : String
      {
         return this.var_2525;
      }
      
      public function get senderId() : int
      {
         return this.var_1235;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
