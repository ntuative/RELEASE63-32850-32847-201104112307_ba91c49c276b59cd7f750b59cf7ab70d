package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1823:int = 0;
      
      private var var_1824:int = 0;
      
      private var var_2682:int = 0;
      
      private var var_2683:Boolean = false;
      
      private var var_2216:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1823 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1824 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2682 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2683 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2216 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1823;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1824;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2682;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2683;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2216;
      }
   }
}
