package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_129:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_112:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1164:int = 2;
      
      public static const const_1174:int = 3;
      
      public static const const_1512:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1699:String = "";
      
      private var var_2167:int;
      
      private var var_2198:int = 0;
      
      private var var_2194:int = 0;
      
      private var var_650:String = "";
      
      private var var_47:BitmapData = null;
      
      private var var_269:Array;
      
      private var var_1473:int = 0;
      
      private var var_2554:String = "";
      
      private var var_2556:int = 0;
      
      private var var_2555:int = 0;
      
      private var var_1713:Boolean = false;
      
      private var var_1702:String = "";
      
      private var var_2827:Boolean = false;
      
      private var var_2826:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2832:Boolean = false;
      
      private var var_2831:Boolean = false;
      
      private var var_2829:Boolean = false;
      
      private var var_2828:Boolean = false;
      
      private var var_2833:Boolean = false;
      
      private var var_2825:Boolean = false;
      
      private var var_2830:int = 0;
      
      private var var_1715:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_269 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1699 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1699;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2167 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2167;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2198 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2198;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2194 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2194;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_650 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_650;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_47 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_269 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_269;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1473 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1473;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2554 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2554;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2827 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2827;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2832 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2832;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2831 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2831;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2829 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2829;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2828 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2828;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2833 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2833;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2825 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2825;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2830 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2830;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2826 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2826;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1715 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1715;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2556 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2556;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2555 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2555;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1713 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1713;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1702 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1702;
      }
   }
}
