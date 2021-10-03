package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_195:int = 0;
       
      
      private var var_2047:int = 0;
      
      private var var_1439:Dictionary;
      
      private var var_1823:int = 0;
      
      private var var_1824:int = 0;
      
      private var var_2216:Boolean = false;
      
      private var var_2213:int = 0;
      
      private var var_2220:int = 0;
      
      public function Purse()
      {
         this.var_1439 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2047;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2047 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1823;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1823 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1824;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1824 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1823 > 0 || this.var_1824 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2216;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2216 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2213;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2213 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2220;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2220 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1439;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1439 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1439[param1];
      }
   }
}
