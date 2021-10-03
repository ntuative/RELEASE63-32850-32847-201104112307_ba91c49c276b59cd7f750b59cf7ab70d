package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2224:Number;
      
      private var var_1891:Number;
      
      private var var_901:Number;
      
      private var var_556:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2224 = param1;
         this.var_1891 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_901 = param1;
         this.var_556 = 0;
      }
      
      public function update() : void
      {
         this.var_901 += this.var_1891;
         this.var_556 += this.var_901;
         if(this.var_556 > 0)
         {
            this.var_556 = 0;
            this.var_901 = this.var_2224 * -1 * this.var_901;
         }
      }
      
      public function get location() : Number
      {
         return this.var_556;
      }
   }
}
