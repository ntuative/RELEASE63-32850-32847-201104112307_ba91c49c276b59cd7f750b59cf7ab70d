package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectFurnitureActionEvent extends RoomObjectEvent
   {
      
      public static const const_476:String = "ROFCAE_DICE_OFF";
      
      public static const const_493:String = "ROFCAE_DICE_ACTIVATE";
      
      public static const const_604:String = "ROFCAE_USE_HABBOWHEEL";
      
      public static const const_573:String = "ROFCAE_STICKIE";
      
      public static const const_446:String = "ROFCAE_VIRAL_GIFT";
      
      public static const const_549:String = "ROFCAE_ENTER_ONEWAYDOOR";
      
      public static const const_448:String = "ROFCAE_QUEST_VENDING";
      
      public static const const_542:String = "ROFCAE_SOUND_MACHINE_INIT";
      
      public static const const_560:String = "ROFCAE_SOUND_MACHINE_START";
      
      public static const const_502:String = "ROFCAE_SOUND_MACHINE_STOP";
      
      public static const const_453:String = "ROFCAE_SOUND_MACHINE_DISPOSE";
      
      public static const const_512:String = "ROFCAE_JUKEBOX_INIT";
      
      public static const const_477:String = "ROFCAE_JUKEBOX_START";
      
      public static const const_567:String = "ROFCAE_JUKEBOX_MACHINE_STOP";
      
      public static const const_461:String = "ROFCAE_JUKEBOX_DISPOSE";
      
      public static const const_382:String = "ROFCAE_MOUSE_BUTTON";
      
      public static const const_474:String = "ROFCAE_MOUSE_ARROW";
       
      
      public function RoomObjectFurnitureActionEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
