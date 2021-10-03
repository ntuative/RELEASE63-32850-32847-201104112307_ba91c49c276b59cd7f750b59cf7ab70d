package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_339:int;
      
      private var var_763:Boolean;
      
      private var var_873:String;
      
      private var _ownerName:String;
      
      private var var_2247:int;
      
      private var var_2252:int;
      
      private var var_2249:int;
      
      private var var_1739:String;
      
      private var var_2251:int;
      
      private var var_2246:Boolean;
      
      private var var_761:int;
      
      private var var_1442:int;
      
      private var var_2253:String;
      
      private var var_868:Array;
      
      private var var_2248:RoomThumbnailData;
      
      private var var_2250:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_868 = new Array();
         super();
         this.var_339 = param1.readInteger();
         this.var_763 = param1.readBoolean();
         this.var_873 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2247 = param1.readInteger();
         this.var_2252 = param1.readInteger();
         this.var_2249 = param1.readInteger();
         this.var_1739 = param1.readString();
         this.var_2251 = param1.readInteger();
         this.var_2246 = param1.readBoolean();
         this.var_761 = param1.readInteger();
         this.var_1442 = param1.readInteger();
         this.var_2253 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_868.push(_loc4_);
            _loc3_++;
         }
         this.var_2248 = new RoomThumbnailData(param1);
         this.var_2250 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_868 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_339;
      }
      
      public function get event() : Boolean
      {
         return this.var_763;
      }
      
      public function get roomName() : String
      {
         return this.var_873;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2247;
      }
      
      public function get userCount() : int
      {
         return this.var_2252;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2249;
      }
      
      public function get description() : String
      {
         return this.var_1739;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2251;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2246;
      }
      
      public function get score() : int
      {
         return this.var_761;
      }
      
      public function get categoryId() : int
      {
         return this.var_1442;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2253;
      }
      
      public function get tags() : Array
      {
         return this.var_868;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2248;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2250;
      }
   }
}
