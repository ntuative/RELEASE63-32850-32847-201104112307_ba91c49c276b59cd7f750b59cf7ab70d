package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_861:String = "RWUAM_WHISPER_USER";
      
      public static const const_703:String = "RWUAM_IGNORE_USER";
      
      public static const const_929:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_481:String = "RWUAM_KICK_USER";
      
      public static const const_905:String = "RWUAM_BAN_USER";
      
      public static const const_787:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_773:String = "RWUAM_RESPECT_USER";
      
      public static const const_712:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_683:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_950:String = "RWUAM_START_TRADING";
      
      public static const const_891:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_558:String = "RWUAM_KICK_BOT";
      
      public static const const_679:String = "RWUAM_REPORT";
      
      public static const const_504:String = "RWUAM_PICKUP_PET";
      
      public static const const_1680:String = "RWUAM_TRAIN_PET";
      
      public static const const_563:String = " RWUAM_RESPECT_PET";
      
      public static const const_380:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_890:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
