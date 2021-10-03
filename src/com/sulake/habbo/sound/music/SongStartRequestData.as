package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1841:int;
      
      private var var_1810:Number;
      
      private var var_2514:Number;
      
      private var var_2515:int;
      
      private var var_2513:Number;
      
      private var var_2512:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1841 = param1;
         this.var_1810 = param2;
         this.var_2514 = param3;
         this.var_2513 = param4;
         this.var_2512 = param5;
         this.var_2515 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1841;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1810 < 0)
         {
            return 0;
         }
         return this.var_1810 + (getTimer() - this.var_2515) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2514;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2513;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2512;
      }
   }
}
