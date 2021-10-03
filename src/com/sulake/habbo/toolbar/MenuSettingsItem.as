package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2117:String;
      
      private var var_2115:Array;
      
      private var var_2116:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2117 = param1;
         this.var_2115 = param2;
         this.var_2116 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2117;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2115;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2116;
      }
   }
}
