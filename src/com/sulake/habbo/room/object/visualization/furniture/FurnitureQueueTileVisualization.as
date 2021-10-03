package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1375:int = 3;
      
      private static const const_1312:int = 2;
      
      private static const const_1313:int = 1;
      
      private static const const_1311:int = 15;
       
      
      private var var_311:Array;
      
      private var var_1116:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_311 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1312)
         {
            this.var_311 = new Array();
            this.var_311.push(const_1313);
            this.var_1116 = const_1311;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1116 > 0)
         {
            --this.var_1116;
         }
         if(this.var_1116 == 0)
         {
            if(this.var_311.length > 0)
            {
               super.setAnimation(this.var_311.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
