package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1698:int;
      
      private var _currentPosition:int;
      
      private var var_1696:int;
      
      private var var_1697:int;
      
      private var var_1695:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1698;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1696;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1697;
      }
      
      public function get syncCount() : int
      {
         return this.var_1695;
      }
      
      public function flush() : Boolean
      {
         this.var_1698 = -1;
         this._currentPosition = -1;
         this.var_1696 = -1;
         this.var_1697 = -1;
         this.var_1695 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1698 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1696 = param1.readInteger();
         this.var_1697 = param1.readInteger();
         this.var_1695 = param1.readInteger();
         return true;
      }
   }
}
