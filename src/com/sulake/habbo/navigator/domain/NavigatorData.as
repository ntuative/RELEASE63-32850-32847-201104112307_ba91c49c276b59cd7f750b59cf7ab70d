package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1787:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_204:MsgWithRequestId;
      
      private var var_642:RoomEventData;
      
      private var var_2575:Boolean;
      
      private var var_2568:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2316:int;
      
      private var var_256:GuestRoomData;
      
      private var var_969:PublicRoomShortData;
      
      private var var_2570:int;
      
      private var var_2566:Boolean;
      
      private var var_2574:int;
      
      private var var_2572:Boolean;
      
      private var var_1861:int;
      
      private var var_2569:Boolean;
      
      private var var_1419:Array;
      
      private var var_1449:Array;
      
      private var var_2573:int;
      
      private var var_1448:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1186:Boolean;
      
      private var var_2567:int;
      
      private var var_2576:Boolean;
      
      private var var_2571:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1419 = new Array();
         this.var_1449 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_256 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_256 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_969 = null;
         this.var_256 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_969 = param1.publicSpace;
            this.var_642 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_642 != null)
         {
            this.var_642.dispose();
            this.var_642 = null;
         }
         if(this.var_969 != null)
         {
            this.var_969.dispose();
            this.var_969 = null;
         }
         if(this.var_256 != null)
         {
            this.var_256.dispose();
            this.var_256 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_256 != null)
         {
            this.var_256.dispose();
         }
         this.var_256 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_642 != null)
         {
            this.var_642.dispose();
         }
         this.var_642 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_204 != null && this.var_204 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_204 != null && this.var_204 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_204 != null && this.var_204 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_204 = param1;
         this.var_1186 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_204 = param1;
         this.var_1186 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_204 = param1;
         this.var_1186 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_204 == null)
         {
            return;
         }
         this.var_204.dispose();
         this.var_204 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_204 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_204 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_204 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_642;
      }
      
      public function get avatarId() : int
      {
         return this.var_2316;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2575;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2568;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_256;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_969;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2566;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2574;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1861;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2572;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2567;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2570;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2569;
      }
      
      public function get adIndex() : int
      {
         return this.var_2571;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2576;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2316 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2574 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2566 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2575 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2568 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2572 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1861 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2567 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2570 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2569 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2571 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2576 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1419 = param1;
         this.var_1449 = new Array();
         for each(_loc2_ in this.var_1419)
         {
            if(_loc2_.visible)
            {
               this.var_1449.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1419;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1449;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2573 = param1.limit;
         this.var_1448 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1448 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_256.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_256 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_256.flatId;
         return this.var_1861 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1448 >= this.var_2573;
      }
      
      public function startLoading() : void
      {
         this.var_1186 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1186;
      }
   }
}
