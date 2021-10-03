package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1096:int = 1;
      
      public static const const_930:int = 2;
      
      public static const const_697:int = 3;
      
      public static const const_1478:int = 4;
       
      
      private var _index:int;
      
      private var var_2528:String;
      
      private var var_2526:String;
      
      private var var_2529:Boolean;
      
      private var var_2527:String;
      
      private var var_896:String;
      
      private var var_2530:int;
      
      private var var_2252:int;
      
      private var _type:int;
      
      private var var_2181:String;
      
      private var var_959:GuestRoomData;
      
      private var var_958:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2528 = param1.readString();
         this.var_2526 = param1.readString();
         this.var_2529 = param1.readInteger() == 1;
         this.var_2527 = param1.readString();
         this.var_896 = param1.readString();
         this.var_2530 = param1.readInteger();
         this.var_2252 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1096)
         {
            this.var_2181 = param1.readString();
         }
         else if(this._type == const_697)
         {
            this.var_958 = new PublicRoomData(param1);
         }
         else if(this._type == const_930)
         {
            this.var_959 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_959 != null)
         {
            this.var_959.dispose();
            this.var_959 = null;
         }
         if(this.var_958 != null)
         {
            this.var_958.dispose();
            this.var_958 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2528;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2526;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2529;
      }
      
      public function get picText() : String
      {
         return this.var_2527;
      }
      
      public function get picRef() : String
      {
         return this.var_896;
      }
      
      public function get folderId() : int
      {
         return this.var_2530;
      }
      
      public function get tag() : String
      {
         return this.var_2181;
      }
      
      public function get userCount() : int
      {
         return this.var_2252;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_959;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_958;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1096)
         {
            return 0;
         }
         if(this.type == const_930)
         {
            return this.var_959.maxUserCount;
         }
         if(this.type == const_697)
         {
            return this.var_958.maxUsers;
         }
         return 0;
      }
   }
}
