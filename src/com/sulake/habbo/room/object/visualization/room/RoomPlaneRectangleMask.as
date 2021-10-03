package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2257:Number = 0.0;
      
      private var var_2260:Number = 0.0;
      
      private var var_2259:Number = 0.0;
      
      private var var_2258:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2257 = param1;
         this.var_2260 = param2;
         this.var_2259 = param3;
         this.var_2258 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2257;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2260;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2259;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2258;
      }
   }
}
