package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_69:String = "HTE_INITIALIZED";
      
      public static const const_36:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_528:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_770:String = "HTE_TOOLBAR_RESIZED";
       
      
      private var var_815:String;
      
      private var var_530:String;
      
      private var var_1232:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_815 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_815;
      }
      
      public function set method_1(param1:String) : void
      {
         this.var_530 = param1;
      }
      
      public function get method_1() : String
      {
         return this.var_530;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1232 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1232;
      }
   }
}
