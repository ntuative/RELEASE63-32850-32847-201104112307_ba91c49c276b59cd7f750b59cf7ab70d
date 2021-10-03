package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_650:String;
      
      private var var_1006:String;
      
      private var var_2391:String;
      
      private var var_1702:String;
      
      private var var_2390:int;
      
      private var var_2396:String;
      
      private var var_2393:int;
      
      private var var_2392:int;
      
      private var var_2395:int;
      
      private var _respectLeft:int;
      
      private var var_850:int;
      
      private var var_2394:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_650 = param1.readString();
         this.var_1006 = param1.readString();
         this.var_2391 = param1.readString();
         this.var_1702 = param1.readString();
         this.var_2390 = param1.readInteger();
         this.var_2396 = param1.readString();
         this.var_2393 = param1.readInteger();
         this.var_2392 = param1.readInteger();
         this.var_2395 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_850 = param1.readInteger();
         this.var_2394 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_650;
      }
      
      public function get sex() : String
      {
         return this.var_1006;
      }
      
      public function get customData() : String
      {
         return this.var_2391;
      }
      
      public function get realName() : String
      {
         return this.var_1702;
      }
      
      public function get tickets() : int
      {
         return this.var_2390;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2396;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2393;
      }
      
      public function get directMail() : int
      {
         return this.var_2392;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2395;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_850;
      }
      
      public function get identityId() : int
      {
         return this.var_2394;
      }
   }
}
