package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_339:int;
      
      private var var_2252:int;
      
      private var var_2319:Boolean;
      
      private var var_2320:int;
      
      private var _ownerName:String;
      
      private var var_117:RoomData;
      
      private var var_763:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_339 = param1.readInteger();
         this.var_2252 = param1.readInteger();
         this.var_2319 = param1.readBoolean();
         this.var_2320 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_117 = new RoomData(param1);
         this.var_763 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_117 != null)
         {
            this.var_117.dispose();
            this.var_117 = null;
         }
         if(this.var_763 != null)
         {
            this.var_763.dispose();
            this.var_763 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_339;
      }
      
      public function get userCount() : int
      {
         return this.var_2252;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2319;
      }
      
      public function get ownerId() : int
      {
         return this.var_2320;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_117;
      }
      
      public function get event() : RoomData
      {
         return this.var_763;
      }
   }
}
