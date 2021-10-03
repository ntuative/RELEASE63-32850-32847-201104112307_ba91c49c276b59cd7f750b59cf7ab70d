package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2609:String;
      
      private var var_2453:int;
      
      private var var_2456:int;
      
      private var var_2633:String;
      
      private var var_2824:int;
      
      private var var_1958:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2609 = param1.readString();
         this.var_2453 = param1.readInteger();
         this.var_2456 = param1.readInteger();
         this.var_2633 = param1.readString();
         this.var_2824 = param1.readInteger();
         this.var_1958 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2609;
      }
      
      public function get unitPort() : int
      {
         return this.var_2453;
      }
      
      public function get worldId() : int
      {
         return this.var_2456;
      }
      
      public function get castLibs() : String
      {
         return this.var_2633;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2824;
      }
      
      public function get nodeId() : int
      {
         return this.var_1958;
      }
   }
}
