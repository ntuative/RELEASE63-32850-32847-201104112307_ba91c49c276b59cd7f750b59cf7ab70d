package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_727:String = "";
      
      public static const const_378:int = 0;
      
      public static const const_526:int = 255;
      
      public static const const_744:Boolean = false;
      
      public static const const_564:int = 0;
      
      public static const const_523:int = 0;
      
      public static const const_372:int = 0;
      
      public static const const_1125:int = 1;
      
      public static const const_1063:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2181:String = "";
      
      private var var_1637:int = 0;
      
      private var var_2178:int = 255;
      
      private var var_2177:Boolean = false;
      
      private var var_2179:int = 0;
      
      private var var_2176:int = 0;
      
      private var var_2180:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2181 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2181;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1637 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1637;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2178 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2178;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2177 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2177;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2179 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2179;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2176 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2176;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2180 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2180;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
